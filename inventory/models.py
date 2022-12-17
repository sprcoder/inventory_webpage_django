# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128, blank=True, null=True)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150, blank=True, null=True)
    first_name = models.CharField(max_length=150, blank=True, null=True)
    last_name = models.CharField(max_length=150, blank=True, null=True)
    email = models.CharField(max_length=254, blank=True, null=True)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Distributor(models.Model):
    dist_id = models.FloatField(primary_key=True)
    dist_name = models.CharField(max_length=50)
    dist_type = models.CharField(max_length=50)
    dist_contact = models.IntegerField()
    dist_address = models.CharField(max_length=100, blank=True, null=True)
    dist_city = models.CharField(max_length=50, blank=True, null=True)
    dist_state = models.CharField(max_length=2)
    dist_zipcode = models.CharField(max_length=5)
    dist_country = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'distributor'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200, blank=True, null=True)
    action_flag = models.IntegerField()
    change_message = models.TextField(blank=True, null=True)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100, blank=True, null=True)
    model = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255, blank=True, null=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField(blank=True, null=True)
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Employee(models.Model):
    emp_id = models.FloatField(primary_key=True)
    firstname = models.CharField(max_length=50)
    lastname = models.CharField(max_length=50)
    designation = models.CharField(max_length=50, blank=True, null=True)
    supervisorid = models.ForeignKey('self', models.DO_NOTHING, db_column='supervisorid', blank=True, null=True)
    dob = models.DateField()
    contact = models.IntegerField()
    address = models.CharField(max_length=100, blank=True, null=True)
    city = models.CharField(max_length=50, blank=True, null=True)
    sstate = models.CharField(max_length=2)
    zipcode = models.CharField(max_length=5)
    country = models.CharField(max_length=50)
    empof = models.ForeignKey('Warehouse', models.DO_NOTHING, db_column='empof', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'employee'


class IncomingOrder(models.Model):
    order = models.OneToOneField('Orders', models.DO_NOTHING, primary_key=True)
    product = models.ForeignKey('Product', models.DO_NOTHING)
    sup = models.ForeignKey('Supplier', models.DO_NOTHING)
    quantity = models.FloatField()
    price = models.DecimalField(max_digits=38, decimal_places=2)

    class Meta:
        managed = False
        db_table = 'incoming_order'
        unique_together = (('order', 'product', 'sup'),)


class OrderProcessing(models.Model):
    order = models.OneToOneField('Orders', models.DO_NOTHING, primary_key=True)
    emp = models.ForeignKey(Employee, models.DO_NOTHING)
    status = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'order_processing'
        unique_together = (('order', 'emp'),)


class OrderTracking(models.Model):
    order = models.OneToOneField('Orders', models.DO_NOTHING, primary_key=True)
    sup = models.ForeignKey('Supplier', models.DO_NOTHING)
    dist = models.ForeignKey(Distributor, models.DO_NOTHING)
    track_comment = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'order_tracking'
        unique_together = (('order', 'sup', 'dist'),)


class Orders(models.Model):
    order_id = models.FloatField(primary_key=True)
    ordered_by = models.CharField(max_length=50)
    status = models.CharField(max_length=50)
    contact = models.IntegerField()
    shp_date = models.DateField(blank=True, null=True)
    shp_address = models.CharField(max_length=100, blank=True, null=True)
    shp_city = models.CharField(max_length=50, blank=True, null=True)
    shp_state = models.CharField(max_length=2)
    shp_zipcode = models.CharField(max_length=5)
    country = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'orders'


class OutgoingOrder(models.Model):
    order = models.OneToOneField(Orders, models.DO_NOTHING, primary_key=True)
    product = models.ForeignKey('Product', models.DO_NOTHING)
    dist = models.ForeignKey(Distributor, models.DO_NOTHING)
    quantity = models.FloatField()
    price = models.DecimalField(max_digits=38, decimal_places=2)

    class Meta:
        managed = False
        db_table = 'outgoing_order'
        unique_together = (('order', 'product', 'dist'),)


class ProdBelongType(models.Model):
    product = models.ForeignKey('Product', models.DO_NOTHING)
    ptype = models.OneToOneField('ProductType', models.DO_NOTHING, primary_key=True)

    class Meta:
        managed = False
        db_table = 'prod_belong_type'
        unique_together = (('ptype', 'product'),)


class Product(models.Model):
    product_id = models.FloatField(primary_key=True)
    product_name = models.CharField(max_length=50)
    manufacturer = models.CharField(max_length=50)
    product_price = models.DecimalField(max_digits=38, decimal_places=2)
    sale_price = models.DecimalField(max_digits=38, decimal_places=2, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'product'


class ProductType(models.Model):
    ptype_id = models.FloatField(primary_key=True)
    ptype_name = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'product_type'


class Stock(models.Model):
    stock_id = models.FloatField(primary_key=True)
    product = models.ForeignKey(Product, models.DO_NOTHING)
    quantity = models.FloatField(blank=True, null=True)
    mfd_date = models.DateField(blank=True, null=True)
    best_before = models.DateField(blank=True, null=True)
    use_by_date = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'stock'
        unique_together = (('stock_id', 'product'),)


class StoredIn(models.Model):
    aisle_no = models.OneToOneField('WarehouseSection', models.DO_NOTHING, db_column='aisle_no', primary_key=True)
    product = models.ForeignKey(Product, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'stored_in'
        unique_together = (('aisle_no', 'product'),)


class Supplier(models.Model):
    sup_id = models.FloatField(primary_key=True)
    sup_name = models.CharField(max_length=50)
    sup_type = models.CharField(max_length=50)
    sup_contact = models.IntegerField()
    sup_address = models.CharField(max_length=100, blank=True, null=True)
    sup_city = models.CharField(max_length=50, blank=True, null=True)
    sup_state = models.CharField(max_length=2)
    sup_zipcode = models.CharField(max_length=5)
    sup_country = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'supplier'


class TypeLocation(models.Model):
    ptype = models.ForeignKey(ProductType, models.DO_NOTHING)
    section = models.OneToOneField('WarehouseSection', models.DO_NOTHING, primary_key=True)

    class Meta:
        managed = False
        db_table = 'type_location'
        unique_together = (('section', 'ptype'),)


class Warehouse(models.Model):
    warehouse_id = models.FloatField(primary_key=True)
    warehouse_name = models.CharField(unique=True, max_length=50)
    manager = models.ForeignKey(Employee, models.DO_NOTHING, blank=True, null=True)
    max_capacity = models.FloatField()
    contact = models.IntegerField()
    address = models.CharField(max_length=100)
    city = models.CharField(max_length=50)
    sstate = models.CharField(max_length=2)
    zipcode = models.CharField(max_length=5)
    country = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'warehouse'


class WarehouseSection(models.Model):
    warehouse = models.ForeignKey(Warehouse, models.DO_NOTHING)
    section_id = models.CharField(primary_key=True, max_length=10)
    s_capacity = models.FloatField(blank=True, null=True)
    parent_section = models.ForeignKey('self', models.DO_NOTHING, db_column='parent_section', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'warehouse_section'
        unique_together = (('section_id', 'warehouse'),)
