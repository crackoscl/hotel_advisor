# Generated by Django 3.2 on 2021-09-07 02:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0005_auto_20210906_2212'),
    ]

    operations = [
        migrations.AddField(
            model_name='comentarios',
            name='calificacion_comentario',
            field=models.DecimalField(decimal_places=2, max_digits=11, null=True),
        ),
        migrations.AlterField(
            model_name='hoteles',
            name='calificacion',
            field=models.IntegerField(),
        ),
    ]
