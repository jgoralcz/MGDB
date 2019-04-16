-- GAME DATABASE QUERIES
-- SER 322 Deliverable 3
-- Authors: Josh Goralczyk (mgdb), Jeremy Powell (jcpowel5)

-- * realistic select queries for each tables *

--
-- get the series information and a list of game names associated with that series need prepared statement to fully query
--
SELECT s.description, s.name, g.english_name
FROM Series s
JOIN Games g ON s.id = g.series_id
-- WHERE s.name = ?;

--
-- get 50 game info with series names and release date, order by name ascended where name LIKE (prepared statement).
-- used to search through the database for names similar to their request
--
SELECT g.english_name, g.other_name, g.description, g.image, s.name, s.release_date
FROM Games g
JOIN Series s ON g.series_id=s.id
ORDER BY g.english_name ASC
LIMIT 50;
# WHERE g.english_name LIKE '%name%' OR s.name ILIKE '%name%'

--
-- get the number of games in each series and name limit 50, allow pagination (when we do a prepared statement),
-- and order by name ascended based off of offset
--
SELECT s.name, count(*) AS num_games
FROM series s
JOIN Games g ON g.series_id=s.id
GROUP BY s.name
ORDER BY s.name ASC
LIMIT 50;
-- OFFSET ?

--
-- get the number of games each company is a part of, and order by the name ASC, limit by 50, and allow pagination (when we do a prepared statement)
--
SELECT c.name, count(*) AS num_games
FROM Companies c
JOIN Companies_Game cg ON c.id=cg.company_id
GROUP BY c.name
ORDER BY c.name ASC
LIMIT 50;
-- OFFSET ?

--
-- get all companies that worked on a specific game
--
SELECT c.name, g.english_name
FROM Games g
JOIN Companies_Game cg ON g.id=cg.game_id
JOIN Companies c ON c.id=cg.company_id
WHERE g.english_name LIKE '%' || ? || '%'
ORDER BY g.english_name ASC
LIMIT 100;

--
-- get all information on a game (like a wikipedia page)
--
SELECT g.english_name, g.description, g.image, s.name, s.description, e.name, e.description, c.name, c.description
FROM Games g
JOIN Series s ON g.series_id=s.id
JOIN `Engines` e ON g.engine_id=e.id
JOIN Companies_Game cg ON g.id=cg.game_id
  JOIN Companies c ON cg.company_id=c.id
WHERE g.english_name LIKE '%' || ? || '%';
-- WHERE GAME LIKE '%name%'

--
-- get all workers who worked on a game, order by the first name ascending
--
SELECT first_name, last_name
FROM Games g
  LEFT JOIN Works_On wo ON g.id=game_id
  LEFT JOIN Workers w ON w.id=wo.worker_id
  LEFT JOIN Developers dev ON w.id=dev.worker_id
  LEFT JOIN Directors dir ON w.id=dir.worker_id
  LEFT JOIN Writers wri ON w.id=dir.worker_id
  LEFT JOIN Composers comp ON w.id=comp.worker_id
  LEFT JOIN Producers pro ON w.id=pro.worker_id
# WHERE g.id = 100004
WHERE g.id = ?
ORDER BY first_name ASC;

--
-- get all main character names and descriptions who are in a specific game
--
SELECT mc.name, mc.description
FROM Main_Characters mc
  JOIN Games g ON g.id=mc.game_id
# WHERE g.id = 100004
ORDER BY mc.name ASC;

