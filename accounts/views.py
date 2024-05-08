from django.shortcuts import render
from .models import *


def accounts(request):
    accountable = HcyAccount.objects.all()
    context = {'accounts': accountable}
    return render(request, 'accounts/accounts.html', context)


def account(request, pk):
    account = HcyAccount.objects.get(ano=pk)
    if account.a_type == 'S':
        savings = HcySavings.objects.get(ano=pk)
        context = {'account': account, 'savings': savings}
        return render(request, 'accounts/saving-account.html', context)
    if account.a_type == 'C':
        checking = HcyChecking.objects.get(ano=pk)
        context = {'account': account, 'checking': checking}
        return render(request, 'accounts/checking-account.html', context)
    if account.a_type == 'H':
        home = HcyHome.objects.get(ano=pk)
        loan = HcyLoan.objects.get(ano=pk)
        context = {'loan': loan, 'home': home}
        return render(request, 'accounts/home-account.html', context)
    if account.a_type == 'T':
        student = HcyStudent.objects.get(ano=pk)
        loan = HcyLoan.objects.get(ano=pk)
        context = {'loan': loan, 'student': student}
        return render(request, 'accounts/student-account.html', context)


