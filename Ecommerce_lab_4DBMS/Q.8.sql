#Q.8 Display the id and name of the product ordered after "2021-10-05"
#=====================================================================
#identify the table: [product,order,supplier_pricing]
select *from orders;
#====================================================================
#now joining orders table with supplier_pricing
select *from orders as o
inner join supplier_pricing as sp
on o.PRICING_ID=sp.PRICING_ID;
#====================================================================
#now considering orders as per date :
SELECT o.*, sp.PROD_ID FROM orders AS o
inner join 
supplier_pricing as sp on sp.PRICING_ID=o.pricing_id and o.ord_date>"2021-10-05";
#=====================================================================
# Lets take relevent colunm only
select * from product as p
inner join 
(
	SELECT o.*, sp.PROD_ID FROM orders AS O
	inner join 
	supplier_pricing as sp on sp.PRICING_ID=o.pricing_id
) as q 
on p.PROD_ID = q.PROD_ID;
#======================================================================
select p.PROD_ID,p.PRO_NAME from product as p
inner join 
(
	SELECT o.*, sp.PROD_ID FROM orders AS O
	inner join 
	supplier_pricing as sp on sp.PRICING_ID=o.pricing_id and O.ord_date>"2021-10-05"
) as q 
on p.PROD_ID = q.PROD_ID;