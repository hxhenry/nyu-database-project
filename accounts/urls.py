from django.urls import path
from . import views

urlpatterns = [
    path('', views.accounts, name='accounts'),
    path('account/<path:pk>/', views.account, name='account'),
]
