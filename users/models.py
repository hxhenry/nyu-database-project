# Create your models here.
from django.contrib.auth.models import User
from django.db import models


class HcyCustomer(models.Model):
    # user = models.OneToOneField(User, on_delete=models.CASCADE)
    cusfname = models.CharField(max_length=20, db_comment='customer first name')
    cuslname = models.CharField(max_length=20, db_comment='customer last name')
    cemail = models.CharField(primary_key=True, max_length=20, db_comment='customer email')
    stid = models.ForeignKey('HcyStreet', models.DO_NOTHING, db_column='stid', blank=True, null=True)
    captno = models.CharField(max_length=10, blank=True, null=True, db_comment='customer apartment numbner')

    class Meta:
        managed = False
        db_table = 'hcy_customer'

    def __str__(self):
        return self.cemail


class HcyState(models.Model):
    sid = models.IntegerField(primary_key=True, db_comment='STATE ID')
    sname = models.CharField(max_length=20, db_comment='STATE NAME')

    class Meta:
        managed = False
        db_table = 'hcy_state'


class HcyCity(models.Model):
    cid = models.IntegerField(primary_key=True, db_comment='CITY ID')
    cname = models.CharField(max_length=20, db_comment='CITY NAME')
    sid = models.ForeignKey('HcyState', models.DO_NOTHING, db_column='sid')

    class Meta:
        managed = False
        db_table = 'hcy_city'


class HcyStreet(models.Model):
    stid = models.IntegerField(primary_key=True, db_comment='STREET ID')
    stname = models.CharField(max_length=20, db_comment='STREET NAME')
    cid = models.ForeignKey('HcyCity', models.DO_NOTHING, db_column='cid')
    zipcode = models.ForeignKey('HcyZip', models.DO_NOTHING, db_column='zipcode')

    class Meta:
        managed = False
        db_table = 'hcy_street'


class HcyZip(models.Model):
    zipcode = models.DecimalField(primary_key=True, max_digits=20, decimal_places=0, db_comment='Zipcode')

    class Meta:
        managed = False
        db_table = 'hcy_zip'


class HcyUniversity(models.Model):
    uniid = models.SmallIntegerField(primary_key=True, db_comment='University ID')
    uname = models.CharField(max_length=30, blank=True, null=True, db_comment='University Name')

    class Meta:
        managed = False
        db_table = 'hcy_university'

