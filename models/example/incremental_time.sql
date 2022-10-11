{{ config(materialized='incremental', unique_key = 't_time_id') }}

select t_time_sk, t_time_id, to_time(concat(t_hour, ':', t_minute, ':', t_second)) clock_time
from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF10TCL.TIME_DIM
where clock_time <= current_time

{% if is_incremental() %}
    and clock_time > (select max(clock_time) from {{ this }})
{% endif %}