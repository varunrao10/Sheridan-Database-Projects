delete from servwork;
delete from servinv;
delete from prospect;
delete from invoption;
delete from tradeinv;
delete from saleinv;
delete from baseoption;
delete from car;
delete from purchinv;
delete from customer;

INSERT INTO customer VALUES('Varun Rao','122 Sheridan Street','Oakville','ON','X1Z5T9','(325)109-3080','(658)990-1808');
INSERT INTO customer VALUES('John Smith','125 Sheridan Street','Oakville','ON','X1Z5T9','(800)145-1080','(321)123-1808');

INSERT INTO purchinv VALUES('ABC123','ACURA',TO_DATE('2019-01-20','YYYY-MM-DD')); --New Car Purchase Invoice


INSERT INTO car VALUES('J11WAXE1','Varun Rao','JAGUAR','XE','2011','white','base','hybrid',NULL,NULL,NULL,NULL); --Old Car traded into dealer
INSERT INTO car VALUES('J18RAXF2','John Smith','JAGUAR','XF','2018','red','SI','4CL',NULL,NULL,NULL,NULL); --Car serviced by dealer
INSERT INTO car VALUES('A19BRDX3',NULL,'ACURA','RDX','2019','Blue','TECH','V6','ABC123',40000,7000,60000); --New Car 

INSERT INTO baseoption VALUES('S22','A19BRDX3');
INSERT INTO baseoption VALUES('W11','A19BRDX3');

--Sale was completed
INSERT INTO saleinv
VALUES('I' || TO_CHAR(SalevInv_SaleInvno.NEXTVAL, 'FM00000'),TO_DATE('2019-01-26','YYYY-MM-DD'),'DEVON WOODCOMB','Varun Rao','A19BRDX3',NULL,NULL,NULL,NULL,DEFAULT,NULL,NULL,0.10 *58000,58000);

UPDATE car
SET custname = 'Varun Rao'
WHERE carserial='A19BRDX3';

UPDATE car
SET custname = NULL
WHERE carserial='J11WAXE1';

INSERT INTO tradeinv
VALUES('I' || TO_CHAR(SalevInv_SaleInvno.CURRVAL, 'FM00000'),'J11WAXE1',15000);

INSERT INTO purchinv
VALUES('I' || TO_CHAR(SalevInv_SaleInvno.CURRVAL, 'FM00000'),'Varun Rao',TO_DATE('2019-01-26','YYYY-MM-DD'));

INSERT INTO invoption
VALUES('I' || TO_CHAR(SalevInv_SaleInvno.CURRVAL, 'FM00000'),'D23',250);

INSERT INTO invoption
VALUES('I' || TO_CHAR(SalevInv_SaleInvno.CURRVAL, 'FM00000'),'CD2',195);

INSERT INTO prospect (custname,carmake,carmodel)
VALUES('Varun Rao','ACURA','RDX');

INSERT INTO prospect (custname,carmake,carmodel)
VALUES('Varun Rao','JAGUAR','XF');

INSERT INTO servinv (servinvno,servdate,custname,carserial,partsprice,laborprice)
VALUES('W' || TO_CHAR(ServInv_Servinvno.NEXTVAL, 'FM0000'),TO_DATE('2019-01-27','YYYY-MM-DD'),'John Smith','J18RAXF2',200,500);

INSERT INTO servwork
VALUES('W' || TO_CHAR(ServInv_Servinvno.CURRVAL, 'FM0000'),'Oil Change');

INSERT INTO servwork
VALUES('W' || TO_CHAR(ServInv_Servinvno.CURRVAL, 'FM0000'),'Rotate Tires');

rollback;