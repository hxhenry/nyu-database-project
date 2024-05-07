from django.shortcuts import render

# Create your views here.
from django.contrib.auth.decorators import login_required, permission_required
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.contrib import messages
from django.contrib.auth.forms import UserCreationForm

from .models import *
from accounts.models import *
from .forms import *


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
            is_admin = user.is_superuser
        except:
            messages.error(request, 'User not found')

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            if not is_admin:
                uname = str(username).lower()
                return redirect('/profile/{}/'.format(uname))
            return redirect('profiles')
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
            email_exists = HcyCustomer.objects.filter(cemail=str(user.username)).exists()
            if email_exists:
                user.save()
                messages.success(request, f'Account created for {user.username}')

                login(request, user)
                return redirect('profiles')
            else:
                messages.error(request, 'Related email does not exit. Please try again.')
        else:
            messages.error(request, 'An error occurred. Please try again.')

    context = {'page': page, 'form': form}
    return render(request, 'users/login_register.html', context)


@login_required(login_url='')
@permission_required(perm='user.is_superuser', raise_exception=True)
def profiles(request):
    profiles = HcyCustomer.objects.all()
    context = {'profiles': profiles}
    return render(request, 'users/profiles.html', context)


def userProfile(request, pk):
    profile = HcyCustomer.objects.get(cemail=pk)
    street = profile.stid
    city = street.cid
    state = city.sid
    zipcode = street.zipcode
    context = {'profile': profile, 'street': street, 'city': city, 'state': state, 'zipcode': zipcode}
    return render(request, 'users/profile.html', context)


def createProfile(request):
    form = CustomerForm()
    if request.method == 'POST':
        form = CustomerForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('profiles')
    context = {'form': form}
    return render(request, 'users/profile_form.html', context)


def updateProfile(request, pk):
    profile = HcyCustomer.objects.get(cemail=pk)
    form = CustomerForm(instance=profile)

    if request.method == 'POST':
        form = CustomerForm(request.POST, instance=profile)
        if form.is_valid():
            form.save()
            return redirect('profiles')
    context = {'form': form}
    return render(request, 'users/profile_form.html', context)


def deleteProfile(request, pk):
    profile = HcyCustomer.objects.get(cemail=pk)
    if request.method == 'POST':
        profile.delete()
        return redirect('profiles')
    context = {'profile': profile}
    return render(request, 'users/delete_template.html', context)
