from django.shortcuts import render

# Create your views here.
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.contrib import messages
from django.contrib.auth.forms import UserCreationForm


def logoutUser(request):
    logout(request)
    messages.error(request, 'User was logged out successfully')
    return redirect('login')


def loginUser(request):
    page = 'login'

    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']

        try:
            user = User.objects.get(username=username)
        except:
            messages.error(request, 'User not found')

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            return redirect('customer_review')
        else:
            messages.error(request, 'Incorrect username or password')

    return render(request, 'users/login_register.html')


def registerUser(request):
    page = 'register'
    form = UserCreationForm()

    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.username = user.username.lower()
            user.save()
            messages.success(request, f'Account created for {user.username}')

            login(request, user)
            return redirect('customer_review')
        else:
            messages.error(request, 'An error occurred. Please try again.')

    context = {'page': page, 'form': form}
    return render(request, 'users/login_register.html', context)
