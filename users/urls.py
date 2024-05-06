from django.urls import path
from . import views

urlpatterns = [
    path('', views.loginUser, name='login'),
    path('logout/', views.logoutUser, name='logout'),
    path('register/', views.registerUser, name='register'),
    path('profiles/', views.profiles, name='profiles'),
    path('profiles/<str:pk>/', views.userProfile, name='profile'),

    path('create_profile/', views.createProfile, name='create_Profile'),
    path('update_profile/<str:pk>', views.updateProfile, name='update_profile'),


]