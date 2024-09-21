from django.urls import path, include
from . import views

urlpatterns = [
    path("", views.home, name="home-codextr"),
    path("course/<slug:slug>/", views.course, name = "course-codextr"),
    path("course/<slug:slug1>/<slug:slug2>/", views.course_material, name = "course-material-codextr"),
    path("contact-us/", views.contact, name="contact-codextr"),
    path("about/", views.about, name="about-codextr"),
    path("terms-conditions/", views.terms_conditions, name="terms-conditions-codextr"),
    path("login/", views.login_view, name="login-codextr"),
    path("signup/", views.register_user, name="signup-codextr"),
]
