create table "transaction"(
	transaction_id int not null primary key
	, product_id int not null
	, customer_id int not null
	, transaction_date date
	, online_order bool
	, order_status varchar
	, brand varchar
	, product_line varchar
	, product_class varchar
	, product_size varchar
	, list_price float8
	, standart_cost float8);
	
create table "customer"(
	customer_id int not null primary key
	, first_name text
	, last_name text
	, gender varchar
	, DOB date
	, job_title text
	, job_industry_category text
	, wealth_segment text
	, deceased_indicator varchar(3)
	, owns_car varchar(3)
	, address text
	, postcode int4
	, state text
	, country text
	, prorerty_valuation int4);
	

select distinct brand from transaction where standart_cost>1500;

select transaction_id from transaction where order_status = 'Approved' 
and transaction_date between '2017-04-01'and '2017-04-09';

select job_title from customer where job_title like 'Senior%' and 
(job_industry_category = 'IT' or job_industry_category = 'Financial Services');

select distinct brand from transaction where customer_id in 
(select customer_id from customer where job_industry_category = 'Financial Services');

select first_name, last_name from customer where customer_id in
(select customer_id from transaction where online_order is true and 
brand in ('Giant Bicycles', 'Norco Bicycles', 'Trek Bicycles')) limit 10;

select customer.customer_id, first_name, last_name from customer left join transaction 
on customer.customer_id = transaction.customer_id
where transaction_id is null;

select customer_id, standart_cost from transaction 
where standart_cost = (select max(standart_cost) from transaction) 
and customer_id in (select customer_id from customer where job_industry_category = 'IT');

select customer_id, first_name, last_name, job_industry_category from customer 
where job_industry_category in ('IT', 'Health')
and customer_id in 
(select customer_id from transaction 
where transaction_date between '2017-07-07' and '2017-07-17' and order_status ='Approved');




