from django.urls import path
from .views import Principal, Detalle, Review, filter, search

app_name = "app"

urlpatterns = [
    path("", Principal.as_view(), name="principal"),
    path("hoteles/<slug:slug>/", Detalle.as_view(), name="detalle_hotel"),
    path("hoteles/reviews/<pk>/", Review.as_view(), name="reviews"),
    path("hoteles/filter/<pk>/", filter, name="filter"),
    path("search/", search, name="search"),
]
