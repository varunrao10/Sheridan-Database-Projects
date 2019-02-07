/*How many vehicles were sold with no insurance coverage
(fire, collision, liability, property)? If no value is entered for any of the insurance fields,
it is considered that the customer did not purchase that kind of insurance. */

SELECT COUNT(DISTINCT carserial) AS Vehicles_Sold_No_Insurance
FROM S11.saleinv
WHERE (insfire IS NULL OR insfire = 'N')
AND (inscollision IS NULL OR inscollision = 'N') 
AND (insliability IS NULL OR insliability = 'N') 
AND (insproperty IS NULL OR insproperty = 'N');

/*Show name, city and home phone number of all customers that are interested in buying 
a car with stereo radio. Arrange the result in descending name order. The result must not have duplicates. 
(There are two different stereo radios available; see options). */

Select DISTINCT cus.custname,custcity,custhphone
FROM S11.customer cus
INNER JOIN S11.prospect pro ON cus.custname = pro.custname
INNER JOIN S11.options opt ON pro.optioncode = opt.optioncode
WHERE optiondesc = 'STEREO RADIO'
ORDER BY cus.custname DESC;

/*List the names and addresses of customers who purchased (not who owns) ACURA MDX and who live in Oakville. */
Select cus.custname, custstreet || ' ' ||
custcity || ', ' || custpostal AS Address     
FROM S11.customer cus
INNER JOIN S11.saleinv sinv ON cus.custname = sinv.custname
INNER JOIN S11.car c ON sinv.carserial = c.carserial
                    AND c.carmake = 'ACURA'
                    AND c.carmodel = 'MDX'
WHERE cus.custcity = 'Oakville';


/*What is the average cost of service visits (partscost + laborcost) before taxes of 2017 Acura make cars? Round the result to 2 decimal places.

*********************I Tested this for ACURA but no service invoices were there for 2017 models so I searched for Jaguar instead
*/
Select ROUND(AVG(partscost + laborcost),2) AS ServiceCost 
FROM S11.servinv svinv
INNER JOIN S11.customer cus ON svinv.custname = cus.custname
INNER JOIN S11.car c ON cus.custname = c.custname
WHERE 
c.carmake = 'JAGUAR' AND 
c.caryear = '2017';

/*Write the most effective query that produces the list with names and phone numbers
of Brampton customers who have purchased (not who owns) a car from Specialty Imports
but have never come in for servicing. (No duplicates). */

Select DISTINCT cus.custname,cus.custhphone
FROM S11.customer cus
INNER JOIN S11.saleinv sinv ON cus.custname = sinv.custname
WHERE cus.custname NOT IN
(SELECT custname FROM S11.servinv)
AND cus.custcity = 'Brampton';

/*Show the name, the car make and model, and the amount of money (including taxes)of the customer who spent 
the most in one single service visit. Remeber that the service cost is made out of partscost and laborcost. */

SELECT DISTINCT cus.custname, c.carmake, c.carmodel,(partscost + laborcost) * (1 + (taxrate/100)) AS ServiceCost 
FROM S11.customer cus
INNER JOIN S11.car c ON cus.custname = c.custname
INNER JOIN S11.servinv svinv ON cus.custname = svinv.custname
WHERE ( (partscost + laborcost) * (1 + (taxrate/100)) ) = 
    (
    SELECT MAX(( (partscost + laborcost) * (1 + (taxrate/100)) ))AS ServiceCost
    FROM S11.servinv svinv
    );

/*Print in a formatted mailing label, the name, full address, car make and model of the person(s)
who purchased the most expensive car from Specialty Imports. */
Select cus.custname || CHR(10) || cus.custstreet ||CHR(10)||
cus.custcity || ' ' || cus.custprovince || ' ' || cus.custpostal || CHR(10) ||
c.carmake || ' ' || c.carmodel AS Mailing_Address 
FROM S11.customer cus
INNER JOIN S11.saleinv sinv ON cus.custname = sinv.custname
INNER JOIN S11.car c ON sinv.carserial = c.carserial
WHERE sinv.carsaleprice = 
    (
    select MAX(carsaleprice) from S11.saleinv
    );




