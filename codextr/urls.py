from django.urls import path, include
from . import views

urlpatterns = [
    path("", views.home, name="home-codextra"),
    path("course/<slug:slug>/", views.course, name = "course-codextra"),
    path("course/<slug:slug1>/<slug:slug2>/", views.course_material, name = "course-material-codextra"),
    path("contact-us/", views.contact, name="contact-codextra"),
    path("about/", views.about, name="about-codextra"),
    path("terms-conditions/", views.terms_conditions, name="terms-conditions-codextra"),
    path("login/", views.login_view, name="login-codextra"),
    path("signup/", views.register_user, name="signup-codextra"),
]
