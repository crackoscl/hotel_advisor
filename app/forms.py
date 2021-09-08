
from django.contrib.auth import get_user_model
from django.contrib.auth.forms import UserCreationForm
from django.core.exceptions import ValidationError
from django.db.models import fields
from django.forms import TextInput, EmailInput, PasswordInput


User = get_user_model()


class RegisterUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username', 'email',
                  'apellido_paterno', 'apellido_materno']
        widgets = {
            'username': TextInput(attrs={'class': 'form-control', 'placeholder': 'Nombre Usuario'}),
            'email': EmailInput(attrs={'class': 'form-control', 'placeholder': 'Email'}),
            'rut': TextInput(attrs={'class': 'form-control', 'placeholder': 'Rut'}),
            'apellido_paterno': TextInput(attrs={'class': 'form-control', 'placeholder': 'Apellido paterno'}),
            'apellido_materno': TextInput(attrs={'class': 'form-control', 'placeholder': 'Apellido Materno'}),
        }

    def __init__(self, *args, **kwargs):
        super(RegisterUserForm, self).__init__(*args, **kwargs)
        self.fields['password1'].widget = PasswordInput(
            attrs={'class': 'form-control', 'placeholder': 'Contraseña'})
        self.fields['password2'].widget = PasswordInput(
            attrs={'class': 'form-control', 'placeholder': 'Confirmación Contraseña'})
        self.fields['email'].required = True
