# Generated by Django 3.2 on 2021-09-07 01:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0004_alter_comentarios_id_hotel'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='comentarios',
            options={'ordering': ['-fecha'], 'verbose_name_plural': 'Comentarios'},
        ),
        migrations.AddField(
            model_name='hoteles',
            name='direccion',
            field=models.CharField(max_length=200, null=True),
        ),
    ]
