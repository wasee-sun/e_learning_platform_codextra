# Generated by Django 5.1 on 2024-09-20 21:35

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("codextr", "0006_digital_wallet"),
    ]

    operations = [
        migrations.CreateModel(
            name="Transaction",
            fields=[
                ("t_id", models.AutoField(primary_key=True, serialize=False)),
                ("t_date", models.DateField(auto_now_add=True)),
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
            ],
        ),
    ]