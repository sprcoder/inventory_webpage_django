--All sequences
--wh_seq, wh_sec_seq, emp_seq, prd_seq, prd_type_seq, stock_seq, order_seq, supp_seq, dist_seq

--Warehouse Table
INSERT INTO Warehouse(Warehouse_ID, Warehouse_Name, Manager_ID, Max_Capacity, Contact, 
                            Address, City, SState, ZipCode, Country)
                VALUES(wh_seq.nextval, 'NJIT_Central', null, 20000, 5513243901, 
                            'NJIT Central Building', 'Newark', 'NJ', '07102', 'USA');
INSERT INTO Warehouse(Warehouse_ID, Warehouse_Name, Manager_ID, Max_Capacity, Contact, 
                            Address, City, SState, ZipCode, Country)
                VALUES(wh_seq.nextval, 'NJIT_Pantry', null, 10000, 5513243902, 
                            'NJIT Campus Center', 'Newark', 'NJ', '07102', 'USA');
INSERT INTO Warehouse(Warehouse_ID, Warehouse_Name, Manager_ID, Max_Capacity, Contact, 
                            Address, City, SState, ZipCode, Country)
                VALUES(wh_seq.nextval, 'NJIT_TechCenter', null, 1000, 5513243903, 
                            'University Heights', 'Newark', 'NJ', '07102', 'USA');
INSERT INTO Warehouse(Warehouse_ID, Warehouse_Name, Manager_ID, Max_Capacity, Contact, 
                            Address, City, SState, ZipCode, Country)
                VALUES(wh_seq.nextval, 'NJIT_Merch', null, 5000, 5513243904, 
                            'NJIT Mall', 'Newark', 'NJ', '07102', 'USA');
INSERT INTO Warehouse(Warehouse_ID, Warehouse_Name, Manager_ID, Max_Capacity, Contact, 
                            Address, City, SState, ZipCode, Country)
                VALUES(wh_seq.nextval, 'NJIT_Sports', null, 3000, 5513243905, 
                            'NJIT Fitness Center', 'Newark', 'NJ', '07102', 'USA');

--Warehouse Section 5 entries Parent Section
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(100, 'A1', 2000, null);
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(100, 'A2', 1000, null);
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(100, 'A3', 500, null);
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(100, 'A4', 2500, null);
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(100, 'A5', 2000, null);
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(200, 'B1', 3000, null);
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(200, 'B2', 1500, null);
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(200, 'B3', 700, null);
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(300, 'C1', 100, null);
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(300, 'C2', 50, null);
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(300, 'C3', 300, null);
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(400, 'D1', 2500, null);
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(400, 'D2', 1000, null);
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(500, 'E1', 500, null);
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(500, 'E2', 1000, null);
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(500, 'E3', 1500, null);    
--A subsections
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(100, 'A1-1', 200, 'A1');      
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(100, 'A1-2', 100, 'A1');
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(100, 'A2-1', 200, 'A2');      
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(100, 'A2-2', 100, 'A2');
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(100, 'A3-1', 200, 'A3');      
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(100, 'A3-2', 100, 'A3');
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(100, 'A3-3', 50, 'A3');      
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(100, 'A4-1', 50, 'A4');
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(100, 'A4-2', 100, 'A4');
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(100, 'A5-1', 50, 'A5');
INSERT INTO Warehouse_Section(Warehouse_ID, Section_ID, S_Capacity, Parent_Section)
                VALUES(100, 'A5-2', 100, 'A1');
--Employee table values - add managers using alter table commands
INSERT INTO EMPLOYEE(Emp_ID, FirstName, LastName, Designation, SupervisorID, DOB, 
                        Contact, Address, City, SState, ZipCode, Country, EmpOf)
                VALUES(emp_seq.nextval, 'Saravana', 'Ramasamy', 'Manager', null, TO_DATE('1990/07/09', 'yyyy/mm/dd'),
                        7892573154, 'Frank E Rodgers', 'Harrison', 'NJ', 07029, 'USA', 100);
