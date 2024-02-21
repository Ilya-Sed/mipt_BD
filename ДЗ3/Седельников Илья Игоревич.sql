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
	

select * from "transaction";

select count(*) as quantity, job_industry_category from customer
group by job_industry_category
order by count(*) desc;

select date_trunc('month', transaction_date) as date_month
     , customer.job_industry_category
     , sum(transaction.list_price)
from transaction inner join customer
on customer.customer_id = transaction.customer_id
group by customer.job_industry_category, date_month
order by date_month, job_industry_category;

select transaction.brand, count(*) as quantity
from transaction inner join customer
on customer.customer_id = transaction.customer_id
where online_order is true 
	and order_status = 'Approved' 
	and customer.job_industry_category = 'IT'
group by transaction.brand
order by quantity desc;

select customer_id
     , sum(list_price) as summa_tr
     , max(list_price) as maximum_tr
     , min(list_price) as minimum_tr
     , count(customer_id) as quantity_tr
     from transaction
group by customer_id
order by summa_tr desc, quantity_tr desc;

select customer_id,
      sum(list_price) over (partition by customer_id) as sum_transaction,
      min(list_price) over (partition by customer_id) as min_transaction,
      max(list_price) over (partition by customer_id) as max_transaction,
      count(list_price) over (partition by customer_id ) as count_transaction
from transaction order by sum_transaction desc, count_transaction desc;
    
select first_name
     , last_name
     , min_transaction
     , max_transaction
from(select first_name
     , last_name
     , min(list_price) over (partition by transaction.customer_id) as min_transaction
     , max(list_price) over (partition by transaction.customer_id) as max_transaction
     from customer join transaction
     on customer.customer_id = transaction.customer_id)
where min_transaction = (select min(list_price) from transaction)
or max_transaction = (select max(list_price) from transaction);

select min(list_price) from transaction;
select max(list_price) from transaction;

select customer_id
     , first_value(list_price) over (partition by customer_id) as first_transaction_price
     , first_value(transaction_id) over (partition by customer_id) as first_transaction_id
from transaction;

select first_name
     , last_name
     , job_industry_category
     , interval
from (select customer.customer_id 
           , first_name
           , last_name
           , job_industry_category
           , min(transaction_date) as min_time
           , max(transaction_date) as max_time
           , (max(transaction_date)-min(transaction_date)) as interval
      from customer inner join transaction 
      on customer.customer_id = transaction.customer_id
      group by customer.customer_id)
where interval = (select max(interval) from (select customer.customer_id 
           , first_name
           , last_name
           , job_industry_category
           , min(transaction_date) as min_time
           , max(transaction_date) as max_time
           , (max(transaction_date)-min(transaction_date)) as interval
           from customer inner join transaction 
           on customer.customer_id = transaction.customer_id
           group by customer.customer_id));

