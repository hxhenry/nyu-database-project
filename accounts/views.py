from django.shortcuts import render
from .models import HcyAccount


def accounts(request):
    accountable = HcyAccount.objects.all()
    context = {'accounts': accountable}
    return render(request, 'accounts/accounts.html', context)


def account(request, pk):
    projectObj = HcyAccount.objects.get(ano=pk)
    return render(request, 'accounts/single-account.html', {'projectObj': projectObj})
