# Generated by Django 5.1 on 2024-09-20 21:35

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("codextr", "0007_transaction"),
    ]

    operations = [
        migrations.CreateModel(
            name="Enroll",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("rating_no", models.IntegerField()),
                ("description", models.CharField(max_length=500)),
                (
                    "course_id",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE, to="codextr.course"
                    ),
                ),
                (
                    "order_id",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE, to="codextr.cart"
                    ),
                ),
                (
                    "s_user_name",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="codextr.student",
                    ),
                ),
            ],
        ),
    ]