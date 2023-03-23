{{ config(
    materialized='table'
 ) }}

select customer_id, name, email, min(created_at) as first_order_at, count(*) as number_of_orders
from `analytics-engineers-club.coffee_shop.orders` as o
left join `analytics-engineers-club.coffee_shop.customers` as c 
  on c.id = o.customer_id
group by 1, 2, 3
order by first_order_at
limit 5