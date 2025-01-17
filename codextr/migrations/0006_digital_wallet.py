# Generated by Django 5.1 on 2024-09-20 21:35

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("codextr", "0005_cart"),
    ]

    operations = [
        migrations.CreateModel(
            name="Digital_Wallet",
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
                ("card_name", models.CharField(max_length=100)),
                ("card_no", models.IntegerField()),
                ("exp_date", models.DateField()),
                ("cvc", models.IntegerField()),
                ("c_balance", models.FloatField(default=0.0)),
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
