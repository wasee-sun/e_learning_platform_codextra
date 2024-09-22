from django.shortcuts import render, redirect
import codextr.models as models
from .forms import SignUpForm
from django.contrib import messages
from django.core.exceptions import ValidationError
from django.contrib.auth.password_validation import validate_password
from django.urls import reverse
from .models import User
from django.http import HttpResponseForbidden

def login_required(view_func):
    def _wrapped_view(request, username, *args, **kwargs):
        if 'user_id' not in request.session:
            return redirect('login-codextr')  # Redirect to login page
        if request.session['user_id'] != username:
            messages.error(request, "You do not have permission to access this page.")
            return redirect('home-codextr')
        return view_func(request, username, *args, **kwargs)
    return _wrapped_view

# Create your views here.
def home(request):
    courses = models.Course.objects.all()
    categories = models.Category.objects.all()
    return render(request, 'codextr/home.html', {
        "courses": courses,
        "categories": categories
    })
    
def contact(request):
    return render(request, 'codextr/contact.html')

def about(request):
    return render(request, 'codextr/about.html')

def course(request, slug):
    course = models.Course.objects.get(slug=slug)
    course_materials = models.CourseMaterial.objects.filter(course_id=course.course_id)
    course_materials_dict = {}

    for materials in course_materials:
        if materials.section_name not in course_materials_dict:
            course_materials_dict[materials.section_name] = [materials]
        else:
            course_materials_dict[materials.section_name].append(materials)

    is_logged_in = 'user_id' in request.session
    is_student = is_logged_in and hasattr(models.User.objects.get(username=request.session['user_id']), 'student')
    is_instructor = is_logged_in and hasattr(models.User.objects.get(username=request.session['user_id']), 'instructor')

    user = None
    if is_logged_in:
        # Retrieve the user object
        user = models.User.objects.get(username=request.session['user_id'])
    if is_student:
        student = models.User.objects.get(username=request.session['user_id'])
        is_enrolled = models.Enroll.objects.filter(s_user_name=student, course_id=course).exists()
    else:
        is_enrolled = False

    return render(request, 'codextr/course.html', {
        "user": user,
        "course": course,
        "course_materials": course_materials_dict,
        "is_logged_in": is_logged_in,
        "is_student": is_student,
        "is_instructor": is_instructor,
        "is_enrolled": is_enrolled,  
    })
    
def course_material(request, slug1, slug2):
    course = models.Course.objects.get(slug=slug1)
    course_material = models.CourseMaterial.objects.get(course_id=course.course_id, slug=slug2)
    course_materials = models.CourseMaterial.objects.filter(course_id=course.course_id)
    course_materials_dict = {}
    for materials in course_materials:
        if materials.section_name not in course_materials_dict:
            course_materials_dict[materials.section_name] = [materials]
        else:
            course_materials_dict[materials.section_name].append(materials)
    return render(request, "codextr/course-materials.html", {
        "course" : course,
        "course_materials" : course_materials_dict,
        "course_material" : course_material
    })

def terms_conditions(request):
    return render(request, 'codextr/terms_conditions.html')


def login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        
        try:
            # Authenticate the user manually since you're using a custom model
            user = User.objects.get(username=username)
            if user.check_password(password) or user.login_check(password):  # Check the password with your custom method
                
                # Log the user in using Django's session system
                request.session['user_id'] = user.username
                
                # Check if the user is a student or instructor
                if hasattr(user, 'student'):
                    request.session['user_role'] = 'student'
                    return redirect('student-dashboard-codextr', username=user.username)
                elif hasattr(user, 'instructor'):
                    request.session['user_role'] = 'instructor'
                    return redirect('instructor-dashboard-codextr', username=user.username)
            else:
                messages.error(request, "Invalid credentials.")
        except User.DoesNotExist:
            messages.error(request, "Invalid credentials.")
    
    return render(request, 'codextr/login.html')

def logout_view(request):
    # Clear the session
    if 'user_id' in request.session:
        del request.session['user_id']
        messages.success(request, "You have been logged out successfully.")
    else:
        messages.warning(request, "You are not logged in.")
    
    return redirect('login-codextr')

def is_logged_in(request):
    return 'user_id' in request.session

@login_required
def student(request, username):
    user = models.User.objects.get(username=username)
    enrolls = models.Enroll.objects.filter(s_user_name=user.username)
    courses = []
    for enroll in enrolls:
        courses.append(models.Course.objects.get(course_name=enroll.course_id))
    return render(request, 'codextr/student-dashboard.html', {
        "user": user,
        "courses": courses
    })

@login_required
def instructor(request, username):
    user = models.User.objects.get(username=username)
    courses = models.Course.objects.filter(inst_user_name=user.username)
    return render(request, 'codextr/instructor-dashboard.html', {
        "user": user,
        "courses": courses
    })

