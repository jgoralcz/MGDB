-- GAME DATABASE QUERIES
-- SER 322 Deliverable 3
-- Authors: Josh Goralczyk (jgoralcz), Jeremy Powell (jcpowel5)

-- * realistic select queries for each tables *

--
-- get 100 game info with series names and release date, order by name ascended..
--

SELECT g.english_name, g.other_name, g.description, g.image, s.name, s.release_date
FROM Games g
JOIN Series s ON g.series_id=s.id
ORDER BY t1.english_name ASC
LIMIT 100;
-- WHERE GAME ILIKE '%name%'

--
-- get the number of games in each series and name
--


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