# Q9) Create a stored procedure to display supplier id, name, rating and Type_of_supplier. 
# If rating >4 then “Genuine Supplier” if rating >2 “Average Supplier” else “Supplier should not be considered”.
use ecommerce;
select report.SUPP_ID, report.Average,
CASE
	WHEN report.Average =5 THEN 'Excellent Service'
	WHEN report.Average >4 THEN 'Good Service'
	WHEN report.Average >2 THEN 'Average Service'
	ELSE 'Poor Service'
END AS Type_of_Service from
 (
	select t2.supp_id, avg(rat_ratstars) as Average from
   (
      select sp.SUPP_ID,t1.ord_id,t1.rat_ratstars from supplier_pricing as sp
	  inner join
      (
	    select o.PRICING_ID, r.ORD_ID , r.RAT_RATSTARS from orders as o
	    inner join 
	    rating as r on o.ORD_ID = r.ORD_ID
      ) as t1 on sp.PRICING_ID =t1.pricing_id
   ) as t2 group by t2.SUPP_ID
) as report; 
#========================================================================================================================
#apply delimeters
DELIMITER $$
USE `ecommerce`$$
CREATE PROCEDURE `supplier_ratings` ()
BEGIN
     select report.SUPP_ID, report.Average,
      CASE
	      WHEN report.Average =5 THEN 'Excellent Service'
	      WHEN report.Average >4 THEN 'Good Service'
	      WHEN report.Average >2 THEN 'Average Service'
	      ELSE 'Poor Service'
     END AS Type_of_Service from
    (
	   select t2.supp_id, avg(rat_ratstars) as Average from
      (
          select sp.SUPP_ID,t1.ord_id,t1.rat_ratstars from supplier_pricing as sp
	      inner join
          (
	        select o.PRICING_ID, r.ORD_ID , r.RAT_RATSTARS from orders as o
	        inner join 
	        rating as r on o.ORD_ID = r.ORD_ID
          ) as t1 on sp.PRICING_ID =t1.pricing_id
      ) as t2 group by t2.SUPP_ID
    ) as report; 
END$$

DELIMITER ;