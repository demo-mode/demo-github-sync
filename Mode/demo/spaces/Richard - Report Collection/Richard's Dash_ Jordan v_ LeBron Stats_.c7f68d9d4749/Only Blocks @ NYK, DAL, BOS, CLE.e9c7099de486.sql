-- Returns first 100 rows from johnny_kelley.jordan_v_lebron
SELECT player,
blk AS "Blocks",
team,
opp AS "Opponent"
FROM johnny_kelley.jordan_v_lebron
WHERE opp = 'NYK'
OR opp = 'DAL' 
OR opp = 'BOS'
OR opp = 'CLE'
