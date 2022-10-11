{{ config(materialized='table', alias='test_table') }}

select *
from SNOWFLAKE_SAMPLE_DATA.TPCH_SF100.CUSTOMER