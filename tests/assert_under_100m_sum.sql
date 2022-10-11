select
    sum(c_acctbal)
from {{ ref('playing_with_test') }}
having
    sum(c_acctbal) > 68500000000