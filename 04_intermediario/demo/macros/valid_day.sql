{% test valid_day(model, column_name) %}

select *
from {{ model }}
where {{ column_name }} < 2
   or {{ column_name }} > 31

{% endtest %}