INSERT INTO EMPLOYEE(Emp_ID, FirstName, LastName, Designation, SupervisorID, DOB, 
                        Contact, Address, City, SState, ZipCode, Country, EmpOf)
                VALUES(emp_seq.nextval, 'Koushik', 'Chandrasekaran', 'Manager', null, TO_DATE('1992/05/28', 'yyyy/mm/dd'),
                        8622303524, '7th Street', 'Harrison', 'NJ', 07029, 'USA', 200);
INSERT INTO EMPLOYEE(Emp_ID, FirstName, LastName, Designation, SupervisorID, DOB, 
                        Contact, Address, City, SState, ZipCode, Country, EmpOf)
                VALUES(emp_seq.nextval, 'Ken', 'Adams', 'Manager', null, TO_DATE('1991/03/19', 'yyyy/mm/dd'),
                        5712573152, 'Stockton Ct', 'Morris Plains', 'NJ', 07950, 'USA', 300);
INSERT INTO EMPLOYEE(Emp_ID, FirstName, LastName, Designation, SupervisorID, DOB, 
                        Contact, Address, City, SState, ZipCode, Country, EmpOf)
                VALUES(emp_seq.nextval, 'Sydney', 'Smith', 'Manager', null, TO_DATE('1993/01/01', 'yyyy/mm/dd'),
                        9912573154, 'Central Ave', 'Jersey City', 'NJ', 07302, 'USA', 400);
INSERT INTO EMPLOYEE(Emp_ID, FirstName, LastName, Designation, SupervisorID, DOB, 
                        Contact, Address, City, SState, ZipCode, Country, EmpOf)
                VALUES(emp_seq.nextval, 'Haley', 'Dunphy', 'Manager', null, TO_DATE('1989/04/17', 'yyyy/mm/dd'),
                        2512573157, 'Cleveland Ave', 'Orange', 'NJ', 07050, 'USA', 500);
INSERT INTO EMPLOYEE(Emp_ID, FirstName, LastName, Designation, SupervisorID, DOB, 
                        Contact, Address, City, SState, ZipCode, Country, EmpOf)
                VALUES(emp_seq.nextval, 'Kate', 'Upton', 'Supervisor', 1000, TO_DATE('1994/02/25', 'yyyy/mm/dd'),
                        8712573134, '6th Cross Street', 'Harrison', 'NJ', 07029, 'USA', 100);
INSERT INTO EMPLOYEE(Emp_ID, FirstName, LastName, Designation, SupervisorID, DOB, 
                        Contact, Address, City, SState, ZipCode, Country, EmpOf)
                VALUES(emp_seq.nextval, 'Frank', 'Lewis', 'Worker', 1005, TO_DATE('1992/08/22', 'yyyy/mm/dd'),
                        7892573612, 'Warren Street', 'Harrison', 'NJ', 07029, 'USA', 100);
INSERT INTO EMPLOYEE(Emp_ID, FirstName, LastName, Designation, SupervisorID, DOB, 
                        Contact, Address, City, SState, ZipCode, Country, EmpOf)
                VALUES(emp_seq.nextval, 'Madison', 'Keath', 'Worker', 1005, TO_DATE('1991/09/12', 'yyyy/mm/dd'),
                        8623543184, 'Bergen Street', 'Harrison', 'NJ', 07029, 'USA', 100);
--Product table values
INSERT INTO PRODUCT(Product_ID, Product_Name, Manufacturer, Product_Price, Sale_Price)
                VALUES(prd_seq.nextval, 'Retractable Ballpoint Pens', 'InkJoy', 2.5, 4.44);
INSERT INTO PRODUCT(Product_ID, Product_Name, Manufacturer, Product_Price, Sale_Price)
                VALUES(prd_seq.nextval, 'Premium 32 A4 Sheets 32 lb 500 sheets', 'HP', 15, 20.99);
INSERT INTO PRODUCT(Product_ID, Product_Name, Manufacturer, Product_Price, Sale_Price)
                VALUES(prd_seq.nextval, 'Wet/Dry Vacuum', 'Craftsman', 70, 139.99);
