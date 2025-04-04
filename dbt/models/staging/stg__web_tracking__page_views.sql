{{ config(materialized='table') }}

with source as (
    select *
    from {{ source('web_tracking', 'pageviews')}}
)
select *
from source
limit 10