select action_day
from {{ ref('d_time') }}
where action_day < 1
   or action_day > 31