INSERT INTO PRODUCT(Product_ID, Product_Name, Manufacturer, Product_Price, Sale_Price)
                VALUES(prd_seq.nextval, 'Cordless Nailer 20V', 'Dewalt', 170, 249.99);
INSERT INTO PRODUCT(Product_ID, Product_Name, Manufacturer, Product_Price, Sale_Price)
                VALUES(prd_seq.nextval, 'LED Strip Lights', 'Tenmiro', 12, 25.99);
INSERT INTO PRODUCT(Product_ID, Product_Name, Manufacturer, Product_Price, Sale_Price)
                VALUES(prd_seq.nextval, '6ft Floor Lamp', 'Mainstays', 8, 14.98);
INSERT INTO PRODUCT(Product_ID, Product_Name, Manufacturer, Product_Price, Sale_Price)
                VALUES(prd_seq.nextval, 'Waterproof Mattress Pad', 'Meritlife', 22.22, 49.99);
INSERT INTO PRODUCT(Product_ID, Product_Name, Manufacturer, Product_Price, Sale_Price)
                VALUES(prd_seq.nextval, '128 fl oz soybean vegetable oil', 'Wesson', 6, 10.48);
INSERT INTO PRODUCT(Product_ID, Product_Name, Manufacturer, Product_Price, Sale_Price)
                VALUES(prd_seq.nextval, 'Chicken Breasts 1.5lb', 'Perdue', 2.5, 5.21);
INSERT INTO PRODUCT(Product_ID, Product_Name, Manufacturer, Product_Price, Sale_Price)
                VALUES(prd_seq.nextval, 'Liquid Hand Soap, Fresh Breeze 7.5 fl oz', 'Softsoap', 0.75, 1.21);
INSERT INTO PRODUCT(Product_ID, Product_Name, Manufacturer, Product_Price, Sale_Price)
                VALUES(prd_seq.nextval, 'Pump Deep Body Wash and Moisturizer 34 fl oz', 'Dove', 4.5, 8.98);
--Product_Type table values
INSERT INTO Product_Type(PType_ID, PType_Name)
                VALUES(prd_type_seq.nextval, 'Stationery');
INSERT INTO Product_Type(PType_ID, PType_Name)
                VALUES(prd_type_seq.nextval, 'Office and Hardware');
INSERT INTO Product_Type(PType_ID, PType_Name)
                VALUES(prd_type_seq.nextval, 'Home');
INSERT INTO Product_Type(PType_ID, PType_Name)
                VALUES(prd_type_seq.nextval, 'Grocery');
INSERT INTO Product_Type(PType_ID, PType_Name)
                VALUES(prd_type_seq.nextval, 'Personal Care');
                
--Type_Location table use insert into values and select statement to add the values
INSERT INTO Type_Location(PType_ID, Section_ID) 
                VALUES(1, 'A1');
INSERT INTO Type_Location(PType_ID, Section_ID) 
                VALUES(2, 'A2');
INSERT INTO Type_Location(PType_ID, Section_ID) 
                VALUES(3, 'A3');
INSERT INTO Type_Location(PType_ID, Section_ID) 
                VALUES(4, 'A4');
INSERT INTO Type_Location(PType_ID, Section_ID) 
                VALUES(5, 'A5');

--Stored_In table use insert into values and select statement to add the values
INSERT INTO STORED_IN(Aisle_No, Product_ID)
                VALUES('A1-1', 10000);
INSERT INTO STORED_IN(Aisle_No, Product_ID)
                VALUES('A1-2', 10001);
INSERT INTO STORED_IN(Aisle_No, Product_ID)
                VALUES('A2-1', 10002);
INSERT INTO STORED_IN(Aisle_No, Product_ID)
                VALUES('A2-2', 10003);
INSERT INTO STORED_IN(Aisle_No, Product_ID)
                VALUES('A3-1', 10004);
