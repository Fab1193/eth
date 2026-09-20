
  
    

create or replace transient table DBT.DBT_FAB_marts.confirmed_frauds
    

    
    as (

select
*
from DBT.DBT_FAB.stg_transactions_enriched

where from_address in ('0x646c4fbdf82b5766c5eaf1fab9a8927fb5992d38', '0x014523f2a626f0e3dbc241b8e9a4c14c507a6360')
    )
;


  