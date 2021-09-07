from django.urls import path
from .views import Principal, Detalle, Review, filter

app_name = 'app'

urlpatterns = [
    path('', Principal.as_view(), name='principal'),
    path('<pk>', Detalle.as_view(), name='detalle_hotel'),
    path('reviews/<pk>', Review.as_view(), name='reviews'),
    path('filter/<pk>', filter, name='filter')
]
