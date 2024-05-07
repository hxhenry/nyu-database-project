from django.contrib import admin

# Register your models here.
from .models import *

admin.site.register(HcyCustomer)
admin.site.register(HcyUniversity)
admin.site.register(HcyState)
admin.site.register(HcyCity)
admin.site.register(HcyStreet)
admin.site.register(HcyZip)

