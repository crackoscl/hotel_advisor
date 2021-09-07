from django.contrib import admin

# Register your models here.
from .models import Usuario, Hoteles, Atributos, Comentarios

admin.site.register(Usuario)
admin.site.register(Hoteles)
admin.site.register(Atributos)
admin.site.register(Comentarios)
