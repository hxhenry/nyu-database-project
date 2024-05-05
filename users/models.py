from django.contrib.auth.models import User
from django.db import models
import uuid


# Create your models here.
class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    Customer_First_Name = models.CharField(max_length=50)
    Customer_Last_Name = models.CharField(max_length=50)
    Customer_Email = models.CharField(max_length=50)
    customer_apartment_number = models.CharField(max_length=50, blank=True, null=True)
    id = models.UUIDField(primary_key=True, default=uuid.uuid4,
                          editable=False, unique=True)

    def __str__(self):
        return self.Customer_Email


class State(models.Model):
    state = models.CharField(max_length=50)
    id = models.UUIDField(primary_key=True, default=uuid.uuid4,
                          editable=False, unique=True)

    def __str__(self):
        return self.state


class City(models.Model):
    city = models.CharField(max_length=50)
    state = models.ForeignKey(State, on_delete=models.CASCADE)
    id = models.UUIDField(primary_key=True, default=uuid.uuid4,
                          editable=False, unique=True)

    def __str__(self):
        return self.city


class ZipCode(models.Model):
    zip_code = models.CharField(max_length=50)
    id = models.UUIDField(primary_key=True, default=uuid.uuid4,
                          editable=False, unique=True)

    def __str__(self):
        return self.zip_code


class Street(models.Model):
    street_Name = models.CharField(max_length=50)
    city = models.ForeignKey(City, on_delete=models.CASCADE)
    zipCode = models.ForeignKey(ZipCode, on_delete=models.CASCADE)
    id = models.UUIDField(primary_key=True, default=uuid.uuid4,
                          editable=False, unique=True)

    def __str__(self):
        return self.street_Name


class University(models.Model):
    university = models.CharField(max_length=50)
    university_ID = models.CharField(max_length=50)
    id = models.UUIDField(primary_key=True, default=uuid.uuid4,
                          editable=False, unique=True)

    def __str__(self):
        return self.university
