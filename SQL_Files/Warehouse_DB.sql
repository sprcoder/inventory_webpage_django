--Warehouse table
--Changes in Relational Schema, added attributes
--1
CREATE TABLE Warehouse(
    Warehouse_ID    NUMBER,
    Warehouse_Name  VARCHAR2(50) NOT NULL UNIQUE,
    Manager_ID      NUMBER,
    Max_Capacity    NUMBER NOT NULL,
    Contact         NUMBER(10) NOT NULL,
    Address         VARCHAR2(100) NOT NULL,
    City            VARCHAR2(50) NOT NULL,
    SState          CHAR(2) NOT NULL,
    ZipCode         VARCHAR2(5) NOT NULL,
    Country         VARCHAR2(50) NOT NULL,
    PRIMARY KEY(Warehouse_ID));

--2
CREATE TABLE Warehouse_Section(
    Warehouse_ID    NUMBER,
    Section_ID      VARCHAR2(10) NOT NULL UNIQUE,
    S_Capacity      NUMBER,
    Parent_Section  VARCHAR2(4),
    CONSTRAINT wh_sec_comp PRIMARY KEY(Section_ID, Warehouse_ID),
    CONSTRAINT fk_wh_sec FOREIGN KEY(Warehouse_ID) REFERENCES Warehouse(Warehouse_ID),
    CONSTRAINT fk_sec_sec FOREIGN KEY(Parent_Section) REFERENCES Warehouse_Section(Section_ID) ON DELETE CASCADE);

    

--Have a trigger for age to calculate the populate when DOB is added or updated
--Add a relation employee of the warehouse
--3
CREATE TABLE Employee(
    Emp_ID          NUMBER,
    FirstName       VARCHAR2(50) NOT NULL,
    LastName        VARCHAR2(50) NOT NULL,
    Designation     VARCHAR2(50) DEFAULT 'Worker',
    SupervisorID    NUMBER,
    DOB             DATE NOT NULL,
    Contact         NUMBER(10) NOT NULL,
    Address         VARCHAR2(100),
    City            VARCHAR2(50),
    SState          CHAR(2) NOT NULL,
    ZipCode         VARCHAR2(5) NOT NULL,
    Country         VARCHAR2(50) NOT NULL,
    EmpOf           NUMBER,
    PRIMARY KEY(Emp_ID),
    CONSTRAINT fk_emp_emp FOREIGN KEY(SupervisorID) REFERENCES Employee(Emp_ID) ON DELETE SET NULL,
    CONSTRAINT fk_wh_emp FOREIGN KEY(EmpOF) REFERENCES Warehouse(Warehouse_ID) ON DELETE SET NULL);

ALTER TABLE Warehouse ADD CONSTRAINT fk_manager FOREIGN KEY(Manager_ID) REFERENCES Employee(Emp_ID) ON DELETE CASCADE;
    
--4
CREATE TABLE Product(
    Product_ID      NUMBER,
    Product_Name    VARCHAR2(50) NOT NULL,
    Manufacturer    VARCHAR2(50) NOT NULL,
    Product_Price   NUMBER(*,2) NOT NULL,
    Sale_Price      NUMBER(*,2),
    PRIMARY KEY(Product_ID));
    
--5
CREATE TABLE Product_Type(
    PType_ID        NUMBER,
    PType_Name      VARCHAR2(50) NOT NULL,
    PRIMARY KEY(PType_ID));

--6    
CREATE TABLE Type_Location(
    PType_ID        NUMBER,
    Section_ID      VARCHAR2(4),
    PRIMARY KEY(Section_ID, PType_ID),
    CONSTRAINT fk_loc_sec FOREIGN KEY(Section_ID) REFERENCES Warehouse_Section(Section_ID) ON DELETE CASCADE,
    CONSTRAINT fk_loc_type FOREIGN KEY(PType_ID) REFERENCES Product_Type(PType_ID) ON DELETE CASCADE);
    
--7
CREATE TABLE Stored_In(
    Aisle_No        VARCHAR2(10),
    Product_ID      NUMBER,
    PRIMARY KEY(Aisle_No, Product_ID),
    CONSTRAINT fk_sto_sec FOREIGN KEY(Aisle_No) REFERENCES Warehouse_Section(Section_ID) ON DELETE CASCADE,
    CONSTRAINT fk_sto_prod FOREIGN KEY(Product_ID) REFERENCES Product(Product_ID) ON DELETE CASCADE);
    
--8
CREATE TABLE Prod_Belong_Type(
    Product_ID      NUMBER,
    PType_ID        NUMBER,
    PRIMARY KEY(PType_ID, Product_ID),
    CONSTRAINT fk_bel_type FOREIGN KEY(PType_ID) REFERENCES Product_Type(PType_ID) ON DELETE CASCADE,
    CONSTRAINT fk_bel_prod FOREIGN KEY(Product_ID) REFERENCES Product(Product_ID) ON DELETE CASCADE);
    
