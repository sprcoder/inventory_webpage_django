from django.urls import path
from inventory.views import index, logout, auth_view, dashboard, product, employee, new_order, contact

urlpatterns = [path('', index, name='index'),
                path('', index, name='login'),
                path('logout/', logout, name='logout'),
                path('auth_view/', auth_view, name='auth_view'),
                path('dashboard/', dashboard, name='dashboard'),
                path('products/', product, name='product'),
                path('employees/', employee, name='employee'),
                path('new_order/', new_order, name='create'),
                path('contact/', contact, name='contact')]