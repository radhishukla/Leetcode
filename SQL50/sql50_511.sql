SELECT player_id, min(event_date) as first_login
FROM Activity
group by player_id;