def register_user(request):
    if request.method == 'POST':
        username = request.POST['username']
        f_name = request.POST['f_name']
        l_name = request.POST['l_name']
        email = request.POST['email']
        password1 = request.POST['password1']
        password2 = request.POST['password2']
        role = request.POST['role']
        
        if models.User.objects.filter(username=username).exists():
            messages.error(request, "Username already exists.")
            return redirect('signup-codextr')

        # Validate that passwords match
        if password1 != password2:
            messages.error(request, "Passwords do not match.")
            return redirect('signup-codextr')

        # Create a new user (Student or Instructor)
        if role == 'student':
            user = models.Student(
                username=username,
                f_name=f_name,
                l_name=l_name,
                email=email,
                password=password1
            )
        elif role == 'teacher':
            user = models.Instructor(
                username=username,
                f_name=f_name,
                l_name=l_name,
                email=email,
                password=password1
            )
        else:
            messages.error(request, "Invalid role selected.")
            return redirect('signup-codextr')
        
        try:
            validate_password(password1, user)
            user.set_password(password1)
            user.save()
            messages.success(request, "Account created successfully.")
            return redirect('login-codextr')
        except ValidationError as e:
            messages.error(request, e.messages)
            return redirect('signup-codextr')
        
    return render(request, 'codextr/signup.html')

@login_required
def update_student_profile(request, username):
    user = models.Student.objects.get(username=username)
    digital_wallet = models.Digital_Wallet.objects.get(s_user_name=user)
    
    if request.method == 'POST':
        user.f_name = request.POST['f_name']
        user.l_name = request.POST['l_name']
        user.email = request.POST['email']
        user.save()
        digital_wallet.card_name = request.POST['card_name']
        digital_wallet.card_no = request.POST['card_no']
        digital_wallet.exp_date = request.POST['exp_date']
        digital_wallet.cvc = request.POST['cvc']
        digital_wallet.save()
        messages.success(request, "Profile updated successfully.")
        return redirect('student-dashboard-codextr', username=username)

    return render(request, 'codextr/student_profile.html', {
        'user': user,
        "wallet": digital_wallet
    })

@login_required
def update_instructor_profile(request, username):
    user = models.Instructor.objects.get(username=username)

    if request.method == 'POST':
        user.f_name = request.POST['f_name']
        user.l_name = request.POST['l_name']
        user.email = request.POST['email']
        user.bank_account = request.POST['bank_account']
        user.routing_no = request.POST['routing_no']
        user.save()
        messages.success(request, "Profile updated successfully.")
        return redirect('instructor-dashboard-codextr', username=username)

    return render(request, 'codextr/instructor-profile.html', {
        'user': user
    })

@login_required
def create_course(request, username):
    user = models.User.objects.get(username=username)
    categories = models.Category.objects.all()
    difficulty_level = models.Course.DIFFICULTY
    
    if request.method == 'POST':
        course_name = request.POST.get('courseName')
        description = request.POST.get('description')
        category = models.Category.objects.get(cat_name=request.POST.get('category'))
        difficulty = request.POST.get('difficultyLevel')
        price = float(request.POST.get('price'))
        course_img = request.FILES.get('courseImage')  # Use request.FILES for file uploads
        
        if models.Course.objects.filter(course_name=course_name).exists():
            messages.error(request, "Course name already exists.")
            return redirect('create-course-codextr', username)

        # Create the course object
        course = models.Course(
            course_name=course_name,
            course_img=course_img,
            inst_user_name=user.instructor,  # Use ForeignKey relation (Instructor object)
            description=description,
            cat_id=category,
            difficulty=difficulty,
            price=price,
        )
        course.save()

        messages.success(request, "Course created successfully.")
        return redirect("instructor-dashboard-codextr", username)

    return render(request, 'codextr/create-course.html', {
        "user": user,
        "categories": categories,
        "difficulty_level": difficulty_level
    })

@login_required
def edit_course(request, username):
    user = models.User.objects.get(username=username)
    courses = models.Course.objects.filter(inst_user_name=user.username)
    return render(request, 'codextr/edit-course.html', {
        "user": user,
        "courses": courses,
    })

@login_required
def delete_course(request, username, course_id):
    course = models.Course.objects.get(course_id=course_id)
    messages.success(request, f"Course '{course.course_name}' deleted successfully.")
    course.delete()
    return redirect('instructor-dashboard-codextr', username)

@login_required
def upload_content(request, username, course_id):
    user = models.User.objects.get(username=username)
    course = models.Course.objects.get(course_id=course_id)
    
    if request.method == 'POST':
        section_no = request.POST['section_no']
        section_name = request.POST['section_name']
        m_type = request.POST['m_type']
        m_title = request.POST['m_title']
        file_upload = request.FILES['file_upload']
        duration = request.POST['duration']

        course_material = models.CourseMaterial(
            course_id=course,
            section_no=section_no,
            section_name=section_name,
            m_type=m_type,
            m_title=m_title,
            file_loc=file_upload,
            duration=duration
        )
        course_material.save()

        messages.success(request, f"Course material '{m_title}' uploaded successfully.")
        return redirect('instructor-dashboard-codextr', user.username) 
    
    return render(request, 'codextr/upload-content.html', {
        "user": user,
        "course": course
    })

