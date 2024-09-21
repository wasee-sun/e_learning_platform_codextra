from django.shortcuts import render, redirect
import codextr.models as models
from .forms import SignUpForm
from django.contrib import messages
from django.core.exceptions import ValidationError
from django.contrib.auth.password_validation import validate_password
from django.urls import reverse

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
    return render(request, 'codextr/course.html', {
        "course" : course,
        "course_materials" : course_materials_dict
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
            user = models.User.objects.get(username=username)
            if user.login_check(password) or user.check_password(password):
                # Check if user is a Student or Instructor
                if hasattr(user, 'student'):
                    return redirect('student-dashboard-codextr', username=user.username)  # Replace with your student dashboard URL
                elif hasattr(user, 'instructor'):
                    return redirect('instructor-dashboard-codextr', username=user.username)  # Replace with your instructor dashboard URL
            else:
                messages.error(request, "Invalid credentials.")
        except models.User.DoesNotExist:
            messages.error(request, "Invalid credentials.")
            
    return render(request, 'codextr/login.html')

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
        sections = []
        section_no = []
        
        if models.Course.objects.filter(course_name=course_name).exists():
            messages.error(request, "Course name already exists.")
            return redirect('create-course-codextr', username)

        # Collect section data
        section_num = 1
        while True:
            section = request.POST.get(f'section{section_num}')
            if not section:
                break
            sections.append(section)
            section_no.append(section_num)
            section_num += 1

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

        return redirect("instructor-dashboard-codextr", username)

    return render(request, 'codextr/create-course.html', {
        "user": user,
        "categories": categories,
        "difficulty_level": difficulty_level
    })

def edit_course(request, username):
    user = models.User.objects.get(username=username)
    courses = models.Course.objects.filter(inst_user_name=user.username)
    return render(request, 'codextr/edit-course.html', {
        "user": user,
        "courses": courses,
    })

def delete_course(request, username, course_id):
    course = models.Course.objects.get(course_id=course_id)
    messages.success(request, f"Course '{course.course_name}' deleted successfully.")
    course.delete()
    return redirect('instructor-dashboard-codextr', username)

def upload_content(request, username, course_id):
    user = models.User.objects.get(username=username)
    course = models.Course.objects.get(course_id=course_id)
    
    if request.method == 'POST':
        content_name = request.POST.get('contentName')
        section_no = request.POST.get('sectionNo')
        
        content = models.CourseMaterial(
            course_id=course.course_id,
        )
    
    return render(request, 'codextr/upload-content.html', {
        "user": user,
        "course": course
    })
