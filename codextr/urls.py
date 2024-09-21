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
    path("student/<slug:username>/", views.student, name="student-dashboard-codextr"),
    path("instructor/<slug:username>/", views.instructor, name="instructor-dashboard-codextr"),
    path("instructor/<slug:username>/create-course/", views.create_course, name="create-course-codextr"),
    path("instructor/<slug:username>/edit-course/", views.edit_course, name="edit-course-codextr"),
    path("instructor/<slug:username>/edit-course/upload-content/<slug:course_id>/", views.upload_content, name="upload-content-codextr"),
    path("instructor/<slug:username>/edit-course/delete-course/<slug:course_id>/", views.delete_course, name="delete-course-codextr")
]
