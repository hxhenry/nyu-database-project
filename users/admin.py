from django.contrib import admin

# Register your models here.
from .models import Profile, Street, State, University, ZipCode, City

admin.site.register(Profile)
admin.site.register(Street)
admin.site.register(State)
admin.site.register(University)
admin.site.register(ZipCode)
admin.site.register(City)
