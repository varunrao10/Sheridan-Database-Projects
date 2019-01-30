/*-----------------------------------------------------------
| employee.sql												|
| H.D														|
| S6														|
| This sctipt inserts all SI employees into employee table	|
-------------------------------------------------------------*/

INSERT INTO employee (empname, startdate, manager, commissionrate, title)
     VALUES ('MAURICE RISNER', '01-JAN-98', null, 20, 'General Manager');
     
INSERT INTO employee (empname, startdate, manager, commissionrate, title)
     VALUES ('PETE MONEY', '01-FEB-98', 'MAURICE RISNER', 0, 'Accounting Manager');
     
INSERT INTO employee (empname, startdate, manager, commissionrate, title)
     VALUES ('PIECEMEAL HENRY', '20-FEB-98', 'MAURICE RISNER', 0, 'Parts and Service Manager');

INSERT INTO employee (empname, startdate, manager, commissionrate, title)
     VALUES ('NOREEN NEWBIE', '20-FEB-98', 'MAURICE RISNER', 15, 'New Vehicle Sales Manager');
     
INSERT INTO employee (empname, startdate, manager, commissionrate, title)
     VALUES ('SAM SLICKER', '05-NOV-98', 'MAURICE RISNER', 15, 'Used Vehicle Manager');
     
INSERT INTO employee (empname, startdate, manager, commissionrate, title)
     VALUES ('JACK SPRATT', '30-JUN-05', 'SAM SLICKER', 8, 'Salesman');
     
INSERT INTO employee (empname, startdate, manager, commissionrate, title)
     VALUES ('CHUCK BARTOWSKI', '23-NOV-03', 'NOREEN NEWBIE', 10, 'Salesman');
     
INSERT INTO employee (empname, startdate, manager, commissionrate, title)
     VALUES ('DEVON WOODCOMB', '13-MAY-04', 'NOREEN NEWBIE', 10, 'Salesman');

INSERT INTO employee (empname, startdate, manager, commissionrate, title)
     VALUES ('CATHY CASHIER', '12-MAR-98', 'PETE MONEY', 0, 'Cashier');
     
INSERT INTO employee (empname, startdate, manager, commissionrate, title)
     VALUES ('BETTY BOOKKEEPER', '31-MAY-00', 'PETE MONEY', 0, 'Bookkeeper');
     
INSERT INTO employee (empname, startdate, manager, commissionrate, title)
     VALUES ('PERRY PARTS', '22-AUG-99', 'PIECEMEAL HENRY', 0, 'Parts Clerk');
     
INSERT INTO employee (empname, startdate, manager, commissionrate, title)
     VALUES ('SLOAN SHOP', '09-SEP-99', 'PIECEMEAL HENRY', 0, 'Shop Supervisor');
     
INSERT INTO employee (empname, startdate, manager, commissionrate, title)
     VALUES ('MIKE MECHANIC', '01-JUN-01', 'SLOAN SHOP', 0, 'Mechnanic');
     
INSERT INTO employee (empname, startdate, manager, commissionrate, title)
     VALUES ('MANNY MECHANIC', '06-MAR-00', 'SLOAN SHOP', 0, 'Mechanic');
     
INSERT INTO employee (empname, startdate, manager, commissionrate, title)
     VALUES ('ADAM ADAMS', '25-SEP-00', 'NOREEN NEWBIE', 10, 'Salesman');
     
INSERT INTO employee (empname, startdate, manager, commissionrate, title)
     VALUES ('JOHNNY GOLIGHTLY', '12-AUG-02', 'SAM SLICKER', 10, 'Salesman');
     
INSERT INTO employee (empname, startdate, manager, commissionrate, title)
     VALUES ('DEADBEAT DAN', '01-MAR-14', 'SAM SLICKER', 5, 'Salesman');
     
COMMIT;