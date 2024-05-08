from django.contrib import admin

# Register your models here.
from .models import *

admin.site.register(HcyAccount)
admin.site.register(HcyChecking)
admin.site.register(HcySavings)
admin.site.register(HcyLoan)
admin.site.register(HcyHome)
admin.site.register(HcyStudent)