INSERT INTO STORED_IN(Aisle_No, Product_ID)
                VALUES('A3-2', 10005);
INSERT INTO STORED_IN(Aisle_No, Product_ID)
                VALUES('A3-3', 10006);
INSERT INTO STORED_IN(Aisle_No, Product_ID)
                VALUES('A4-1', 10007);
INSERT INTO STORED_IN(Aisle_No, Product_ID)
                VALUES('A4-2', 10008);
INSERT INTO STORED_IN(Aisle_No, Product_ID)
                VALUES('A5-1', 10009);
INSERT INTO STORED_IN(Aisle_No, Product_ID)
                VALUES('A5-2', 10010);
                
--Prod_Belong_Type table use insert into values and select statement to add the values
INSERT INTO PROD_BELONG_TYPE(Product_ID, PType_ID)
                VALUES(10000, 1);
INSERT INTO PROD_BELONG_TYPE(Product_ID, PType_ID)
                VALUES(10001, 1);
INSERT INTO PROD_BELONG_TYPE(Product_ID, PType_ID)
                VALUES(10002, 2);
INSERT INTO PROD_BELONG_TYPE(Product_ID, PType_ID)
                VALUES(10003, 2);
INSERT INTO PROD_BELONG_TYPE(Product_ID, PType_ID)
                VALUES(10004, 3);
INSERT INTO PROD_BELONG_TYPE(Product_ID, PType_ID)
                VALUES(10005, 3);
INSERT INTO PROD_BELONG_TYPE(Product_ID, PType_ID)
                VALUES(10006, 3);
INSERT INTO PROD_BELONG_TYPE(Product_ID, PType_ID)
                VALUES(10007, 4);
INSERT INTO PROD_BELONG_TYPE(Product_ID, PType_ID)
                VALUES(10008, 4);
INSERT INTO PROD_BELONG_TYPE(Product_ID, PType_ID)
                VALUES(10009, 5);
INSERT INTO PROD_BELONG_TYPE(Product_ID, PType_ID)
                VALUES(10010, 5);
        
--Stock table values - Check is it possible to add it when adding values from incoming orders
--INSERT INTO Stock(Stock_ID, Product_ID, Quantity, Mfd_date, Best_before, Use_by_date)
--                VALUES(prd_type_seq.nextval, 'Stationery');
INSERT INTO STOCK(Stock_ID, Product_ID, Quantity, Mfd_date, Best_before, Use_by_date)
                VALUES(stock_seq.nextval, 10000, 30, TO_DATE('2022/11/07', 'yyyy/mm/dd'), null, null);
INSERT INTO STOCK(Stock_ID, Product_ID, Quantity, Mfd_date, Best_before, Use_by_date)
                VALUES(stock_seq.nextval, 10001, 15, TO_DATE('2022/10/12', 'yyyy/mm/dd'), null, null);
INSERT INTO STOCK(Stock_ID, Product_ID, Quantity, Mfd_date, Best_before, Use_by_date)
                VALUES(stock_seq.nextval, 10002, 10, TO_DATE('2022/11/05', 'yyyy/mm/dd'), null, null);
INSERT INTO STOCK(Stock_ID, Product_ID, Quantity, Mfd_date, Best_before, Use_by_date)
                VALUES(stock_seq.nextval, 10003, 20, TO_DATE('2022/09/23', 'yyyy/mm/dd'), null, null);
INSERT INTO STOCK(Stock_ID, Product_ID, Quantity, Mfd_date, Best_before, Use_by_date)
                VALUES(stock_seq.nextval, 10004, 30, TO_DATE('2022/11/05', 'yyyy/mm/dd'), null, null);
                
--Orders table values
INSERT INTO ORDERS(Order_ID, Ordered_By, Status, Contact, Shp_date, 
                        Shp_Address, Shp_City, Shp_State, Shp_ZipCode, Country)
                VALUES(order_seq.nextval, 'Sam', 'Created', 5524378919, TO_DATE('2022/11/20', 'yyyy/mm/dd'),
                        'Cleveland Ave', 'Harrison', 'NJ', 07029, 'USA');
