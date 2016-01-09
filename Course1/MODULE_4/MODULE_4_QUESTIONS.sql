--Q#1
SELECT CUSTNO 
        ,CUSTNAME
        ,PHONE
        ,CITY
FROM CUSTOMER;

--Q#2
SELECT CUSTNO 
        ,CUSTNAME
        ,PHONE
        ,CITY
FROM CUSTOMER
WHERE STATE = 'CO';

--Q#3
SELECT *
FROM EVENTREQUEST
WHERE ESTCOST > 4000
ORDER BY DATEHELD;

--Q#4
SELECT EVENTNO
        ,DATEHELD
        ,ESTAUDIENCE
        ,STATUS
FROM EVENTREQUEST
WHERE (STATUS = 'Approved'
        AND ESTAUDIENCE > 9000)
	  OR (STATUS = 'Pending'
			AND ESTAUDIENCE > 7000)

--Q#5
SELECT EVENTREQUEST.EVENTNO
        ,EVENTREQUEST.DATEHELD
        ,EVENTREQUEST.CUSTNO
        ,CUSTOMER.CUSTNAME
FROM EVENTREQUEST 
        JOIN CUSTOMER ON EVENTREQUEST.CUSTNO=CUSTOMER.CUSTNO
WHERE CUSTOMER.CITY = 'Boulder' 
        AND EXTRACT(YEAR FROM EVENTREQUEST.DATEHELD) = 2013
        AND EXTRACT(MONTH FROM EVENTREQUEST.DATEHELD) = 1;

--Q#6
SELECT EVENTPLAN.PLANNO
        ,AVG(EVENTPLANLINE.NUMBERFLD) AS AVGNUMBERFLD
FROM EVENTPLAN 
        JOIN EVENTPLANLINE ON EVENTPLAN.PLANNO=EVENTPLANLINE.PLANNO
WHERE EVENTPLANLINE.LOCNO = 'L100'
GROUP BY EVENTPLAN.PLANNO;

--Q#7
SELECT EVENTPLAN.PLANNO
        ,AVG(EVENTPLANLINE.NUMBERFLD)
FROM EVENTPLAN 
        JOIN EVENTPLANLINE ON EVENTPLAN.PLANNO=EVENTPLANLINE.PLANNO
WHERE EVENTPLANLINE.LOCNO = 'L100'
GROUP BY EVENTPLAN.PLANNO
HAVING COUNT(EVENTPLANLINE.PLANNO) > 1;