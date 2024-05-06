from django.forms import ModelForm
from .models import Profile


class ProfileForm(ModelForm):
    class Meta:
        model = Profile
        fields = ['Customer_First_Name', 'Customer_Last_Name', 'Customer_Email', 'customer_apartment_number']
