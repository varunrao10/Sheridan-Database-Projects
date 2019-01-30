/*
File: Assignment 1
Author: Varun Rao
Oracale Username: s11_raova
Description: Convert the E-R diagram for specialty imports into tables so it can be read by the database. 
Apply the necessary constraints and sequences as requested.
*/

DROP TABLE InvOption;
DROP TABLE ServWork;
DROP TABLE BaseOption;
DROP TABLE Prospect;
DROP TABLE Options;
DROP TABLE ServInv;
DROP TABLE TradeInv;
DROP TABLE SaleInv;
DROP TABLE Employee;
DROP TABLE Car;
DROP TABLE PurchInv;
DROP TABLE customer;
DROP SEQUENCE SalevInv_SaleInvno;
DROP SEQUENCE ServInv_Servinvno;

CREATE SEQUENCE SalevInv_SaleInvno START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ServInv_Servinvno START WITH 1 INCREMENT BY 1;

CREATE TABLE customer
(
    custname VARCHAR2(20) PRIMARY KEY NOT NULL
,   custstreet VARCHAR2(20) NOT NULL
,   custcity VARCHAR2(20) NOT NULL
,   custprovince CHAR(2)  DEFAULT 'ON' NOT NULL
,   custpostal CHAR(7) NOT NULL
,   custhphone CHAR(13) NOT NULL
,   custbphone CHAR(13) NOT NULL
);

CREATE TABLE PurchInv
(
    purchinvno CHAR(6) PRIMARY KEY NOT NULL
,   purchfrom VARCHAR2(15) NULL
,   purchdate DATE NULL
);

CREATE TABLE Car
(
    carserial CHAR(8) PRIMARY KEY NOT NULL
,   custname VARCHAR2(20) NULL
,   carmake VARCHAR2(10) NOT NULL
,   carmodel VARCHAR2(10) NOT NULL
,   caryear CHAR(4) NOT NULL
,   extcolour VarChar2(12) Not Null
,   cartrim VARCHAR2(16) NOT NULL
,   enginetype VARCHAR2(10) NOT NULL
,   purchinvno CHAR(6) NULL
,   purchcost NUMBER(9,2) NULL
,   freightcost NUMBER(9,2) NULL
,   carlistprice NUMBER(9,2) NULL
,   CONSTRAINT fk_Car_Cust FOREIGN KEY (custname) REFERENCES customer(custname)
,   CONSTRAINT fk_Car_PurchInv FOREIGN KEY (purchinvno) REFERENCES PurchInv (purchinvno)
,   CONSTRAINT chk_carmake CHECK(carmake IN ('ACURA','MERCEDES','LANDROVER','JAGUAR'))
);

CREATE TABLE Employee
(
    empname VARCHAR2(20) PRIMARY KEY NOT NULL
,   startdate DATE NOT NULL
,   commissionrate NUMBER(3,1) NULL
,   title VARCHAR2(26) NULL
,   MANAGER VARCHAR2(20) NULL
,   CONSTRAINT fk_Emp_Emp FOREIGN KEY (MANAGER) REFERENCES employee(empname)
);

CREATE TABLE SaleInv
(
    saleinvno CHAR(6) PRIMARY KEY NOT NULL
,   saledate DATE NOT NULL
,   salesman VARCHAR2(20) NOT NULL
,   custname VARCHAR2(20) NOT NULL
,   carserial CHAR(8) NOT NULL
,   insfire CHAR(1) NULL
,   inscollision CHAR(1) NULL
,   insliability CHAR(1) NULL
,   insproperty CHAR(1) NULL
,   taxrate NUMBER(4,2) DEFAULT 13.0 NULL
,   licfee NUMBER(6,2) NULL
,   discount NUMBER(8,2) NULL
,   commision NUMBER(8,2) NULL
,   carsaleprice NUMBER(9,2) NULL
,   CONSTRAINT fk_SaleInv_Cust FOREIGN KEY (custname) REFERENCES customer(custname)
,   CONSTRAINT fk_SaleInv_Car FOREIGN KEY (carserial) REFERENCES Car(carserial)
,   CONSTRAINT fk_SaleInv_Emp FOREIGN KEY (salesman) REFERENCES Employee(empname)
,   CONSTRAINT chk_Saledate CHECK(saledate > To_Date('01-01-1990', 'DD-MM-YYYY'))
,   CONSTRAINT chk_insfire CHECK(insfire IN ('Y','N'))
,   CONSTRAINT chk_inscollision CHECK(inscollision IN ('Y','N'))
,   CONSTRAINT chk_insliability CHECK(insliability IN ('Y','N'))
,   CONSTRAINT chk_insproperty CHECK(insproperty IN ('Y','N'))
);

