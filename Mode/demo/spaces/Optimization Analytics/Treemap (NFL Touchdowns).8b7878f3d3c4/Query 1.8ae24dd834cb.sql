select season, team, player, sum(yards) as yards
from benn.nfl_touchdowns 
group by season, team, player
order by season desc, team
limit 2000