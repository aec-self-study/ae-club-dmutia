with customer_orders as (
  select
    customer_id,
    count(id) as number_of_orders,
    min(created_at) as first_order_at
  from `analytics-engineers-club.coffee_shop.orders`
  group by 1
)
select
  customer.id as customer_id,
  customer.name,
  customer.email,
  customer_orders.first_order_at,
  customer_orders.number_of_orders
from customer_orders
left join `analytics-engineers-club.coffee_shop.customers` customer
on customer_orders.customer_id = customer.id
order by customer_orders.first_order_at asc
limit 5