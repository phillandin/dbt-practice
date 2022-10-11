{{ config(materialized='view') }}

select o_orderkey,
    o_orderdate,
    o_totalprice,
    sum(o_totalprice) over(order by o_orderdate rows between unbounded preceding and current row) running_total
from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS