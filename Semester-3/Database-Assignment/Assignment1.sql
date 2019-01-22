Drop table InvOption;
Drop table ServWork;
Drop table BaseOption;
Drop table Prospect;
Drop table Options;
Drop table ServInv;
Drop table TradeInv;
Drop table SaleInv;
Drop table Employee;
Drop table Car;
Drop table PurchInv;
Drop table customer;


Create table customer
(
    custname VarChar2(20) Primary Key Not Null
,   custstreet VarChar2(20) Not Null
,   custcity VarChar2(20) Not Null
,   custprivince Char(2)  Default 'ON' Not Null
,   custpostal Char(7) Not Null
,   custhphone Char(13) Not Null
,   custbphone Char(13) Not Null
);

Create Table PurchInv
(
    purchinvno Char(6) Primary Key Not Null
,   purchfrom VarChar2(15) Null
,   purchdate Date Null
);

Create Table Car
(
    carserial Char(8) Primary Key Not Null
,   custname VarChar2(20) Null
,   carmake VarChar2(10) Not Null
,   carmodel VarChar2(10) Not Null
,   caryear Char(4) Not Null
,   extcolour VarChar2(12) Not Null
,   cartrim VarChar2(16) Not Null
,   enginetype VarChar2(10) Not Null
,   purchinvno Char(6) Null
,   purchcost Number(9,2) Null
,   freightcost Number(9,2) Null
,   carlistprice Number(9,2) Null
,   Constraint fk_Car_Cust Foreign Key (custname) References customer(custname)
,   Constraint fk_Car_PurchInv Foreign Key (purchinvno) References PurchInv (purchinvno)

);

Create table Employee
(
    empname VarChar2(20) Primary Key Not Null
,   startdate Date Not Null
,   commisionrate Number(3,1) Null
,   title VarChar2(26) Null
,   manager VarChar2(20) Null
,   Constraint fk_Emp_Emp Foreign Key (manager) References employee(empname)
);

Create table SaleInv
(
    saleinvno Char(6) Primary Key Not Null
,   saledate Date Not Null
,   salesman VarChar2(20) Not Null
,   custname VarChar2(20) Not Null
,   carserial Char(8) Not Null
,   insfire Char(1) Null
,   inscollision Char(1) Null
,   insliability Char(1) Null
,   insproperty Char(1) Null
,   taxrate Number(4,2) Default 13.0 Null
,   licfee Number(6,2) Null
,   discount Number(8,2) Null
,   commision Number(8,2) Null
,   carsaleprice Number(9,2) Null
,   Constraint fk_SaleInv_Cust Foreign Key (custname) References customer(custname)
,   Constraint fk_SaleInv_Car Foreign Key (carserial) References Car(carserial)
,   Constraint fk_SaleInv_Emp Foreign Key (salesman) References Employee(empname)
);

Create Table TradeInv
(
    saleinvno Char(6) Not Null
,   carserial Char(8) Not Null
,   tradeallow Number(9,2) Null
,   Constraint TradeInv_PK Primary Key(saleinvno,carserial)
,   Constraint fk_TradeInv_Car Foreign Key (carserial) References Car(carserial)
,   Constraint fk_TradeInv_SaleInv Foreign Key (saleinvno) References SaleInv(saleinvno)
);


Create Table ServInv
(
    servinvno Char(5) Primary Key Not Null
,   servdate Date Not Null
,   custname VarChar2(20) Not Null
,   carserial Char(8) Not Null
,   partsprice Number(7,2) Null
,   laborprice Number(7,2) Null
,   taxrate Number(4,2) Default 13.0
,   Constraint fk_ServInv_Cust Foreign Key (custname) References customer(custname)
,   Constraint fk_ServInv_Car Foreign Key (carserial) References Car(carserial)
);


Create Table Options
(
    optioncode Char(4) Primary Key Not Null
,   optiondesc VarChar2(30) Null
,   optioncost Number(7,2) Null
,   optionlistprice Number(7,2) Null
);

Create Table Prospect
(
    custname VarChar2(20) Not Null
,   carmake VarChar2(10) Not Null
,   carmodel VarChar2(10) Null
,   caryear Char(4) Null
,   carcolour VarChar2(12) Null
,   cartrim VarChar2(16) Null
,   optioncode Char(4) Null
,   Constraint UQ_Prospect Unique(custname,carmake,carmodel,caryear,carcolour,cartrim,optioncode)
,   Constraint fk_Prospect_Cust Foreign Key (custname) References customer(custname)
,   Constraint fk_Prospect_Optn Foreign Key (optioncode) References Options(optioncode)
);


Create Table BaseOption
(
    optioncode Char(4) Not Null
,   carserial Char(8) Not Null
,   Constraint baseOption_Pk Primary Key(optioncode,carserial)
,   Constraint fk_BaseOptn_Optn Foreign Key (optioncode) References Options(optioncode)
,   Constraint fk_BaseOptn_Car Foreign Key (carserial) References Car(carserial) 
);

Create Table ServWork
(
    servinvno Char(5) Not Null
,   workdesc VarChar2(80) Not Null
,   Constraint servWork_Pk Primary Key(servinvno,workdesc)
,    Constraint fk_ServWork_ServInv Foreign Key (servinvno) References ServInv(servinvno)
);

Create Table InvOption
(
    saleinvno Char(6) Not Null
,   optioncode Char(4) Not Null
,   optionprice Number(7,2) Null
,   Constraint InvOption_PK Primary Key(saleinvno,optioncode)
,   Constraint fk_InvOptn_SaleInv Foreign Key (saleinvno) References SaleInv(saleinvno)
,   Constraint fk_InvOptn_Optn Foreign Key (optioncode) References Options(optioncode)
);


