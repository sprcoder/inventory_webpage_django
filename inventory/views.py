from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import auth, messages
from django.template import loader
from django import forms
from .models import Employee
from .models import Orders, IncomingOrder, OutgoingOrder, Product, Supplier, Distributor
import logging
from django.db import connections
from datetime import date
from datetime import timedelta
from decimal import *

emp = ""
sup = False
empid = 0
userlog = ""
userflag = False
# Create your views here.
def index(request):
    context = {
        "title": "Home"
    }
    print("In home")
    return render(request, "inventory_app/index.html", context=context)


def logout(request):
  global emp 
  global sup
  global userflag, userlog
  emp = ""
  sup = False
  userflag = False
  userlog = ""
  context = {
      "title": "Logout"
  }
  return render(request, "inventory_app/logout.html", context=context)


def product(request):
  global emp
  global sup
  global userflag, userlog
  with connections['inventory-db'].cursor() as cursor:
    cursor.execute("select p.product_id, p.product_name, p.manufacturer, p.product_price, p.sale_price, s.quantity, s.mfd_date \
                    from product p left join stock s on p.product_id = s.product_id")
    products = dictfetchall(cursor)
    context = {
      "title": "Product",
      "loggedin": True,
      "product": products,
      "sup": sup,
      "userflag": userflag,
      "userlog": userlog
    }
    if (emp != ""):
      context["man"] = emp
    cursor.close()
    return render(request, "inventory_app/product.html", context=context)

def contact(request):
  global emp
  global sup
  global userflag, userlog
  context = {
    "title": "Contact",
    "loggedin": True,
    "sup": sup,
    "userflag": userflag,
    "userlog": userlog
  }
  return render(request, "inventory_app/contact.html", context=context)

def new_order(request):
  global emp
  global sup
  global empid
  global userflag, userlog
  insert = False
  if request.method == "POST":
    prod = request.POST.get('product')
    type = request.POST.get('type')
    quant = request.POST.get('quantity')
    pri = request.POST.get('price')
    supp = request.POST.get('supplier')
    distrib = request.POST.get('distributor')
    name = request.POST.get('name')
    con = request.POST.get('contact')
    address = request.POST.get('address')
    city = request.POST.get('city')
    state = request.POST.get('state')
    zip = request.POST.get('zip')
    today = date.today()
    today = today + timedelta(days=10)
    ctoday = today.strftime("%Y-%m-%d")
    vmax = ''
    with connections['inventory-db'].cursor() as cursor:
      cursor.execute("select max(order_id) as max from orders")
      maxi = dictfetchall(cursor)
      vmax = maxi[0]['MAX']

    m = int(vmax)
    m = m+1
    o = Orders(order_id=m, ordered_by=name, contact=con, status='Created', shp_date=ctoday, shp_address=address, shp_city=city, shp_state=state, shp_zipcode=zip, country='USA')
    o.save()
    p = Product.objects.filter(product_id=int(prod))

    if type == '1':
      s = Supplier.objects.filter(sup_id=int(supp))
      i = IncomingOrder(order=o, product=p[0], sup=s[0], quantity=float(quant), price=Decimal(pri))
      i.save()
    else:   
      d = Distributor.objects.filter(dist_id=int(distrib))
      out = OutgoingOrder(order=o, product=p[0], dist=d[0], quantity=float(quant), price=Decimal(pri))
      out.save()

    insert=True
    
  with connections['inventory-db'].cursor() as cursor:
    cursor.execute("select * from product")
    products = dictfetchall(cursor)
    cursor.execute("select * from employee where emp_id = %s", [empid])
    user = dictfetchall(cursor)
    cursor.execute("select sup_id, sup_name from supplier")
    supplier = dictfetchall(cursor)
    cursor.execute("select dist_id, dist_name from distributor")
    distributor = dictfetchall(cursor)
    context = {
      "title": "New Order",
      "loggedin": True,
      "product": products,
      "user": user,
      "supplier": supplier,
      "distributor": distributor,
      "sup": sup,
      "userflag": userflag,
      "userlog": userlog
    }
    if (emp != ""):
      context["man"] = emp
    if insert:
      context["insert"]= True
    cursor.close()
    return render(request, "inventory_app/neworder.html", context=context)
  


