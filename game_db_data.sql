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
INSERT INTO Series VALUES (NULL, 'Mass Effect', '2007-11-20', 'Mass Effect is a science-fiction action-role-playing third-person-shooter video-game series developed by the Canadian company BioWare and released for the Xbox 360, PlayStation 3, and Microsoft Windows, with the third instalment also released on the Wii U.', 'https://en.wikipedia.org/wiki/File:Logo_of_Mass_Effect.png');
INSERT INTO Series VALUES (NULL, 'Portal', '2007-10-10', 'Portal is a series of first-person puzzle-platform video games developed by Valve Corporation.', 'https://en.wikipedia.org/wiki/File:Portal_logo.png');
INSERT INTO Series VALUES (NULL, 'Grand Theft Auto', '1997-10-21', 'Grand Theft Auto (GTA) is a long-running series of video games, published by Rockstar Games and developed by subsidiary companies.', 'https://en.wikipedia.org/wiki/File:Grand_Theft_Auto_logo_series.svg');
INSERT INTO Series VALUES (NULL, 'Zelda', '1986-02-21', 'The Legend of Zelda is a fantasy action-adventure video game franchise created by Japanese game designers Shigeru Miyamoto and Takashi Tezuka.', 'https://en.wikipedia.org/wiki/File:Zelda_Logo.svg');
INSERT INTO Series VALUES (NULL, 'Witcher', '2007-10-26', 'The Witcher by Polish writer Andrzej Sapkowski, is a fantasy series of short stories and novels about the witcher Geralt of Rivia.', 'https://en.wikipedia.org/wiki/File:The_Witcher_EU_box.jpg');


-- Data for table: Games
-- Keys start at: 100000
INSERT INTO Games VALUES (NULL, 1, 1004, 'Mass Effect 2 is an action role-playing video game developed by BioWare and published by Electronic Arts.', 'Mass Effect 2', 'ME2', 'https://en.wikipedia.org/wiki/File:MassEffect2_cover.PNG');
INSERT INTO Games VALUES (NULL, 2, 1003, 'Like the original Portal (2007), players solve puzzles by placing portals and teleporting between them. Portal 2 adds features including tractor beams, lasers, light bridges, and paint-like gels that alter player movement or allow portals to be placed on any surface.', 'Portal 2', '', 'https://en.wikipedia.org/wiki/File:Portal2cover.jpg');
INSERT INTO Games VALUES (NULL, 3, 1002, 'Grand Theft Auto V is an action-adventure video game developed by Rockstar North and published by Rockstar Games.', 'Grand Theft Auto V', 'GTAV', 'https://en.wikipedia.org/wiki/File:Grand_Theft_Auto_V.png');
INSERT INTO Games VALUES (NULL, 4, 1001, 'The Legend of Zelda: Ocarina of Time is an action-adventure game developed and published by Nintendo for the Nintendo 64.', 'The Legend of Zelda: Ocarina of Time', 'Zelda 10', 'https://en.wikipedia.org/wiki/File:The_Legend_of_Zelda_Ocarina_of_Time_box_art.png');
INSERT INTO Games VALUES (NULL, 5, 1000, 'The Witcher 3: Wild Hunt is a 2015 action role-playing game developed and published by CD Projekt.', 'Witcher 3', 'Witcher', 'https://en.wikipedia.org/wiki/File:Witcher_3_cover_art.jpg');


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


-- Data for table: Companies Game
-- Keys start at: 1000
INSERT INTO Companies_Game VALUES (NULL, 1000, 100000, '2007-10-26', '2019-03-28');
INSERT INTO Companies_Game VALUES (NULL, 1001, 100001, '1986-02-21', '2019-03-28');
INSERT INTO Companies_Game VALUES (NULL, 1002, 100002, '1997-10-21', '2019-03-28');
INSERT INTO Companies_Game VALUES (NULL, 1003, 100003, '2007-10-10', '2019-03-28');
INSERT INTO Companies_Game VALUES (NULL, 1004, 100004, '2007-11-20', '2019-03-28');


-- Data for table: Platforms
-- Keys start at: 1
INSERT INTO Platforms VALUES (NULL, 'PlayStation 4', 'The PlayStation 4 (PS4) is an eighth-generation home video game console developed by Sony Interactive Entertainment.', '2013-11-15', 'https://en.wikipedia.org/wiki/File:PS4-Console-wDS4.jpg');
INSERT INTO Platforms VALUES (NULL, 'Xbox One', 'Xbox One is a line of eighth generation home video game consoles developed by Microsoft. Announced in May 2013, it is the successor to Xbox 360 and the third console in the Xbox family.', '2013-11-22', 'https://en.wikipedia.org/wiki/File:Microsoft-Xbox-One-Console-Set-wKinect.jpg');
INSERT INTO Platforms VALUES (NULL, 'Xbox 360', 'The Xbox 360 is a home video game console developed by Microsoft. As the successor to the original Xbox, it is the second console in the Xbox series.', '2016-04-20', 'https://en.wikipedia.org/wiki/File:Xbox-360-Pro-wController.jpg');
INSERT INTO Platforms VALUES (NULL, 'PC', 'A gaming computer or gaming rig is a personal computer designed for playing video games that normally require a lot of power.', '1970-01-01', 'https://en.wikipedia.org/wiki/File:Gaming_PC_set_up.jpg');
INSERT INTO Platforms VALUES (NULL, 'Nintendo 64', 'The Nintendo 64, stylized as NINTENDO64 and abbreviated as N64, is Nintendo third home video game console for the international market.', '1996-10-29', 'https://en.wikipedia.org/wiki/File:Nintendo-64-wController-L.jpg');


-- Data for table: Game Release Date
-- Keys start at: 1000000
INSERT INTO Game_Release_Date VALUES (NULL, 100000, 3, '2010-01-26');   -- Mass Effect 2 : Xbox 360
INSERT INTO Game_Release_Date VALUES (NULL, 100001, 4, '2011-04-19');   -- Portal 2 : PC
INSERT INTO Game_Release_Date VALUES (NULL, 100002, 1, '2008-12-02');   -- Grand Theft Auto V : PS4
INSERT INTO Game_Release_Date VALUES (NULL, 100003, 5, '1998-11-21');   -- Zelda: OOT : Nintendo 64
INSERT INTO Game_Release_Date VALUES (NULL, 100004, 2, '2015-05-19');   -- The Witcher 3 : Xbox One


-- Data for table: Genres
-- Keys start at: 1
INSERT INTO Genres VALUES (NULL, 'Action Role-playing', 'The games emphasize real-time combat where the player has direct control over the characters as opposed to turn or menu-based combat');
INSERT INTO Genres VALUES (NULL, 'Action-adventure', 'Action-adventure is a video game genre that combine core elements from both the action game and adventure game genres.');
INSERT INTO Genres VALUES (NULL, 'Puzzle-platform', 'In a platformer the player controlled character must jump and climb between suspended platforms while avoiding obstacles.');
INSERT INTO Genres VALUES (NULL, 'Third-person Shooter', 'A third-person shooter is a game structured around shooting,[1] and in which the player can see the avatar on-screen in a third-person view.');


-- Data for table: Game Genres
-- Keys start at: 1
INSERT INTO Game_Genres VALUES (NULL, 100000, 1); -- Mass Effect 2
INSERT INTO Game_Genres VALUES (NULL, 100000, 4); -- Mass Effect 2
INSERT INTO Game_Genres VALUES (NULL, 100001, 3); -- Portal 2
INSERT INTO Game_Genres VALUES (NULL, 100002, 2); -- Grand Theft Auto V
INSERT INTO Game_Genres VALUES (NULL, 100003, 2); -- Zelda
INSERT INTO Game_Genres VALUES (NULL, 100004, 1); -- The Witcher 3


