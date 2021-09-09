
from django.db.models.aggregates import Count
from django.shortcuts import render, get_object_or_404, redirect
# Create your views here.
from django.contrib.auth import authenticate, login
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.views.generic import View, DetailView
from .models import Hoteles, Comentarios
from django.db.models import F, ExpressionWrapper, IntegerField, Avg
from .forms import RegisterUserForm
from .user_permissions import is_pasajero


class Principal(View):
    template_name = 'app/index.html'

    def get(self, request, *args, **kwargs):
        comentarios = Comentarios.objects.annotate(rating=ExpressionWrapper(
            F('calificacion_comentario') * (100/5), output_field=IntegerField()
        ))[:4]

        hoteles = Hoteles.objects.annotate(rating=ExpressionWrapper(
            F('calificacion') * (100/5), output_field=IntegerField()))
        return render(request, self.template_name, {'hoteles': hoteles, 'comentarios': comentarios})


class Detalle(DetailView):
    model = Hoteles
    context_object_name = 'detalle'
    template_name = 'app/ficha.html'
    slug_field = 'slug'
    slug_url_kwarg = 'slug'

    def get_context_data(self, **kwargs):
        context = super(Detalle, self).get_context_data(**kwargs)
        context['rating'] = round(
            (100 / 5) * int(self.get_object().calificacion))

        context['comentarios'] = Comentarios.objects.filter(
            id_hotel=self.get_object().id).annotate(rating=ExpressionWrapper(
                F('calificacion_comentario') * (100/5), output_field=IntegerField()
            ))
        return context


class Review(LoginRequiredMixin, UserPassesTestMixin, View):
    login_url = '/login/'
    template_name = 'app/calificar.html'

    def get(self, request, *args, **kwargs):
        hoteles = get_object_or_404(Hoteles, pk=kwargs['pk'])
        return render(request, self.template_name, {'hoteles': hoteles})

    def post(self, request, *args, **kwargs):
        hotel = get_object_or_404(Hoteles, pk=kwargs['pk'])
        Comentarios.objects.create(
            id_hotel=hotel,
            nombre_usuario=self.request.user,
            comentario=request.POST.get('comentario'),
            calificacion_comentario=request.POST.get('estrellas')
        )
        promedio = Comentarios.objects.filter(
            id_hotel=kwargs['pk']).aggregate(Avg('calificacion_comentario'), Count('nombre_usuario'))

        hotel.calificacion = promedio['calificacion_comentario__avg']
        hotel.cant_votos = promedio['nombre_usuario__count']
        hotel.save()

        return redirect('app:principal')

    def test_func(self):
        return is_pasajero(self.request.user)


def registro(request):
    context = {
        'form': RegisterUserForm()
    }
    if request.method == 'POST':
        form = RegisterUserForm(data=request.POST)
        if form.is_valid():
            form.save()
            user = authenticate(
                username=form.cleaned_data['username'], password=form.cleaned_data['password1'])
            login(request, user)
            return redirect(to='app:principal')
        else:
            context['form'] = form
    return render(request, 'registration/registro.html', context)


def filter(request, pk):

    if pk == 'nombre':
        comentarios = Comentarios.objects.annotate(rating=ExpressionWrapper(
            F('calificacion_comentario') * (100/5), output_field=IntegerField()
        ))[:4]

        hoteles = Hoteles.objects.annotate(rating=ExpressionWrapper(
            F('calificacion') * (100/5), output_field=IntegerField())).order_by('nombre')

    elif pk == 'cal':
        comentarios = Comentarios.objects.annotate(rating=ExpressionWrapper(
            F('calificacion_comentario') * (100/5), output_field=IntegerField()
        ))[:4]

        hoteles = Hoteles.objects.annotate(rating=ExpressionWrapper(
            F('calificacion') * (100/5), output_field=IntegerField())).order_by('-calificacion')
    elif pk == 'votos':
        comentarios = Comentarios.objects.annotate(rating=ExpressionWrapper(
            F('calificacion_comentario') * (100/5), output_field=IntegerField()
        ))[:4]

        hoteles = Hoteles.objects.annotate(rating=ExpressionWrapper(
            F('calificacion') * (100/5), output_field=IntegerField())).order_by('-cant_votos')
    else:
        if pk.isdigit():
            comentarios = Comentarios.objects.annotate(rating=ExpressionWrapper(
                F('calificacion_comentario') * (100/5), output_field=IntegerField()
            ))[:4]

            pk = float(pk)
            hoteles = Hoteles.objects.annotate(rating=ExpressionWrapper(
                F('calificacion') * (100/5), output_field=IntegerField())).filter(calificacion__range=[pk, pk+0.9])
        else:
            return redirect('app:principal')
    return render(request, 'app/filtro.html', {'hoteles': hoteles, 'comentarios': comentarios})
