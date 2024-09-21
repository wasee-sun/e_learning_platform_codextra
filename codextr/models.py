from django.db import models
from django.contrib.auth.hashers import make_password, check_password
import os
from django.utils.text import slugify

class User(models.Model):
    username = models.CharField(max_length=150, unique=True, primary_key=True)
    password = models.CharField(max_length=128)  # Store hashed password
    f_name = models.CharField(max_length=50)
    l_name = models.CharField(max_length=50)
    email = models.EmailField(max_length=100)

    def set_password(self, raw_password):
        """Hash and set the user's password."""
        self.password = make_password(raw_password)

    def check_password(self, raw_password):
        """Verify if the provided password matches the stored hashed password."""
        return check_password(raw_password, self.password)
    
    def login_check(self, raw_password):
        """Verify if the provided password matches the stored hashed password."""
        return raw_password == self.password

    def __str__(self):
        return f'{self.f_name} {self.l_name} ({self.username})'
    
class Student(User):
    level = models.IntegerField(default=0)

    def __str__(self):
        return f"{self.f_name} {self.l_name}"

class Instructor(User):
    bank_account = models.IntegerField()
    routing_no = models.IntegerField()

    def __str__(self):
        return f"{self.f_name} {self.l_name}"
    
class Category(models.Model):
    cat_id = models.AutoField(primary_key=True)
    cat_name = models.CharField(max_length=100)
    
    def __str__(self):
        return self.cat_name
    
class Course(models.Model):
    DIFFICULTY = [
        ('beginner', 'Beginner'),
        ('intermediate', 'Intermediate'),
        ('advanced', 'Advanced'),
    ]
    
    course_id = models.AutoField(primary_key=True)
    course_name = models.CharField(max_length=100)
    course_img = models.ImageField(upload_to='course_images/', blank=True, null=True)
    difficulty = models.CharField(
        max_length=15,
        choices=DIFFICULTY,
        default='beginner',
    )
    price = models.FloatField(default=0.00)
    description = models.CharField(max_length=500)
    inst_user_name = models.ForeignKey(Instructor, on_delete=models.CASCADE)
    cat_id = models.ForeignKey(Category, on_delete=models.CASCADE)
    slug = models.SlugField(default="", null=False, max_length=300)
    
    def __str__(self):
        return self.course_name
    
    def save(self, *args, **kwargs):
        self.slug = slugify(self.course_name)
        super().save(*args, **kwargs)
    
class CourseMaterial(models.Model):
    TYPE = [
        ('pdf', 'PDF'),
        ('video', 'Video'),
    ]
    
    course_id = models.ForeignKey(Course, on_delete=models.CASCADE)
    section_no = models.IntegerField()
    section_name = models.CharField(max_length=100)
    m_type = models.CharField(
        max_length=5,
        choices=TYPE,
        default='pdf',
    )
    m_title = models.CharField(max_length=100)
    file_loc = models.FileField(upload_to='')  # Initially empty
    duration = models.FloatField(blank=True, null=True)
    slug = models.SlugField(default="", null=False, max_length=300)
    
    class Meta:
        constraints = [
            models.UniqueConstraint(fields=['course_id', 'section_no', 'm_title'], name='unique_course_material')
        ]
    
    def save(self, *args, **kwargs):
        # Determine the folder based on m_type
        self.slug = slugify(self.m_title)
        if self.m_type == 'pdf':
            self.file_loc.name = os.path.join('pdfs', os.path.basename(self.file_loc.name))
        elif self.m_type == 'video':
            self.file_loc.name = os.path.join('videos', os.path.basename(self.file_loc.name))
        super().save(*args, **kwargs)
    
    def __str__(self):
        return self.m_title

class Cart(models.Model):
    s_user_name = models.ForeignKey(Student, on_delete=models.CASCADE)
    order_id = models.AutoField(primary_key=True)
    
    def __str__(self):
        return str(f"{self.s_user_name} {self.order_id}")
    
class Digital_Wallet(models.Model):
    s_user_name = models.ForeignKey(Student, on_delete=models.CASCADE)
    card_name = models.CharField(max_length=100)
    card_no = models.IntegerField()
    exp_date = models.DateField()
    cvc = models.IntegerField()
    c_balance = models.FloatField(default=0.00)
    
    def __str__(self):
        return self.card_name
    
class Transaction(models.Model):
    order_id = models.ForeignKey(Cart, on_delete=models.CASCADE)
    course_id = models.ForeignKey(Course, on_delete=models.CASCADE)
    t_id = models.AutoField(primary_key=True)
    t_date = models.DateField(auto_now_add=True)
    
    def __str__(self):
        return str(f"{self.order_id} {self.course_id} {self.t_id}")
    
class Enroll(models.Model):
    s_user_name = models.ForeignKey(Student, on_delete=models.CASCADE)
    course_id = models.ForeignKey(Course, on_delete=models.CASCADE)
    order_id = models.ForeignKey(Cart, on_delete=models.CASCADE)
    rating_no = models.IntegerField(null=True, blank=True)
    description = models.CharField(max_length=500, blank=True, null=True)
    
    def __str__(self):
        return f"{self.s_user_name} {self.course_id}"
