-- GAME DATABASE DATA
-- SER 322 Deliverable 3
-- Authors: Josh Goralczyk (jgoralcz), Jeremy Powell (jcpowel5)

--  Games Used:
-- 1)
-- 2) Portal 2
-- 3) Grand Theft Auto IV
-- 4) The Legend of Zelda: Ocarina of Time
-- 5) Witcher 3


-- Data for table: Engines
-- Keys start at: 1
INSERT INTO Engines VALUES (NULL, 'Unreal Engine 3', 'The Unreal Engine is a game engine developed by Epic Games, first showcased in the 1998 first-person shooter game Unreal.', '1998-05-01', 'https://en.wikipedia.org/wiki/File:UE_Logo_Black_Centered.svg');
INSERT INTO Engines VALUES (NULL, 'Source', 'Source is a 3D video game engine developed by Valve Corporation. ', '2004-06-01', 'https://en.wikipedia.org/wiki/File:Source_engine_logo_and_wordmark.svg');
INSERT INTO Engines VALUES (NULL, 'Rockstar Advanced Game Engine', 'The Rockstar Advanced Game Engine (RAGE) is a proprietary game engine developed by RAGE Technology Group, a division of Rockstar Games Rockstar San Diego studio.', '2006-05-23', 'https://en.wikipedia.org/wiki/File:Rockstar_Advanced_Game_Engine_Logo.svg');
INSERT INTO Engines VALUES (NULL, 'M64 engine', 'The engine details are unknown.', '1996-01-01', 'https://en.wikipedia.org/wiki/File:Nintendo.svg');
INSERT INTO Engines VALUES (NULL, 'REDengine 3', 'REDengine is a game engine developed by CD Projekt Red. It was designed for CD Projekt Red nonlinear role-playing video games.', '2011-05-01', 'https://en.wikipedia.org/wiki/File:REDEngine_3_logo.jpg');


-- Data for table: Series
-- Keys start at: 1000
INSERT INTO Series VALUES (NULL, 'Witcher', '2007-10-26', 'The Witcher by Polish writer Andrzej Sapkowski, is a fantasy series of short stories and novels about the witcher Geralt of Rivia.', 'https://en.wikipedia.org/wiki/File:The_Witcher_EU_box.jpg');
INSERT INTO Series VALUES (NULL, 'Zelda', '1986-02-21', 'The Legend of Zelda is a fantasy action-adventure video game franchise created by Japanese game designers Shigeru Miyamoto and Takashi Tezuka.', 'https://en.wikipedia.org/wiki/File:Zelda_Logo.svg');
INSERT INTO Series VALUES (NULL, 'Grand Theft Auto', '1997-10-21', 'Grand Theft Auto (GTA) is a long-running series of video games, published by Rockstar Games and developed by subsidiary companies.', 'https://en.wikipedia.org/wiki/File:Grand_Theft_Auto_logo_series.svg');
INSERT INTO Series VALUES (NULL, 'Portal', '2007-10-10', 'Portal is a series of first-person puzzle-platform video games developed by Valve Corporation.', 'https://en.wikipedia.org/wiki/File:Portal_logo.png');
INSERT INTO Series VALUES (NULL, 'Mass Effect', '2007-11-20', 'Mass Effect is a science-fiction action-role-playing third-person-shooter video-game series developed by the Canadian company BioWare and released for the Xbox 360, PlayStation 3, and Microsoft Windows, with the third instalment also released on the Wii U.', 'https://en.wikipedia.org/wiki/File:Logo_of_Mass_Effect.png');


-- Data for table: Games
-- Keys start at: 100000
INSERT INTO Games VALUES (NULL, 1, 1004, 'Mass Effect 2 is an action role-playing video game developed by BioWare and published by Electronic Arts.', 'Mass Effect 2', 'ME2', 'https://en.wikipedia.org/wiki/File:MassEffect2_cover.PNG');
INSERT INTO Games VALUES (NULL, 2, 1003, 'Like the original Portal (2007), players solve puzzles by placing portals and teleporting between them. Portal 2 adds features including tractor beams, lasers, light bridges, and paint-like gels that alter player movement or allow portals to be placed on any surface.', 'Portal 2', '', 'https://en.wikipedia.org/wiki/File:Portal2cover.jpg');
INSERT INTO Games VALUES (NULL, 3, 1002, 'Grand Theft Auto V is an action-adventure video game developed by Rockstar North and published by Rockstar Games.', 'Grand Theft Auto V', 'GTAV', 'https://en.wikipedia.org/wiki/File:Grand_Theft_Auto_V.png');
INSERT INTO Games VALUES (NULL, 4, 1001, 'The Legend of Zelda: Ocarina of Time is an action-adventure game developed and published by Nintendo for the Nintendo 64.', 'The Legend of Zelda: Ocarina of Time', 'Zelda 10', 'https://en.wikipedia.org/wiki/File:The_Legend_of_Zelda_Ocarina_of_Time_box_art.png');
INSERT INTO Games VALUES (NULL, 5, 1000, 'The Witcher 3: Wild Hunt[a] is a 2015 action role-playing game developed and published by CD Projekt.', 'Witcher 3', 'Witcher', 'https://en.wikipedia.org/wiki/File:Witcher_3_cover_art.jpg');


-- Data for table: Critics
-- Keys start at: 1000
INSERT INTO Critics VALUES (NULL, 'Metacritic');
INSERT INTO Critics VALUES (NULL, 'Game Informer');
INSERT INTO Critics VALUES (NULL, 'Forbes');
INSERT INTO Critics VALUES (NULL, 'IGN');
INSERT INTO Critics VALUES (NULL, 'GameSpot');


-- Data for table: Companies
-- Keys start at: 1000
INSERT INTO Companies VALUES (NULL, 'Electronic Arts', 'An American video game company headquartered in Redwood City, California.');
INSERT INTO Companies VALUES (NULL, 'Valve Corporation', 'An American video game developer, publisher and digital distribution company headquartered in Bellevue, Washington.');
INSERT INTO Companies VALUES (NULL, 'Rockstar Games', 'An American video game publisher based in New York City.');
INSERT INTO Companies VALUES (NULL, 'Nintendo', 'A Japanese multinational consumer electronics and video game company headquartered in Kyoto.');
INSERT INTO Companies VALUES (NULL, 'CD Projekt', 'A Polish video game publisher and distributor based in Warsaw, founded in May 1994 by Marcin Iwiński and Michał Kiciński.');


-- Data for table: Ratings
-- Keys start at: 1000000
INSERT INTO Ratings VALUES (NULL, 100000, 1000, 94, '2010-01-26', 'Mass Effect 2 metascore on Metacritic based on 55 critics');
INSERT INTO Ratings VALUES (NULL, 100001, 1001, 95, '2011-04-18', 'Portal 2 score on Game Informer');
INSERT INTO Ratings VALUES (NULL, 100002, 1002, 100, '2013-09-16', 'Grand Theft Auto V score on Forbes');
INSERT INTO Ratings VALUES (NULL, 100003, 1003, 100, '1998-11-25', 'The Legend of Zelda: Ocarina of Time score on IGN');
INSERT INTO Ratings VALUES (NULL, 100004, 1004, 80, '2016-05-26', 'The Witcher 3 score on GameSpot based on 2110 ratings');
