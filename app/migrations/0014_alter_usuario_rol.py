# Generated by Django 3.2.7 on 2021-09-12 21:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0013_alter_hoteles_slug'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usuario',
            name='rol',
            field=models.CharField(choices=[('pasajero)', 'Pasajero')], max_length=50),
        ),
    ]