# Generated by Django 3.2.7 on 2021-09-12 23:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0015_alter_usuario_options'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usuario',
            name='rol',
            field=models.CharField(blank=True, choices=[('pasajero', 'Pasajero')], max_length=50),
        ),
    ]
