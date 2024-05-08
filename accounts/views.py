from django.contrib.auth.decorators import login_required, permission_required
from django.http import HttpResponseForbidden
from django.shortcuts import render
from .models import *


@login_required(login_url='')
@permission_required(perm='user.is_superuser', raise_exception=True)
def accounts(request):
    accountable = HcyAccount.objects.all()
    context = {'accounts': accountable}
    return render(request, 'accounts/accounts.html', context)


@login_required(login_url='')
def account(request, pk):
    account = HcyAccount.objects.get(ano=pk)
    if not request.user.is_superuser and request.user.username != account.cemail.cemail:
        return HttpResponseForbidden("You do not have permission to access this page.")
    if account.a_type == 'S':
        savings = HcySavings.objects.get(ano=pk)
        context = {'account': account, 'savings': savings}
        return render(request, 'accounts/saving-account.html', context)
    if account.a_type == 'C':
        checking = HcyChecking.objects.get(ano=pk)
        context = {'account': account, 'checking': checking}
        return render(request, 'accounts/checking-account.html', context)
    if account.a_type == 'L':
        loan = HcyLoan.objects.get(ano=pk)
        if loan.l_type == 'L':
            context = {'loan': loan}
            return render(request, 'accounts/loan-account.html', context)
        if loan.l_type == 'H':
            home = HcyHome.objects.get(ano=pk)
            context = {'loan': loan, 'home': home}
            return render(request, 'accounts/home-account.html', context)
        if loan.l_type == 'T':
            student = HcyStudent.objects.get(ano=pk)
            context = {'loan': loan, 'student': student}
            return render(request, 'accounts/student-account.html', context)

