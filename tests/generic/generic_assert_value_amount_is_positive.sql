{% test assert_value_amount_positive(model, column_name, field) %}

select
    {{ field }},
    sum({{ column_name }}) as total_amount
from {{ model }}

group by {{ field }}

having sum({{ column_name }}) < 0

{% endtest %}