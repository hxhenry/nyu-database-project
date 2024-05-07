from django.forms import ModelForm
from .models import *


class CustomerForm(ModelForm):
    class Meta:
        model = HcyCustomer
        fields = ['cusfname', 'cuslname', 'cemail', 'captno']


class UniversityForm(ModelForm):
    class Meta:
        model = HcyUniversity
        fields = ['uname']


class StateForm(ModelForm):
    class Meta:
        model = HcyState
        fields = ['sname']


class CityForm(ModelForm):
    class Meta:
        model = HcyCity
        fields = ['cname']


class StreetForm(ModelForm):
    class Meta:
        model = HcyStreet
        fields = ['stname']


class ZipForm(ModelForm):
    class Meta:
        model = HcyZip
        fields = ['zipcode']

