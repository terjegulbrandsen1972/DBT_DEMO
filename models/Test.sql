select
*
from {{ source('demo', 'BIKE') }} --source=refererer til kilder

limit 10; --limit result to 10 rows