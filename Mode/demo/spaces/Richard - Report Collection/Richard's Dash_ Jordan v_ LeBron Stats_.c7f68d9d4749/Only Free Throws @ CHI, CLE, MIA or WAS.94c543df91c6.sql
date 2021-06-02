-- Returns first 100 rows from johnny_kelley.jordan_v_lebron
SELECT player,
ft AS "Free Throws",
team,
opp as "Opponent"
FROM johnny_kelley.jordan_v_lebron
WHERE opp = 'MEM' 
OR opp = 'MIL' 
OR opp = 'NYK'
OR opp = 'CHI'
AND player = 'Jordan'
