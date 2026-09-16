select *

from {{ ref('stablecoin_activity_per_day', v = 2)}}

where type ='Fiat-backed'