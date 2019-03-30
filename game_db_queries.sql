-- GAME DATABASE QUERIES
-- SER 322 Deliverable 3
-- Authors: Josh Goralczyk (jgoralcz), Jeremy Powell (jcpowel5)

-- * realistic select queries for each tables *

-- I care about the id because I would prefer to use it to map to a URL later on.
-- That is the reason for the SELECT *, and select id.

--
-- get the series information and a list of game names associated with that series need prepared statement to fully query
--
SELECT s.description, s.name, g.name
FROM Series s
JOIN Games g ON s_id = g.series_id
GROUP BY s.name;

--
-- get 50 game info with series names and release date, order by name ascended where name LIKE (prepared statement).
-- used to search through the database for name
--

SELECT g.english_name, g.other_name, g.description, g.image, s.name, s.release_date
FROM Games g
JOIN Series s ON g.series_id=s.id
ORDER BY t1.english_name ASC
LIMIT 50;
-- WHERE g.english_name LIKE '%name%' OR s.name ILIKE '%name%'

--
-- get the number of games in each series and name limit 50, allow pagination (when we do a prepared statement),
-- and order by name ascended based off of offset
--
SELECT s.name, count(g)
FROM series s
JOIN Games g ON g.series_id=s.id
GROUP BY s.name
ORDER BY s.name ASC
LIMIT 50;
-- OFFSET ?

--
-- get the number of games each company is a part of, and order by the name ASC, limit by 50, and allow pagination (when we do a prepared statement)
--
SELECT c.name, count(g)
FROM Games g
       JOIN Companies_Game cg ON g.id=cg.game_id
       JOIN Companies c ON c.id=cg.game_id
GROUP BY g.name
ORDER BY c.name ASC
LIMIT 50;
-- OFFSET ?

--
-- get all companies that worked on a game
--
SELECT c.name, c.description, g.name, g.description, g.image,
FROM Games g
JOIN Companies_Game cg ON g.id=cg.game_id
JOIN Companies c ON c.id=cg.game_id
ORDER BY g.english_name ASC
LIMIT 100;
-- WHERE GAME ILIKE '%name%'

--
-- get all information on a game (like a wikipedia page)
--
SELECT *
FROM Games g
JOIN Series s ON g.series_id=s.id
JOIN `Engines` e ON g.engine_id=e.id
JOIN Companies_Game cg ON g.id=cg.game_id
  JOIN Companies c ON cg.company_id=c.id

-- WHERE GAME LIKE '%name%'

--
-- get all workers who worked on a game
--

-- SELECT *