CREATE TABLE TradeInv
(
    saleinvno CHAR(6) NOT NULL
,   carserial CHAR(8) NOT NULL
,   tradeallow NUMBER(9,2) NULL
,   CONSTRAINT TradeInv_PK PRIMARY KEY(saleinvno,carserial)
,   CONSTRAINT fk_TradeInv_Car FOREIGN KEY (carserial) REFERENCES Car(carserial)
,   CONSTRAINT fk_TradeInv_SaleInv FOREIGN KEY (saleinvno) REFERENCES SaleInv(saleinvno)
);


CREATE TABLE ServInv
(
    servinvno CHAR(5) PRIMARY KEY NOT NULL
,   servdate DATE NOT NULL
,   custname VARCHAR2(20) NOT NULL
,   carserial CHAR(8) NOT NULL
,   partsprice NUMBER(7,2) NULL
,   laborprice NUMBER(7,2) NULL
,   taxrate NUMBER(4,2) DEFAULT 13.0
,   CONSTRAINT fk_ServInv_Cust FOREIGN KEY (custname) REFERENCES customer(custname)
,   CONSTRAINT fk_ServInv_Car FOREIGN KEY (carserial) REFERENCES Car(carserial)
);


CREATE TABLE Options
(
    optioncode CHAR(4) PRIMARY KEY NOT NULL
,   optiondesc VARCHAR2(30) NULL
,   optioncost NUMBER(7,2) NULL
,   optionlistprice NUMBER(7,2) NULL
);

CREATE TABLE Prospect
(
    custname VARCHAR2(20) NOT NULL
,   carmake VARCHAR2(10) NOT NULL
,   carmodel VARCHAR2(10) NULL
,   caryear CHAR(4) NULL
,   carcolour VARCHAR2(12) NULL
,   cartrim VARCHAR2(16) NULL
,   optioncode CHAR(4) NULL
,   CONSTRAINT UQ_Prospect UNIQUE(custname,carmake,carmodel,caryear,carcolour,cartrim,optioncode)
,   CONSTRAINT fk_Prospect_Cust FOREIGN KEY (custname) REFERENCES customer(custname)
,   CONSTRAINT fk_Prospect_Optn FOREIGN KEY (optioncode) REFERENCES Options(optioncode)
);


CREATE TABLE BaseOption
(
    optioncode CHAR(4) NOT NULL
,   carserial CHAR(8) NOT NULL
,   CONSTRAINT baseOption_Pk PRIMARY KEY(optioncode,carserial)
,   CONSTRAINT fk_BaseOptn_Optn FOREIGN KEY (optioncode) REFERENCES Options(optioncode)
,   CONSTRAINT fk_BaseOptn_Car FOREIGN KEY (carserial) REFERENCES Car(carserial) 
);

CREATE TABLE ServWork
(
    servinvno CHAR(5) NOT NULL
,   workdesc VARCHAR2(80) NOT NULL
,   CONSTRAINT servWork_Pk PRIMARY KEY(servinvno,workdesc)
,   CONSTRAINT fk_ServWork_ServInv FOREIGN KEY (servinvno) REFERENCES ServInv(servinvno)
);

CREATE TABLE InvOption
(
    saleinvno CHAR(6) NOT NULL
,   optioncode CHAR(4) NOT NULL
,   optionprice NUMBER(7,2) NULL
,   CONSTRAINT InvOption_PK PRIMARY KEY(saleinvno,optioncode)
,   CONSTRAINT fk_InvOptn_SaleInv FOREIGN KEY (saleinvno) REFERENCES SaleInv(saleinvno)
,   CONSTRAINT fk_InvOptn_Optn FOREIGN KEY (optioncode) REFERENCES Options(optioncode)
);


/* Output

Table INVOPTION dropped.
Table SERVWORK dropped.
Table BASEOPTION dropped.
Table PROSPECT dropped.
Table OPTIONS dropped.
Table SERVINV dropped.
Table TRADEINV dropped.
Table SALEINV dropped.
Table EMPLOYEE dropped.
Table CAR dropped.
Table PURCHINV dropped.
Table CUSTOMER dropped.
Sequence SALEVINV_SALEINVNO dropped.
Sequence SERVINV_SERVINVNO dropped.
Sequence SALEVINV_SALEINVNO created.
Sequence SERVINV_SERVINVNO created.
Table CUSTOMER created.
Table PURCHINV created.
Table CAR created.
Table EMPLOYEE created.
Table SALEINV created.
Table TRADEINV created.
Table SERVINV created.
Table OPTIONS created.
Table PROSPECT created.
Table BASEOPTION created.
Table SERVWORK created.
Table INVOPTION created.
Trigger SERVINV_INSERT compiled
Trigger SALEVINV_INSERT compiled
*/



