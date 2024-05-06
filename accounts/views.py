from django.shortcuts import render
from .models import Account


def accounts(request):
    accountable = Account.objects.all()
    context = {'accounts': accountable}
    return render(request, 'accounts/accounts.html', context)


def account(request, pk):
    projectObj = Account.objects.get(id=pk)
    return render(request, 'accounts/single-account.html', {'projectObj': projectObj})