INSERT INTO ORDERS(Order_ID, Ordered_By, Status, Contact, Shp_date, 
                        Shp_Address, Shp_City, Shp_State, Shp_ZipCode, Country)
                VALUES(order_seq.nextval, 'Aron', 'Processing', 8624377822, TO_DATE('2022/11/18', 'yyyy/mm/dd'),
                        'Central Ave', 'Harrison', 'NJ', 07029, 'USA');
INSERT INTO ORDERS(Order_ID, Ordered_By, Status, Contact, Shp_date, 
                        Shp_Address, Shp_City, Shp_State, Shp_ZipCode, Country)
                VALUES(order_seq.nextval, 'Jordan', 'Created', 8622458634, TO_DATE('2022/11/21', 'yyyy/mm/dd'),
                        '7th Street', 'Harrison', 'NJ', 07029, 'USA');
INSERT INTO ORDERS(Order_ID, Ordered_By, Status, Contact, Shp_date, 
                        Shp_Address, Shp_City, Shp_State, Shp_ZipCode, Country)
                VALUES(order_seq.nextval, 'Kumar', 'Processing', 7894372356, TO_DATE('2022/11/19', 'yyyy/mm/dd'),
                        'Bergen Street', 'Harrison', 'NJ', 07029, 'USA');
INSERT INTO ORDERS(Order_ID, Ordered_By, Status, Contact, Shp_date, 
                        Shp_Address, Shp_City, Shp_State, Shp_ZipCode, Country)
                VALUES(order_seq.nextval, 'Linda', 'Packing', 8622373158, TO_DATE('2022/11/17', 'yyyy/mm/dd'),
                        'Harrison Ave', 'Harrison', 'NJ', 07029, 'USA');
INSERT INTO ORDERS(Order_ID, Ordered_By, Status, Contact, Shp_date, 
                        Shp_Address, Shp_City, Shp_State, Shp_ZipCode, Country)
                VALUES(order_seq.nextval, 'Aron', 'Processing', 8624377822, TO_DATE('2022/11/18', 'yyyy/mm/dd'),
                        'Central Ave', 'Harrison', 'NJ', 07029, 'USA');
INSERT INTO ORDERS(Order_ID, Ordered_By, Status, Contact, Shp_date, 
                        Shp_Address, Shp_City, Shp_State, Shp_ZipCode, Country)
                VALUES(order_seq.nextval, 'Bryce', 'Processing', 8623126748, TO_DATE('2022/11/18', 'yyyy/mm/dd'),
                        'Church Square', 'Harrison', 'NJ', 07029, 'USA');
INSERT INTO ORDERS(Order_ID, Ordered_By, Status, Contact, Shp_date, 
                        Shp_Address, Shp_City, Shp_State, Shp_ZipCode, Country)
                VALUES(order_seq.nextval, 'Scarlett', 'Processing', 8629893646, TO_DATE('2022/11/17', 'yyyy/mm/dd'),
                        '101 Supor Blvd', 'Harrison', 'NJ', 07029, 'USA');
INSERT INTO ORDERS(Order_ID, Ordered_By, Status, Contact, Shp_date, 
                        Shp_Address, Shp_City, Shp_State, Shp_ZipCode, Country)
                VALUES(order_seq.nextval, 'Frank', 'Processing', 7892573612, TO_DATE('2022/11/19', 'yyyy/mm/dd'),
                        'NJIT Central Building', 'Newark', 'NJ', 07102, 'USA');                      

--Order_Processing table use insert into values and select statement to add the values
INSERT INTO ORDER_PROCESSING(Order_ID, Emp_ID, Status)
                VALUES(2, 1005, 'Order confirmed, waiting for packaging');
INSERT INTO ORDER_PROCESSING(Order_ID, Emp_ID, Status)
                VALUES(4, 1006, 'Order confirmed, waiting for packaging');
