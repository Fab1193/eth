{{ config(materialized='incremental', 
		incremental_strategy='microbatch',
		begin='2026-09-20', 
		event_time='date', 
		batch_size='day',
		lookback=2, 
		concurrent_batches=false)}}

select
address,
block_number,
block_timestamp,
bytecode,
date,
last_modified

from {{ source('eth', 'contracts')}}