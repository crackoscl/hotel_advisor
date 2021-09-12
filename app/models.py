from django.db import models
from django.contrib.auth.models import AbstractUser
from django.db.models.signals import pre_save
from django.utils.text import slugify

# Create your models here.


class Usuario(AbstractUser):
    ROLES = (("pasajero)", "Pasajero"),)
    apellido_paterno = models.CharField(
        max_length=50, null=True, verbose_name="Apellido Paterno"
    )
    apellido_materno = models.CharField(
        max_length=50, null=True, verbose_name="Apellido Materno"
    )
    rol = models.CharField(max_length=50, choices=ROLES)

    class Meta:
        verbose_name_plural = "Usuarios"

    def __str__(self):
        return f"{self.username}"


class Atributos(models.Model):
    nombre = models.CharField(max_length=50)

    class Meta:
        verbose_name_plural = "Atributos"

    def __str__(self):
        return f"{self.nombre}"


class Hoteles(models.Model):
    nombre = models.CharField(max_length=50)
    descripcion = models.CharField(max_length=200)
    direccion = models.CharField(max_length=200, null=True)
    calificacion = models.DecimalField(
        max_digits=11, decimal_places=2, default=0)
    cant_votos = models.IntegerField(default=0)
    atributos = models.ManyToManyField(Atributos, related_name="atributos")
    slug = models.SlugField(max_length=255, unique=True, null=True, blank=True)

    class Meta:
        verbose_name_plural = "Hoteles"
        ordering = ["-cant_votos"]

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.nombre)
        super(Hoteles, self).save(*args, **kwargs)

    def __str__(self):
        """Unicode representation of MODELNAME."""
        return f"{self.nombre} - {self.calificacion} - {self.cant_votos}"


class Comentarios(models.Model):
    id_hotel = models.ForeignKey(
        Hoteles, null=True, on_delete=models.CASCADE, related_name="hoteles"
    )
    nombre_usuario = models.CharField(max_length=50)
    comentario = models.TextField(max_length=500)
    fecha = models.DateTimeField(auto_now=True)
    calificacion_comentario = models.DecimalField(
        max_digits=11, decimal_places=2, null=True, default=0
    )

    class Meta:
        verbose_name_plural = "Comentarios"
        ordering = ["-fecha"]

    def __str__(self) -> str:
        return f"{self.nombre_usuario} - {self.calificacion_comentario}"