@login_required
def delete_content(request, username, course_id):
    user = models.User.objects.get(username=username)
    course = models.Course.objects.get(course_id=course_id)
    course_materials = models.CourseMaterial.objects.filter(course_id=course.course_id)
    course_materials_dict = {}
    for materials in course_materials:
        if materials.section_name not in course_materials_dict:
            course_materials_dict[materials.section_name] = [materials]
        else:
            course_materials_dict[materials.section_name].append(materials)
    categories = models.Category.objects.all()
    difficulty_level = models.Course.DIFFICULTY
    
    if request.method == 'POST':
        course_name = request.POST.get('courseName')
        description = request.POST.get('description')
        category = models.Category.objects.get(cat_name=request.POST.get('category'))
        difficulty = request.POST.get('difficultyLevel')
        price = float(request.POST.get('price'))
        course_img = request.FILES.get('courseImage') 
        
        course.course_name = course_name
        course.description = description
        course.cat_id = category
        course.difficulty = difficulty
        course.price = price
        if course_img:  # Only update image if a new one is provided
            course.course_img = course_img
        
        course.save()

        messages.success(request, "Course Updated successfully.")
        return redirect("instructor-dashboard-codextr", username)
    
    return render(request, 'codextr/delete-content.html', {
        "user": user,
        "course": course,
        "course_materials": course_materials_dict,
        "categories": categories,
        "difficulty_level": difficulty_level
    })
    
@login_required
def delete_material(request, username, course_id, material_id):
    course_material = models.CourseMaterial.objects.get(id=material_id)
    messages.success(request, f"Course material '{course_material.m_title}' deleted successfully.")
    course_material.delete()
    return redirect('delete-content-codextr', username, course_id)



@login_required
def transaction(request, username, course_id):
    user = models.User.objects.get(username=username)
    course = models.Course.objects.get(course_id=course_id)
    return render(request, 'codextr/transaction.html', {
        "user": user,
        "course": course
    })
    
@login_required
def add_to_cart(request, username, course_id):
    # Get the student based on the username
    student = models.Student.objects.get(username=username)
    # Get the course based on the course_id
    course = models.Course.objects.get(course_id=course_id)
    
    cart_item, created = models.Cart.objects.get_or_create(s_user_name=student, course_id=course)

    if created:
        # Successfully added to the cart
        messages.success(request, f"Course '{course.course_name}' added to your cart.")
    else:
        messages.warning(request, f"Course '{course.course_name}' is already in your cart.")

    return redirect('student-dashboard-codextr', username)

@login_required
def cart(request, username):
    user = models.User.objects.get(username=username)
    cart_items = models.Cart.objects.filter(s_user_name=user)
    courses = {}
    total_price = 0

    for cart_item in cart_items:
        courses[cart_item.order_id] = models.Course.objects.get(course_name=cart_item.course_id)
        total_price += courses[cart_item.order_id].price
        
    return render(request, 'codextr/cart.html', {
        "user": user,
        "cart_items": cart_items,
        "courses": courses,
        "total_price": total_price
    })
    
    
@login_required
def checkout(request, username):
    user = models.User.objects.get(username=username)
    cart_items = models.Cart.objects.filter(s_user_name=user)
    courses = {}
    total_price = 0

    try:
        wallet = models.Digital_Wallet.objects.get(s_user_name=user)
    except models.Digital_Wallet.DoesNotExist:
        messages.error(request, "Wallet not found. Create a wallet in profile")
        return redirect('student-dashboard-codextr', username)

    # Calculate total price and get courses from cart items
    for cart_item in cart_items:
        course = models.Course.objects.get(course_name=cart_item.course_id)
        courses[cart_item.order_id] = course
        total_price += course.price

    # Process the payment on POST request
    if request.method == 'POST':
        if float(wallet.c_balance) < total_price:
            messages.error(request, "Insufficient balance")
            return redirect("student-dashboard-codextr", username)
        
        # Deduct the amount from the wallet balance
        wallet.c_balance -= total_price
        wallet.save()
        
        student = models.Student.objects.get(username=username)
        print(student)
    
        for cart_item in cart_items:
            course = courses[cart_item.order_id]

            transaction = models.Transaction.objects.create(
                s_user_name=student,  # The student purchasing the course
                order_id=cart_item,  # The cart item representing the purchase
                course_id=course  # The course being purchased
            )
            transaction.save()

            enroll = models.Enroll.objects.create(
                s_user_name=student,  # The student
                course_id=course,  # The course
                order_id=cart_item,  # The order (from the cart)
                t_id=transaction  # Link to the transaction
            )
            enroll.save()

        # If successful, show a success message
        messages.success(request, "Payment successful")
        return redirect("student-dashboard-codextr", username)

    # Render the checkout page with the necessary data
    return render(request, 'codextr/checkout.html', {
        "user": user,
        "cart_items": cart_items,
        "courses": courses,
        "total_price": total_price,
        "wallet": wallet
    })