-- Data for table: DLC
-- Keys start at: 100000
INSERT INTO DLC VALUES (NULL, 100000, 'Kasumi: Stolen Memory', 'Concerns the recovery of data of great importance to Kasumi Goto. Adds two missions, a squad member, a submachine gun, and other items.', '2010-04-06', 'https://en.wikipedia.org/wiki/File:Mass_Effect_2_Kasumi_Stolen_Memory_logo.jpg'); -- Mass Effect 2
INSERT INTO DLC VALUES (NULL, 100000, 'Overlord', 'Concerns the events of an experimental virtual intelligence that has gone rogue. Adds five missions and other items.', '2010-06-15', 'https://en.wikipedia.org/wiki/File:Mass_Effect_2_Overlord_logo.jpg'); -- Mass Effect 2
INSERT INTO DLC VALUES (NULL, 100000, 'Lair of the Shadow Broker', 'Concerns Liara T Soni and her history with an information dealer known as the Shadow Broker. Adds a mission and other items.', '2010-09-01', 'https://en.wikipedia.org/wiki/File:Mass_Effect_2_Lair_of_the_Shadow_Broker_logo.jpg'); -- Mass Effect 2
INSERT INTO DLC VALUES (NULL, 100000, 'Arrival', 'Concerns the events of an imminent invasion of a highly advanced machine race of synthetic-organic starships. Adds a mission and other items.', '2011-05-29', 'https://en.wikipedia.org/wiki/File:Mass_Effect_2_Arrival_logo.jpg'); -- Mass Effect 2
INSERT INTO DLC VALUES (NULL, 100001, 'Peer Review', 'Introduces Challenge modes for both single-player and co-op, a leaderboards system, and a mini-hub area reserved for additional co-op tracks.', '2011-10-04', 'https://alternativemagazine.files.wordpress.com/2011/10/p2_1.jpg?w=500&h=283&zoom=2'); -- Portal 2
INSERT INTO DLC VALUES (NULL, 100001, 'Perpetual Testing Initiative', 'It introduces the concept of multiple alternate universes, simply shortened as "the multiverse."', '2012-05-08', 'http://store.steampowered.com/app/620/'); -- Portal 2
INSERT INTO DLC VALUES (NULL, 100002, 'Criminal Enterprise Starter Pack', 'The Criminal Enterprise Starter Pack is the fastest way for new Grand Theft Auto Online players to jumpstart their criminal empires. Do not purchase if you already own the Criminal Enterprise Starter Pack.', '2017-12-14', 'https://steamcdn-a.akamaihd.net/steam/apps/771300/header.jpg?t=1533746423'); -- Grand Theft Auto V
INSERT INTO DLC VALUES (NULL, 100002, 'Shark Cash Cards', 'Cash is king in this town. Solve your money problem and help get what you want across Los Santos and Blaine County with the occasional purchase of cash packs for Grand Theft Auto Online.', '2015-06-09', 'https://steamcdn-a.akamaihd.net/steam/apps/376850/header.jpg?t=1447375880'); -- Grand Theft Auto V
INSERT INTO DLC VALUES (NULL, 100004, 'Blood and Wine', 'Blood and Wine offers over 30 hours of adventure, where beauty clashes with horror, and love dances with deceit.', '2016-05-30', 'https://en.wikipedia.org/wiki/File:Blood_and_wine_art.jpg'); -- The Witcher 3
INSERT INTO DLC VALUES (NULL, 100004, 'Hearts of Stone', 'Hearts of Stone packs over 10 hours of new adventures, introducing new characters, powerful monsters, unique romance and a brand new storyline shaped by your choices.', '2015-10-12', 'https://en.wikipedia.org/wiki/File:Hearts_of_stone_art.jpg'); -- The Witcher 3


-- Data for table: DLC Release Dates
-- Keys start at: 1000000
INSERT INTO DLC VALUES (NULL, 100007, 1, '2014-11-18'); -- Grand Theft Auto V : PS4 : Shark Cards
INSERT INTO DLC VALUES (NULL, 100007, 4, '2015-06-09'); -- Grand Theft Auto V : PC : Shark Cards
