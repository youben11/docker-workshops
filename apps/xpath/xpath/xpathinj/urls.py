from django.urls import path
from . import views

app_name = "xpathinj"

urlpatterns = [
    path('', views.login),
    path('login', views.login)
]
