# Q1	and Q2. Creation of table 

create database ECommerce;
use ECommerce;

create table supplier(
   SUPP_ID int primary key,
   SUPP_NAME varchar(50) NOT NULL,
   SUPP_CITY varchar(50) NOT NULL,
   SUPP_PHONE varchar(50) NOT NULL
   );

create table customer(
  CUS_ID INT PRIMARY KEY,
  CUS_NAME VARCHAR(20) NOT NULL,
  CUS_PHONE VARCHAR(10) NOT NULL,
  CUS_CITY VARCHAR(30) NOT NULL,
  CUS_GENDER CHAR
  );

create table category (
   CAT_ID INT PRIMARY KEY,
   CAT_NAME VARCHAR(20) NOT NULL
   );
   
create table product(
  PROD_ID INT PRIMARY KEY,
  PRO_NAME VARCHAR(20) NOT NULL DEFAULT "DUMMY",
  PRO_DESC VARCHAR(60),
  CAT_ID INT ,
  foreign key(CAT_ID) references category(CAT_ID)
  );
  
create table supplier_pricing(
  PRICING_ID INT PRIMARY KEY,
  PROD_ID INT NOT NULL,
  SUPP_ID INT NOT NULL,
  SUPP_PRICE INT default 0,
  foreign key(PROD_ID) references product(PROD_ID),
  foreign key(SUPP_ID) references supplier(SUPP_ID)
  );
  
create table orders(
   ORD_ID INT PRIMARY KEY,
   ORD_AMOUNT INT NOT NULL,
   ORD_DATE DATE NOT NULL,
   CUS_ID INT NOT NULL,
   PRICING_ID INT NOT NULL,
   foreign key(CUS_ID) references customer(CUS_ID),
   foreign key(PRICING_ID) references supplier_pricing(PRICING_ID)
   );
   
create table rating(
   RAT_ID INT PRIMARY KEY,
   ORD_ID INT NOT NULL,
   RAT_RATSTARS INT NOT NULL,
   foreign key(ORD_ID) references orders(ORD_ID)
   );