def auth_view(request):
    global emp
    global sup
    global empid
    global userflag, userlog
    userid = request.POST.get('_username')
    userpass = request.POST.get('_password')

    empl = Employee.objects.filter(
        firstname=userid, lastname=userpass).values()

    if empl:
      userlog = userid+" "+userpass
      userflag = True
      for e in empl:
        empid = int(e.get('emp_id'))
        if (e.get('designation') == 'Manager'):
          emp = userid
        if (e.get('designation') == 'Supervisor'):
          sup = True
      with connections['inventory-db'].cursor() as cursor:
          cursor.execute("select o.order_id, o.ordered_by, o.status, o.shp_city, o.shp_state, e.firstname as assignedto, op.status as comments \
                      from orders o left join order_processing op on o.order_id = op.order_id left join employee e on op.emp_id = e.emp_id \
                      order by o.order_id")
          orders = dictfetchall(cursor)

          cursor.execute("select o.order_id, p.product_name, o.quantity, o.price, s.sup_name \
      from incoming_order o inner join product p on o.product_id = p.product_id inner join supplier s on o.sup_id = s.sup_id \
      order by o.order_id")
          in_orders = dictfetchall(cursor)

          cursor.execute("select o.order_id, p.product_name, o.quantity, o.price, d.dist_name \
      from outgoing_order o inner join product p on o.product_id = p.product_id inner join distributor d on o.dist_id = d.dist_id \
      order by o.order_id")
          out_orders = dictfetchall(cursor)

      context = {
          "title": "Dashboard",
          "loggedin": True,
          "order": orders,
          "in_order": in_orders,
          "out_order": out_orders,
          "sup": sup,
          "userflag": userflag,
          "userlog": userlog
      }
      if (emp != ""):
        context["man"] = emp
      cursor.close()

      return render(request, "inventory_app/dashboard.html", context=context)

        # return HttpResponseRedirect(e.get("firstname"))
    else:
        messages.error(request, 'username or password not correct')
        context = {
            "title": "Home",
            "loggedin": False,
            "errors": "username or password not correct"
        }
        return render(request, "inventory_app/index.html", context=context)


def dashboard(request):
    global emp
    global sup
    global userflag, userlog
    with connections['inventory-db'].cursor() as cursor:
      cursor.execute("select o.order_id, o.ordered_by, o.status, o.shp_city, o.shp_state, e.firstname as assignedto, op.status as comments \
                        from orders o left join order_processing op on o.order_id = op.order_id left join employee e on op.emp_id = e.emp_id \
                        order by o.order_id")
      orders = dictfetchall(cursor)

      cursor.execute("select o.order_id, p.product_name, o.quantity, o.price, s.sup_name \
        from incoming_order o inner join product p on o.product_id = p.product_id inner join supplier s on o.sup_id = s.sup_id \
        order by o.order_id")
      in_orders = dictfetchall(cursor)

      cursor.execute("select o.order_id, p.product_name, o.quantity, o.price, d.dist_name \
        from outgoing_order o inner join product p on o.product_id = p.product_id inner join distributor d on o.dist_id = d.dist_id \
        order by o.order_id")
      out_orders = dictfetchall(cursor)
      cursor.close()

      context = {
            "title": "Dashboard",
            "loggedin": True,
            "order": orders,
            "in_order": in_orders,
            "out_order": out_orders,
            "sup": sup,
            "userflag": userflag,
            "userlog": userlog
      }
      if (emp != ""):
        context["man"] = emp

      return render(request, "inventory_app/dashboard.html", context=context)

    # if (Employee.firstname == userid and Employee.lastname == userpass):
    #     return HttpResponse("Loggedin")
    # return HttpResponse(dictfetchall(cursor))

    # user = auth.authenticate(username=userid, password=userpass)

def employee(request):
  global emp
  global sup
  global userflag, userlog
  with connections['inventory-db'].cursor() as cursor:
    cursor.execute("select * from employee")
    employees = dictfetchall(cursor)
    context = {
      "title": "Product",
      "loggedin": True,
      "emp": employees,
      "sup": sup,
      "userflag": userflag,
      "userlog": userlog
    }
    if (emp != ""):
      context["man"] = emp

    cursor.close()
    return render(request, "inventory_app/employees.html", context=context)


def dictfetchall(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]

# cursor.execute("SELECT foo FROM bar WHERE baz = '30%'")
# cursor.execute("SELECT foo FROM bar WHERE baz = '30%%' AND id = %s", [self.id])
