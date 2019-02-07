/*
File: Assignment2S11.sql
Author: Varun Rao
Oraccale Username:s11_raova
Description: Commiting records to S11 tables
*/

--Customer info
INSERT INTO S11.customer VALUES('VARUN RAO','122 Sheridan Street','Oakville','ON','X1Z5T9','(325)109-3080','(658)990-1808');
INSERT INTO S11.customer VALUES('SEBASTIAN MANUELO','125 Sheridan Street','Oakville','ON','X1Z5T9','(800)145-1080','(321)123-1808');

INSERT INTO S11.purchinv VALUES('K17T5X','ACURA',TO_DATE('2019-01-20','YYYY-MM-DD')); --New Car Purchase Invoice

INSERT INTO S11.car VALUES('J11WAXE1','VARUN RAO','JAGUAR','XE','2011','white','base','hybrid',NULL,NULL,NULL,NULL); --Old Car traded into dealer
INSERT INTO S11.car VALUES('J18RAXF2','SEBASTIAN MANUELO','JAGUAR','XF','2018','red','SI','4CL',NULL,NULL,NULL,NULL); --Car serviced by dealer
INSERT INTO S11.car VALUES('A19BRDX3',NULL,'ACURA','RDX','2019','Blue','TECH','V6','K17T5X',40000,7000,60000); --New Car 

--The new car comes with base options
INSERT INTO S11.baseoption VALUES('S22','A19BRDX3');
INSERT INTO S11.baseoption VALUES('W11','A19BRDX3');

--Sale was completed for new car sold to Varun Rao
INSERT INTO S11.saleinv
VALUES('I' || TO_CHAR(S11.SALEINV_SEQ.NEXTVAL, 'FM00000'),TO_DATE('2019-01-26','YYYY-MM-DD'),'DEVON WOODCOMB','VARUN RAO','A19BRDX3',NULL,NULL,NULL,NULL,DEFAULT,NULL,NULL,0.10 *58000,58000);

--Update the carowner
UPDATE S11.car
SET custname = 'VARUN RAO'
WHERE carserial='A19BRDX3';

--Clear the owner for the traded in car
UPDATE S11.car
SET custname = NULL
WHERE carserial='J11WAXE1';

--Invoice for the trade in for the used jaguar
INSERT INTO S11.tradeinv
VALUES('I' || TO_CHAR(S11.SALEINV_SEQ.CURRVAL, 'FM00000'),'J11WAXE1',15000);

--Dealers purchase invoice for the used car
INSERT INTO S11.purchinv
VALUES('I' || TO_CHAR(S11.SALEINV_SEQ.CURRVAL, 'FM00000'),'VARUN RAO',TO_DATE('2019-01-26','YYYY-MM-DD'));

--customer selected options for the new car
INSERT INTO S11.invoption
VALUES('I' || TO_CHAR(S11.SALEINV_SEQ.CURRVAL, 'FM00000'),'D23',250);

INSERT INTO S11.invoption
VALUES('I' || TO_CHAR(S11.SALEINV_SEQ.CURRVAL, 'FM00000'),'CD2',195);

--Prospect information
INSERT INTO S11.prospect (custname,carmake,carmodel)
VALUES('VARUN RAO','ACURA','RDX');

INSERT INTO S11.prospect (custname,carmake,carmodel)
VALUES('VARUN RAO','JAGUAR','XF');

--Service invoice for fictitious customer
INSERT INTO S11.servinv (servinvno,servdate,custname,carserial,partscost,laborcost)
VALUES('W' || TO_CHAR(S11.SERVINV_SEQ.NEXTVAL, 'FM0000'),TO_DATE('2019-01-27','YYYY-MM-DD'),'SEBASTIAN MANUELO','J18RAXF2',200,500);

--Detailed service record for work done
INSERT INTO S11.servwork
VALUES('W' || TO_CHAR(S11.SERVINV_SEQ.CURRVAL, 'FM0000'),'Oil Change');

INSERT INTO S11.servwork
VALUES('W' || TO_CHAR(S11.SERVINV_SEQ.CURRVAL, 'FM0000'),'Rotate Tires');

commit;