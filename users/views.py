from django.db import transaction
from django.http import HttpResponseForbidden
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
    # messages.error(request, 'User was logged out successfully')
    return redirect('login')


def loginUser(request):

    if request.user.is_authenticated:
        if request.user.is_superuser:
            return redirect('profiles')
        return redirect('/profile/{}/'.format(request.user.username))

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
                return redirect('/profile/{}/'.format(user.username))
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


@login_required(login_url='')
def userProfile(request, pk):
    if not request.user.is_superuser and request.user.username != pk:
        return HttpResponseForbidden("You do not have permission to access this page.")
    profile = HcyCustomer.objects.get(cemail=pk)
    street = profile.stid
    city = street.cid
    state = city.sid
    zipcode = street.zipcode
    accounts = HcyAccount.objects.all()
    context = {'profile': profile,
               'street': street,
               'city': city,
               'state': state,
               'zipcode': zipcode,
               'accounts': accounts}
    return render(request, 'users/profile.html', context)


@login_required(login_url='')
def createProfile(request):
    form = CustomerForm()
    if request.method == 'POST':
        form = CustomerForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('profiles')
    context = {'form': form}
    return render(request, 'users/profile_form.html', context)


@login_required(login_url='')
def updateProfile(request, pk):
    if not request.user.is_superuser and request.user.username != pk:
        return HttpResponseForbidden("You do not have permission to access this page.")
    profile = HcyCustomer.objects.get(cemail=pk)
    cuform = CustomerForm(instance=profile)
    if request.method == 'POST':
        cuform = CustomerForm(request.POST, instance=profile)
        if cuform.is_valid():
            with transaction.atomic():
                HcyCustomer.objects.select_for_update()
                updateCustomer = HcyCustomer.objects.get(cemail=pk)
                updateCustomer.cusfname = cuform.cleaned_data['cusfname']
                updateCustomer.cuslname = cuform.cleaned_data['cuslname']
                updateCustomer.captno = cuform.cleaned_data['captno']
                updateCustomer.save()
            if request.user.is_superuser:
                return redirect('profiles')
            return redirect('/profile/{}/'.format(profile.cemail))
    context = {'cuform': cuform}
    return render(request, 'users/profile_form.html', context)


def deleteProfile(request, pk):
    profile = HcyCustomer.objects.get(cemail=pk)
    if request.method == 'POST':
        profile.delete()
        return redirect('profiles')
    context = {'profile': profile}
    return render(request, 'users/delete_template.html', context)
