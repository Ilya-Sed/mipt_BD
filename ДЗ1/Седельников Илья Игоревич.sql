CREATE table "transaction" (
	Transaction_id int not null
	, Product_id text not null
	, Customer_id int not null
	, Transaction_date varchar(10)
	, Online_order bool
	, Order_status text
);

insert into transaction values
(1,	'2-71.49', 2950, '25.02.2017', false,	'Approved'),
(2,	'3-2091.47', 3120, '21.05.2017', true,	'Approved'),
(3,	'37-1793.43', 402, '16.10.2017', false,	'Approved'),
(4,	'88-1198.46', 3135, '31.08.2017', false,	'Approved'),
(5,	'78-1765.3', 787, '01.10.2017', true,	'Approved'),
(6,	'25-1538.99', 2339, '08.03.2017', true,	'Approved'),
(7,	'22-60.34',	1542, '21.04.2017', true,	'Approved'),
(8,	'15-1292.84', 2459,	'15.07.2017', false,	'Approved'),
(9,	'67-1071.23', 1305,	'10.08.2017', false,	'Approved'),
(10, '12-1231.15', 3262, '30.08.2017', true,	'Approved');

create table "product" (
	Product_id text not null
	, brand text
	, product_line text
	, product_class text
	, product_size text
	, list_price float8
	, standart_cost float8
	);
	
insert into product values
('2-71.49','Solex','Standard','medium','medium',71.49,53.62),
('3-2091.47','Trek Bicycles','Standard','medium','large',2091.47,388.92),
('37-1793.43','OHM Cycles','Standard','low','medium',1793.43,48.82),
('88-1198.46','Norco Bicycles','Standard','medium','medium',1198.46,381.10),
('78-1765.3','Giant Bicycles','Standard','medium','large',1765.3,709.48),
('22-60.34','WeareA2B','Standard','medium','medium',60.34,45.26),
('15-1292.84','WeareA2B','Standard','medium','medium',1292.84,13.44),
('67-1071.23','Solex','Standard','medium','large',1071.23,380.74),
('12-1231.15','WeareA2B','Standard','medium','medium',1231.15,161.60),
('61-71.16','OHM Cycles','Standard','low','medium',71.16,56.93);

create table "customer"(
Customer_id int not null
, First_name text
, Last_name text
, Gender text
, DOB varchar(10)
, Job_title text
, Job_industry_category text
, Welth_segment text
, Deceased_indicator bool
, Owns_car bool
, Address text
, Postcode int4
,Property_valuation int4
);

insert into customer values
(12,'Sawyere','Flattman','Male','1994-07-21','Nuclear Power Engineer','Manufacturing','Mass Customer',False,False,'9 Mcbride Trail',2760,8),
(15,'Erroll','Radage','Male','2000-07-13','Junior Executive','Manufacturing','Mass Customer',False,False,'82391 Kensington Lane',3058,9),
(19,'Sorcha','Keyson','Female','2001-04-15','Geological Engineer','Manufacturing','High Net Worth',False,False,'18 Jenna Center',2650,7),
(20,'Basile','Firth','Male','1980-08-13','Project Manager','Manufacturing','Mass Customer',False,False,'3 Cordelia Plaza',2153,10),
(21,'Mile','Cammocke','Male','1980-09-20','Safety Technician I','Manufacturing','Affluent Customer',False,True,'28 5th Center',4413,3),
(29,'Mona','Sancraft','Female','1968-06-22','Safety Technician III','Manufacturing','Mass Customer',False,False,'63 Lukken Drive',2170,9),
(32,'Marion','Vanichkin','Female','1995-04-20','Legal Assistant','Manufacturing','Affluent Customer',False,False,'78 Del Sol Hill',2535,8),
(40,'Tomasine','Jerche','Female','1981-10-27','Payment Adjustment Coordinator','Manufacturing','Affluent Customer',False,false,'89314 Eagle Crest Center',4670,2),
(42,'Chiquita','Durnall','Female','1977-03-28','Accountant III','Manufacturing','Mass Customer',False,False,'70875 Hudson Point',3212,6),
(50,'Whitby','Schapero','Male','1980-10-01','Account Executive','Manufacturing','Mass Customer',False,True,'6 Homewood Avenue',2142,8);

create table "postcode" (
	Postcode int4 not null,
	State text not null,
	Country_id int4 not null);

insert into postcode values
(2016,'New South Wales',1),
(2153,'New South Wales',1),
(4211,'QLD',1),
(2448,'New South Wales',1),
(3216,'VIC',1),
(2210,'New South Wales',1),
(2650,'New South Wales',1),
(2023,'New South Wales',1),
(3044,'VIC',1),
(4557,'QLD',1);

create table "Справочник_postcode" (
	Country_id int4 not null,
	Country text not null);

insert into Справочник_postcode values (1,'Australia');

truncate table postcode ;

alter table transaction add primary key(Transaction_id);
alter table product add primary key(Product_id);
alter table customer add primary key(Customer_id);