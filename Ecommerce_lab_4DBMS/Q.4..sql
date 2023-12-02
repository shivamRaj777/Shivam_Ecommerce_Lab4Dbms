# Q3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
#________________________________________________________________________________________________________________
#approach: 
 # Identfiy the tables.[order,customer]
 use ecommerce;
 select *from customer;
 select *from orders;
 #--------------------------------------------------------------------------------------------------------------
 # Apply join between these two tables.alter
 select *from orders as o
 inner join customer as c
 on c.CUS_ID=O.CUS_ID;
 #-------------------------------------------------------------------------------------------------------------
 #refining the data: as o.* will only select- all the column of order table 
SELECT o.*  FROM orders AS o
INNER JOIN customer AS c
ON c.CUS_ID=o.CUS_ID ;
#--------------------------------------------------------------------------------------------------------------
#taking relevant column only:
select o.*,c.CUS_NAME,CUS_GENDER from orders as o
inner join customer as c
on c.CUS_ID=o.CUS_ID HAVING o.ORD_AMOUNT>=3000;
#--------------------------------------------------------------------------------------------------------------
#FINAL SOLUTION: WHERE WE WILL display the total count of genders for amount>=3000

select count(t2.CUS_GENDER) as NO_OF_CUSTOMERS, t2.CUS_GENDER as GENDER FROM
  (
    select t1.CUS_ID,t1.CUS_GENDER,t1.ORD_AMOUNT,t1.CUS_NAME from
     (
       select o.*,c.CUS_NAME,CUS_GENDER from orders as o
       inner join customer as c
       on c.CUS_ID=o.CUS_ID HAVING o.ORD_AMOUNT>=3000
     ) as t1
  ) as t2 GROUP BY t2.CUS_GENDER;
