# Generated by Django 3.2 on 2021-09-07 02:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0006_auto_20210906_2303'),
    ]

    operations = [
        migrations.AlterField(
            model_name='hoteles',
            name='calificacion',
            field=models.DecimalField(decimal_places=2, max_digits=11),
        ),
    ]