--9
CREATE TABLE Stock(
    Stock_ID        NUMBER,
    Product_ID      NUMBER,
    Quantity        NUMBER,
    Mfd_date        DATE,
    Best_before     DATE,
    Use_by_date     DATE,
    PRIMARY KEY(Stock_ID, Product_ID),
    CONSTRAINT fk_stoK_prod FOREIGN KEY(Product_ID) REFERENCES Product(Product_ID) ON DELETE CASCADE);
    
--10
CREATE TABLE Orders(
    Order_ID        NUMBER,
    Ordered_By      VARCHAR2(50) NOT NULL,
    Status          VARCHAR2(50) NOT NULL,
    Contact         NUMBER(10) NOT NULL,
    Shp_date        DATE,
    Shp_Address     VARCHAR2(100),
    Shp_City        VARCHAR2(50),
    Shp_State       CHAR(2) NOT NULL,
    Shp_ZipCode     VARCHAR2(5) NOT NULL,
    Country         VARCHAR2(50) NOT NULL,      
    PRIMARY KEY(Order_ID));
    
--11
CREATE TABLE Order_Processing(
    Order_ID        NUMBER,
    Emp_ID          NUMBER,
    Status          VARCHAR2(50), 
    PRIMARY KEY(Order_ID, Emp_ID),
    CONSTRAINT fk_opro_emp FOREIGN KEY(Emp_ID) REFERENCES Employee(Emp_ID) ON DELETE SET NULL,
    CONSTRAINT fk_opro_ord FOREIGN KEY(Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE);
    
--12
CREATE TABLE Supplier(
    Sup_ID          NUMBER,
    Sup_Name        VARCHAR2(50) NOT NULL,
    Sup_Type        VARCHAR2(50) NOT NULL,
    Sup_Contact     NUMBER(10) NOT NULL,
    Sup_Address     VARCHAR2(100),
    Sup_City        VARCHAR2(50),
    Sup_State       CHAR(2) NOT NULL,
    Sup_ZipCode     VARCHAR2(5) NOT NULL,
    Sup_Country     VARCHAR2(50) NOT NULL,      
    PRIMARY KEY(Sup_ID));
    
--13
CREATE TABLE Incoming_Order(
    Order_ID        NUMBER,
    Product_ID      NUMBER,
    Sup_ID          NUMBER, 
    Quantity        NUMBER NOT NULL,
    Price           NUMBER(*,2) NOT NULL,
    PRIMARY KEY(Order_ID, Product_ID, Sup_ID),
    CONSTRAINT fk_iord_ord FOREIGN KEY(Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE,
    CONSTRAINT fk_iord_prod FOREIGN KEY(Product_ID) REFERENCES Product(Product_ID) ON DELETE CASCADE,
    CONSTRAINT fk_iord_supp FOREIGN KEY(Sup_ID) REFERENCES Supplier(Sup_ID) ON DELETE CASCADE);

--14
CREATE TABLE Distributor(
    Dist_ID         NUMBER,
    Dist_Name       VARCHAR2(50) NOT NULL,
    Dist_Type       VARCHAR2(50) NOT NULL,
    Dist_Contact    NUMBER(10) NOT NULL,
    Dist_Address    VARCHAR2(100),
    Dist_City       VARCHAR2(50),
    Dist_State      CHAR(2) NOT NULL,
    Dist_ZipCode    VARCHAR2(5) NOT NULL,
    Dist_Country    VARCHAR2(50) NOT NULL,      
    PRIMARY KEY(Dist_ID));
    
--15
CREATE TABLE Outgoing_Order(
    Order_ID        NUMBER,
    Product_ID      NUMBER,
    Dist_ID         NUMBER, 
    Quantity        NUMBER NOT NULL,
    Price           NUMBER(*,2) NOT NULL,
    PRIMARY KEY(Order_ID, Product_ID, Dist_ID),
    CONSTRAINT fk_oord_ord FOREIGN KEY(Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE,
    CONSTRAINT fk_oord_prod FOREIGN KEY(Product_ID) REFERENCES Product(Product_ID) ON DELETE CASCADE,
    CONSTRAINT fk_oord_dist FOREIGN KEY(Dist_ID) REFERENCES Distributor(Dist_ID) ON DELETE CASCADE);
    
--16
CREATE TABLE Order_Tracking(
    Order_ID        NUMBER,
    Sup_ID          NUMBER,
    Dist_ID         NUMBER, 
    Track_Comment   VARCHAR2(50),
    PRIMARY KEY(Order_ID, Sup_ID, Dist_ID),
    CONSTRAINT fk_otrk_ord FOREIGN KEY(Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE,
    CONSTRAINT fk_otrk_supp FOREIGN KEY(Sup_ID) REFERENCES Supplier(Sup_ID),
    CONSTRAINT fk_otrk_dist FOREIGN KEY(Dist_ID) REFERENCES Distributor(Dist_ID) ON DELETE SET NULL);