#Q6. Display the supplier details who can supply more than one product. which means more than 1
#==============================================================================================
#identify the table:[supplier,supplier_pricing]
select *from supplier as s;
select *from supplier_pricing as sp;
#now find the supplier who are supplying more than one product
select sp.SUPP_ID from supplier_pricing as sp
group by sp.SUPP_ID having count(sp.SUPP_ID)>3;
#==========================================================================================================
# Select supplier details from supplier only whose id is present in above query
SELECT SUP.* FROM supplier AS SUP WHERE SUP.SUPP_ID IN
(
	SELECT SP.SUPP_ID FROM supplier_pricing AS SP GROUP BY SP.SUPP_ID HAVING COUNT(SP.SUPP_ID)>3
) ;

#=========================================================================================================
#according to question this should be solution:as we are targetting suppliers who are selling more than one type of product so it should be all
#atleast one its there in question so valid solution is this :
SELECT SUP.* FROM supplier AS SUP WHERE SUP.SUPP_ID IN
(
	SELECT SP.SUPP_ID FROM supplier_pricing AS SP GROUP BY SP.SUPP_ID HAVING COUNT(SP.SUPP_ID)>1
) ;