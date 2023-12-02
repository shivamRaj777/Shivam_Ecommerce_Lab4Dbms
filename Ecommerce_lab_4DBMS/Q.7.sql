#Q7.Find the least expensive product from each category and print the table with category_id,name,product name and price of the product
#======================================================================================================================================
#approach identify the table:[supplier_pricing,category,product]
select *from category;
select *from supplier_pricing;
select *from product;
#======================================================================================================================================
#now we need to find minimum price of products hence we start with supplier_pricing table:
select *from supplier_pricing;
select PROD_ID ,min(SUPP_PRICE) as MIN_PRICE from supplier_pricing group by PROD_ID;
#=====================================================================================================================================
#PERFORM JOIN 1st.with product and supplier_pricing based on prod_id
select *from product as p
inner join supplier_pricing as sp 
on sp.PROD_ID=p.PROD_ID;
#=====================================================================================================================================
#now we will refine the result as we want four column only given in the question:
select p.CAT_ID, p.PRO_NAME, t2.* from product as p
inner join
(
	select prod_id, min(supp_price) as Min_Price from supplier_pricing group by prod_id
) as t2 on t2.PROD_ID=p.PROD_ID;
#=====================================================================================================================================
# Join above result with category
select * from category as cat
inner join 
(
	select p.CAT_ID, p.PRO_NAME, t2.* from product as p
	inner join
	(
		select prod_id, min(supp_price) as Min_Price from supplier_pricing group by prod_id
	) as t2 on t2.PROD_ID=p.PROD_ID
) as t3 on t3.CAT_ID= cat.CAT_ID;
#===============================================================================================================================
# Refine the result
select c.CAT_ID,c.CAT_NAME, min(t3.min_price) as Min_Price from category as c
inner join 
(
	select p.CAT_ID, p.PRO_NAME, t2.* from product as p
	inner join
	(
		select prod_id, min(supp_price) as Min_Price from supplier_pricing group by prod_id
	) as t2 on t2.PROD_ID=p.PROD_ID
) as t3 on t3.CAT_ID= c.CAT_ID group by t3.CAT_ID;

