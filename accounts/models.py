import uuid

from django.contrib.auth.models import User
from django.db import models
from users.models import Street, University


# Create your models here.
class Account(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    account_number = models.CharField(max_length=100, unique=True)
    account_dateopen = models.DateField(auto_now=True)
    type = (
        ('Checking', 'Checking'),
        ('Savings', 'Savings'),
        ('Loan', 'Loan'),
    )
    account_type = models.CharField(max_length=100, choices=type, null=True)
    street_name = models.ForeignKey(Street, on_delete=models.CASCADE, null=True)
    id = models.UUIDField(primary_key=True, default=uuid.uuid4,
                          editable=False, unique=True)

    def __str__(self):
        return self.account_number


class LoanAccount(models.Model):
    account_number = models.OneToOneField(Account, on_delete=models.CASCADE)
    loan_date = models.DateField(auto_now=True)
    type = (
        ('HomeLoan', 'HomeLoan'),
        ('StudentLoan', 'StudentLoan'),
    )
    loan_type = models.CharField(max_length=100, choices=type, null=True)
    loan_amount = models.DecimalField(max_digits=10, decimal_places=2)
    loan_months = models.PositiveSmallIntegerField()
    loan_payment = models.DecimalField(max_digits=10, decimal_places=2)
    id = models.UUIDField(primary_key=True, default=uuid.uuid4,
                          editable=False, unique=True)


class CheckingAccount(models.Model):
    account_number = models.OneToOneField(Account, on_delete=models.CASCADE)
    checking_servicecharge = models.DecimalField(max_digits=10, decimal_places=2)
    id = models.UUIDField(primary_key=True, default=uuid.uuid4,
                          editable=False, unique=True)


class SavingsAccount(models.Model):
    account_number = models.OneToOneField(Account, on_delete=models.CASCADE)
    savings_interest = models.DecimalField(max_digits=10, decimal_places=2)
    id = models.UUIDField(primary_key=True, default=uuid.uuid4,
                          editable=False, unique=True)


class StudentLoanAccount(models.Model):
    account_number = models.OneToOneField(Account, on_delete=models.CASCADE)
    student_id = models.CharField(max_length=100, unique=True)
    student_is_graduate = models.BooleanField(default=False)
    student_graduate_date = models.DateField(auto_now=True)
    university_id = models.ForeignKey(University, on_delete=models.CASCADE)


class HomeLoanAccount(models.Model):
    account_number = models.OneToOneField(Account, on_delete=models.CASCADE)
    home_built_date = models.DateField(auto_now=True)
    home_insurance_account_number = models.CharField(max_length=100, unique=True)
    home_insurance_name = models.CharField(max_length=100, unique=True)
    home_insurance_amount = models.DecimalField(max_digits=10, decimal_places=2)
    home_apartment_number = models.CharField(max_length=10, blank=True, null=True)
    street_name = models.ForeignKey(Street, on_delete=models.CASCADE, null=True)
    id = models.UUIDField(primary_key=True, default=uuid.uuid4,
                          editable=False, unique=True)