INSERT INTO ORDER_PROCESSING(Order_ID, Emp_ID, Status)
                VALUES(5, 1006, 'Order packaged, waiting for shipping');
INSERT INTO ORDER_PROCESSING(Order_ID, Emp_ID, Status)
                VALUES(6, 1007, 'Order confirmed, waiting for packaging');
INSERT INTO ORDER_PROCESSING(Order_ID, Emp_ID, Status)
                VALUES(7, 1007, 'Order confirmed, waiting for packaging');
INSERT INTO ORDER_PROCESSING(Order_ID, Emp_ID, Status)
                VALUES(8, 1006, 'Order confirmed, waiting for packaging');

--Supplier table values
INSERT INTO SUPPLIER(Sup_ID, Sup_Name, Sup_Type, Sup_Contact, 
                            Sup_Address, Sup_City, Sup_State, Sup_ZipCode, Sup_Country)
                VALUES(supp_seq.nextval, 'InkJoy', 'Manufacturer', 3233326816,
                            'James M Wood Blvd', 'Los Angeles', 'CA', '90006', 'USA');
INSERT INTO SUPPLIER(Sup_ID, Sup_Name, Sup_Type, Sup_Contact, 
                            Sup_Address, Sup_City, Sup_State, Sup_ZipCode, Sup_Country)
                VALUES(supp_seq.nextval, 'HP', 'Manufacturer', 8004746936,
                            '3000 Hanover Street', 'Palo Alto', 'CA', '94304', 'USA');
INSERT INTO SUPPLIER(Sup_ID, Sup_Name, Sup_Type, Sup_Contact, 
                            Sup_Address, Sup_City, Sup_State, Sup_ZipCode, Sup_Country)
                VALUES(supp_seq.nextval, 'Craftsman', 'Manufacturer', 9736421820,
                            '175 Central Ave', 'Newark', 'NJ', '07103', 'USA');
INSERT INTO SUPPLIER(Sup_ID, Sup_Name, Sup_Type, Sup_Contact, 
                            Sup_Address, Sup_City, Sup_State, Sup_ZipCode, Sup_Country)
                VALUES(supp_seq.nextval, 'Dewalt', 'Manufacturer', 8004339259,
                            ' 701 E Joppa Rd', 'Towson', 'MD', '21286', 'USA');
INSERT INTO SUPPLIER(Sup_ID, Sup_Name, Sup_Type, Sup_Contact, 
                            Sup_Address, Sup_City, Sup_State, Sup_ZipCode, Sup_Country)
                VALUES(supp_seq.nextval, 'Tenmiro', 'Vendor', 8624561235,
                            '101 Hudson Street', 'Harrison', 'NJ', '07029', 'USA');                            

--Incoming_Order table use insert into values and select statement to add the values
INSERT INTO INCOMING_ORDER(Order_ID, Product_ID, Sup_ID, Quantity, Price)
                VALUES(9, 10000, 10, 15, 37.50);
INSERT INTO INCOMING_ORDER(Order_ID, Product_ID, Sup_ID, Quantity, Price)
                VALUES(9, 10001, 20, 10, 150);
INSERT INTO INCOMING_ORDER(Order_ID, Product_ID, Sup_ID, Quantity, Price)
                VALUES(9, 10002, 30, 5, 350);
INSERT INTO INCOMING_ORDER(Order_ID, Product_ID, Sup_ID, Quantity, Price)
                VALUES(9, 10003, 40, 15, 2550);
INSERT INTO INCOMING_ORDER(Order_ID, Product_ID, Sup_ID, Quantity, Price)
                VALUES(9, 10004, 50, 20, 519.80);

--Distributor table values
INSERT INTO DISTRIBUTOR(Dist_ID, Dist_Name, Dist_Type, Dist_Contact, 
                            Dist_Address, Dist_City, Dist_State, Dist_ZipCode, Dist_Country)
                VALUES(dist_seq.nextval, 'The UPS Store', 'Global', 9736493001,
                            '8 Lombardy Street', 'Newark', 'NJ', '07102', 'USA');
