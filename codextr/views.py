from django.shortcuts import render, redirect
import codextr.models as models
from .forms import SignUpForm
from django.contrib.auth import authenticate, login
from django.contrib import messages

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
    return render(request, 'codextr/login.html')

# def login_view(request):
#     if request.method == 'POST':
#         username = request.POST['username']
#         password = request.POST['password']
        
#         user = authenticate(username=username, password=password)
        
#         if user is not None:
#             login(request, user)
#             if hasattr(user, 'student'):
#                 return redirect('student-dashboard-codextra')  
#             elif hasattr(user, 'instructor'):
#                 return redirect('instructor_dashboard-codextra')  
#         else:
#             return render(request, 'login.html', {'error': 'Invalid credentials'})
    
#     return render(request, 'login.html')

def register_user(request):
    if request.method == "POST":
        form = SignUpForm(request.POST)
        if form.is_valid():
            models.User.save()
            # #Authenticate
            # username = form.cleaned_data["username"]
            # password = form.cleaned_data["password1"]
            # user = authenticate(request, username=username, password=password)
            # login(request, user)
            # messages.success(request, "You are successfully registered in")
            return redirect("home-codextr")
    else:
        form = SignUpForm()
    
    return render(request, "codextr/signup.html", {"form": form})
