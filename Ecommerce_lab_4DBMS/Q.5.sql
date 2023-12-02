# Q5. Display all the orders along with product name ordered by a customer having Customer_id=2
#==============================================================================================
#Aprroach: find the tables related to query
# tables:[orders,product,supplier_pricing]
select o.* from orders as o;
select *from supplier_pricing;
select *from product;
#==============================================================================================
#perform join of order table with supplier_pricing based on pricing_id
select o.* from orders as o
inner join supplier_pricing as sp
on sp.PRICING_ID=o.PRICING_ID;
#==============================================================================================
#Apply join with customer table based on cus_id:
select p.* from 
     (
     select o.* from orders as o
     inner join supplier_pricing as sp
     on sp.PRICING_ID=o.PRICING_ID
     ) as p
inner join customer as c
where p.CUS_ID=c.CUS_ID; 
#=============================================================================================
#now refining the datas more by adding cus_id=2
select c.CUS_ID,c.CUS_NAME, p.ord_id,p.ord_amount from
 (
	 SELECT O.* FROM orders AS O
	inner join supplier_pricing as sp
	where o.PRICING_ID=sp.PRICING_ID
 ) as p
 inner join customer as c
 where p.CUS_ID=c.CUS_ID and c.CUS_ID=2; 
 #============================================================================================
#now final solution to display only cus_id, cus_name,order_id and product name
 select q.CUS_ID, q.cus_name,q.ord_id, product.pro_name from
(
 select c.CUS_ID,c.CUS_NAME, p.ord_id,p.ord_amount, p.prod_id from
	(
		SELECT O.*, sp.prod_id FROM ORDERS AS O
		inner join supplier_pricing as sp
		where o.PRICING_ID=sp.PRICING_ID
	) as p
	inner join customer as c
	where p.CUS_ID=c.CUS_ID and c.CUS_ID=2
  )as q
  inner join product
on q.prod_id= product.prod_id;