from django.shortcuts import render
from .models import Account, LoanAccount, CheckingAccount, SavingsAccount


def accounts(request):
    accountable = Account.objects.all()
    context = {'accounts': accountable}
    return render(request, 'accounts/accounts.html', context)


def account(request, pk):
    projectObj = Account.objects.get(id=pk)
    loanaccounts = LoanAccount.objects.all()
    checkingaccounts = CheckingAccount.objects.all()
    savingsaccounts = SavingsAccount.objects.all()
    return render(request, 'accounts/single-account.html', {'projectObj': projectObj,
                  'loanaccounts': loanaccounts, 'checkingaccounts': checkingaccounts, 'savingsaccounts': savingsaccounts})