INSERT INTO DISTRIBUTOR(Dist_ID, Dist_Name, Dist_Type, Dist_Contact, 
                            Dist_Address, Dist_City, Dist_State, Dist_ZipCode, Dist_Country)
                VALUES(dist_seq.nextval, 'Mail Boxes Services Inc', 'Local', 9733714001,
                            '511 S Orange Ave', 'Newark', 'NJ', '07103', 'USA');
INSERT INTO DISTRIBUTOR(Dist_ID, Dist_Name, Dist_Type, Dist_Contact, 
                            Dist_Address, Dist_City, Dist_State, Dist_ZipCode, Dist_Country)
                VALUES(dist_seq.nextval, 'Kristal Cargo LP', 'Global', 9734162120,
                            '691 S 18th Street', 'Newark', 'NJ', '07103', 'USA');                            
INSERT INTO DISTRIBUTOR(Dist_ID, Dist_Name, Dist_Type, Dist_Contact, 
                            Dist_Address, Dist_City, Dist_State, Dist_ZipCode, Dist_Country)
                VALUES(dist_seq.nextval, 'MB Stone Pro', 'Global', 2522383344,
                            '329 Doremus Ave', 'Newark', 'NJ', '07105', 'USA');                              
INSERT INTO DISTRIBUTOR(Dist_ID, Dist_Name, Dist_Type, Dist_Contact, 
                            Dist_Address, Dist_City, Dist_State, Dist_ZipCode, Dist_Country)
                VALUES(dist_seq.nextval, 'United States Postal Service', 'Global', 8002758777,
                            '290 Springfield Ave', 'Newark', 'NJ', '07103', 'USA');
INSERT INTO DISTRIBUTOR(Dist_ID, Dist_Name, Dist_Type, Dist_Contact, 
                            Dist_Address, Dist_City, Dist_State, Dist_ZipCode, Dist_Country)
                VALUES(dist_seq.nextval, 'Green Line Move Corp.', 'Local', 7326024002,
                            '655 Amboy Ave', 'Woodbridge', 'NJ', '07095', 'USA');                            

--Outgoing_Order table use insert into values and select statement to add the values
INSERT INTO OUTGOING_ORDER(Order_ID, Product_ID, Dist_ID, Quantity, Price)
                VALUES(1, 10003, 60, 1, 249.99);
INSERT INTO OUTGOING_ORDER(Order_ID, Product_ID, Dist_ID, Quantity, Price)
                VALUES(2, 10007, 30, 2, 20.96);
INSERT INTO OUTGOING_ORDER(Order_ID, Product_ID, Dist_ID, Quantity, Price)
                VALUES(3, 10002, 20, 1, 139.99);
INSERT INTO OUTGOING_ORDER(Order_ID, Product_ID, Dist_ID, Quantity, Price)
                VALUES(4, 10009, 10, 4, 4.84);
INSERT INTO OUTGOING_ORDER(Order_ID, Product_ID, Dist_ID, Quantity, Price)
                VALUES(5, 10008, 10, 3, 15.63);


--Order_Tracking
INSERT INTO ORDER_TRACKING(Order_ID, Sup_ID, Dist_ID, Track_Comment)
                VALUES(1, 50, 10, 'Out for delivery');
INSERT INTO ORDER_TRACKING(Order_ID, Sup_ID, Dist_ID, Track_Comment)
                VALUES(2, 20, 30, 'Processing package for shipping');
INSERT INTO ORDER_TRACKING(Order_ID, Sup_ID, Dist_ID, Track_Comment)
                VALUES(3, 30, 10, 'Package ready to be shipped');
INSERT INTO ORDER_TRACKING(Order_ID, Sup_ID, Dist_ID, Track_Comment)
                VALUES(4, 50, 20, 'Out for delivery');
INSERT INTO ORDER_TRACKING(Order_ID, Sup_ID, Dist_ID, Track_Comment)
                VALUES(5, 40, 40, 'Order confirmed for shipment');
                
                
                    
                
    





     