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
    path('logout/', views.logout_view, name='logout-codextr'),
    path("student/<slug:username>/", views.student, name="student-dashboard-codextr"),
    path("instructor/<slug:username>/", views.instructor, name="instructor-dashboard-codextr"),
    path('student/<str:username>/add-to-cart/<int:course_id>/', views.add_to_cart, name='add-to-cart'),
    path('student/cart/<str:username>/', views.cart, name='cart-codextr'),
    path('student/cart/<str:username>/checkout/', views.checkout, name='checkout-codextr'),
    path('student/update/<str:username>/', views.update_student_profile, name='update-student-profile'),
    path('instructor/update/<str:username>/', views.update_instructor_profile, name='update-instructor-profile'),
    path("instructor/<slug:username>/create-course/", views.create_course, name="create-course-codextr"),
    path("instructor/<slug:username>/edit-course/", views.edit_course, name="edit-course-codextr"),
    path("instructor/<slug:username>/edit-course/upload-content/<slug:course_id>/", views.upload_content, name="upload-content-codextr"),
    path("instructor/<slug:username>/edit-course/delete-content/<slug:course_id>/", views.delete_content, name="delete-content-codextr"),
    path("instructor/<slug:username>/edit-course/delete-course/<slug:course_id>/", views.delete_course, name="delete-course-codextr"),
    path("instructor/<slug:username>/edit-course/delete-content/<slug:course_id>/delete-material/<slug:material_id>/", views.delete_material, name="delete-material-codextr"),
]
