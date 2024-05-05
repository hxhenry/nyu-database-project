from django.contrib import admin

# Register your models here.
from .models import Account, LoanAccount, HomeLoanAccount, CheckingAccount, StudentLoanAccount, SavingsAccount

admin.site.register(Account)
admin.site.register(LoanAccount)
admin.site.register(HomeLoanAccount)
admin.site.register(CheckingAccount)
admin.site.register(StudentLoanAccount)
admin.site.register(SavingsAccount)
