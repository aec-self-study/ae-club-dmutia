{{ config(materialized='table') }}

with source as (
    select *
    from {{ source('web_tracking', 'pageviews')}}
)
select 
    id,
    coalesce(customer_id, visitor_id) as visitor_id,
    device_type,
    timestamp,
    page,
    customer_id
from source
