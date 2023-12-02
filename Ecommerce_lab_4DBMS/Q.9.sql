#Q9 Display customer name and gender whose names start or end with character 'A'
#===============================================================================
#identify the table [customer]
select *from customer;
#==============================================================================
# we want only name,gender
select CUS_NAME,CUS_GENDER FROM customer;
#=====================================================================================
#refining the table based on character ending and starting with a so we will use LIKE:
select customer.CUS_NAME,customer.CUS_GENDER from customer where customer.CUS_NAME like "A%" or customer.CUS_NAME like "%A";