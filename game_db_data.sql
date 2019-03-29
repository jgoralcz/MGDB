-- GAME DATABASE DATA
-- SER 322 Deliverable 3
-- Authors: Josh Goralczyk (jgoralcz), Jeremy Powell (jcpowel5)

--  Games Used:
-- 1) Mass Effect 2
-- 2) Portal 2
-- 3) Grand Theft Auto V
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
INSERT INTO DLC_Release_Dates VALUES (NULL, 100007, 1, '2014-11-18'); -- Grand Theft Auto V : PS4 : Shark Cards
INSERT INTO DLC_Release_Dates VALUES (NULL, 100007, 4, '2015-06-09'); -- Grand Theft Auto V : PC : Shark Cards


-- Data for table: Cosmetics
-- Keys start at: 10000
INSERT INTO Cosmetics VALUES (NULL, 100000, 100003, 'Alternate Appearance Pack', '3 new outfits, one each for squadmates Garrus Vakarian, Jack, and Thane Krios', 'Jack straps on a black biker vest, low-slung jeans, and steel-toe boots made for starting riots. Garrus suits up in a new military-grade, blue-lit armor equipped with a dual-input communication headset.'); -- Mass Effect 2 : DLC
INSERT INTO Cosmetics VALUES (NULL, 100001, NULL, 'Headwear', 'Items that can be equipped in the "Head" slot of the loadout screen.', ''); -- Portal 2: No DLC
INSERT INTO Cosmetics VALUES (NULL, 100001, NULL, 'Skins', 'Items that can be equipped in the "Skins" slot of the loadout screen, and change the default textures of Atlas and P-body.', ''); -- Portal 2: No DLC
INSERT INTO Cosmetics VALUES (NULL, 100002, NULL, 'Clothes', 'Dress characters however you please, with a default wardrobe located in their closets.', ''); -- Grand Theft Auto V: No DLC
INSERT INTO Cosmetics VALUES (NULL, 100002, 100006, 'Lowriders', 'Dozens of new options to match your new Lowriders.', ''); -- Grand Theft Auto V: DLC
INSERT INTO Cosmetics VALUES (NULL, 100004, NULL, 'Alternative Look for Yennefer', 'Check out this entirely new look for the mighty sorceress Yennefer of Vengerberg!', ''); -- Witcher 3: DLC


-- Data for table: Weapons
-- Keys start at: 10000
INSERT INTO Weapons VALUES (NULL, 100000, NULL, 'M-8 Avenger', 'Default starting assault rifle', 'Type: Assault Rifle, Accuracy: Moderate, Recoil: Moderate, Fire Mode: Automatic, Fire Rate: 850 RPM, Ammo Per Clip: 40'); -- Mass Effect 2
INSERT INTO Weapons VALUES (NULL, 100000, NULL, 'M-92 Mantis', 'A sniper rifle.', 'Type: Sniper Rifle, Accuracy: High, Recoil: High, Fire Mode: Single shot, Fire Rate: Low, Ammo Per Clip: 1'); -- Mass Effect 2
INSERT INTO Weapons VALUES (NULL, 100000, 100001, 'M-490 Mantis', 'A heavy weapon.', 'Type: Heavy Weapon, Accuracy: Unknown, Recoil: Unknown, Fire Mode: Single-Shot, Fire Rate: Low (Charge-Time: 3 s), Ammo Per Clip: N/A'); -- Mass Effect 2
INSERT INTO Weapons VALUES (NULL, 100001, NULL, 'Handheld Portal Device', 'The Aperture Science Handheld Portal Device (also known as the Portal Gun, ASHPoD or ASHPD) is the experimental tool designed to place two portals that objects can pass through.', 'Type: Prototype teleportation weapon, Affiliation: Aperture Science, Manufacturer: Aperture Science, Magazine size: N/A, Accuracy: High, Range: Long'); -- Portal 2
INSERT INTO Weapons VALUES (NULL, 100002, NULL, 'Railgun', 'The Coil Railgun is an experimental weapon featured in the Enhanced Version of Grand Theft Auto V.', 'Weapon class: Heavy Weapons, Weapon type: Rail Gun, Ammunition capacity: 20 rounds'); -- Grand Theft Auto V
INSERT INTO Weapons VALUES (NULL, 100002, 100006, 'Gusenberg Sweeper', 'It is based on the .45 ACP M1928A1 Thompson Submachine Gun (popularly known as the "Tommy Gun"), which is famous for its role in 1920s gangster culture and in the Second World War.', 'Weapon class: Machine Gun, Weapon type: Submachine gun, Ammunition capacity: 30 rounds (50 with extended clip)'); -- Grand Theft Auto V
INSERT INTO Weapons VALUES (NULL, 100003, NULL, 'Ocarina of Time', 'An instrument Link uses to play music.', 'Use(s): Various'); -- The Legend of Zelda: Ocarina of Time
INSERT INTO Weapons VALUES (NULL, 100003, NULL, 'Master Sword', 'The Master Sword is the final key to the sacred realm that holds the Triforce, and only the one worthy of the title of the Hero of Time can draw it.', 'Durability: Continuous'); -- The Legend of Zelda: Ocarina of Time
INSERT INTO Weapons VALUES (NULL, 100004, NULL, 'Griffin Silver Sword', 'Griffin Silver Sword is a Diagram in the Witcher 3: Wild Hunt that can be crafted by a Blacksmith (Weapons) or Armorsmith (Armor).', 'Damage: 180'); -- Witcher 3
INSERT INTO Weapons VALUES (NULL, 100004, 100008, 'Aerondight', 'Aerondight is a legendary sword that has appeard in all Witcher games. Now it has been added to The Witcher 3 as well, and it’s probably the best sword there is.', 'Stats'); -- Witcher 3


-- Data for table: Characters
-- Keys start at: 100000
INSERT INTO Characters VALUES (NULL, 'Mass Effect 2 Characters', 'All character types in Mass Effect 2'); -- Mass Effect 2
INSERT INTO Characters VALUES (NULL, 'Portal 2 Characters', 'All character types in Portal 2'); -- Portal 2
INSERT INTO Characters VALUES (NULL, 'Grand Theft Auto V Characters', 'All character types in Grand Theft Auto V'); -- Grand Theft Auto V
INSERT INTO Characters VALUES (NULL, 'The Legend of Zelda: Ocarina of Time Characters', 'All character types in The Legend of Zelda: Ocarina of Time'); -- The Legend of Zelda: Ocarina of Time
INSERT INTO Characters VALUES (NULL, 'Witcher 3 Characters', 'All character types in Witcher 3'); -- Witcher 3


-- Data for table: Main Characters
-- Keys start at: 100000
INSERT INTO Main_Characters VALUES (NULL, 100000, 100000, 'Commander Shepard', 'Lieutenant Commander Shepard is the human protagonist of Mass Effect, Mass Effect 2, and Mass Effect 3, whose gender, appearance, skills and pre-service history are all customizable and have an impact on the story.'); -- Mass Effect 2
INSERT INTO Main_Characters VALUES (NULL, 100001, 100001, 'Chell', 'Chell is the silent protagonist in the Portal video game series developed by Valve Corporation.'); -- Portal 2
INSERT INTO Main_Characters VALUES (NULL, 100001, 100001, 'GLaDOS', 'GLaDOS (Genetic Lifeform and Disk Operating System) is the central core designed to control, guide, and oversee the Aperture Science computer-aided Enrichment Center.'); -- Portal 2
INSERT INTO Main_Characters VALUES (NULL, 100002, 100002, 'Trevor Philips', 'Trevor Philips is a fictional character in Grand Theft Auto V, a video game in the Grand Theft Auto series made by Rockstar Games.'); -- Grand Theft Auto V
INSERT INTO Main_Characters VALUES (NULL, 100002, 100002, 'Claude', 'Claude is a fictional character and the main protagonist of Grand Theft Auto III, a game in the Grand Theft Auto series by Rockstar Games. '); -- Grand Theft Auto V
INSERT INTO Main_Characters VALUES (NULL, 100002, 100002, 'Carl Johnson', 'Carl Johnson is a fictional character and the main playable protagonist from Rockstar Norths Grand Theft Auto: San Andreas, published by Rockstar Games.'); -- Grand Theft Auto V
INSERT INTO Main_Characters VALUES (NULL, 100003, 100003, 'Ganondorf', 'Ganondorf Dragmire known as the King of Thieves, the Great King of Evil, the Emperor of the Dark Realm[1], or the Dark Lord, is the primary antagonist of the majority of games in the Legend of Zelda series.'); -- The Legend of Zelda: Ocarina of Time
INSERT INTO Main_Characters VALUES (NULL, 100003, 100003, 'Link', 'Link He is the everlasting hero of the setting, having appeared throughout the ages in a never ending line of incarnations.'); -- The Legend of Zelda: Ocarina of Time
INSERT INTO Main_Characters VALUES (NULL, 100003, 100003, 'Princess Zelda', 'Zelda, Princess of Hyrule, best known simply as Princess Zelda is the name for several female Hylians, usually members of the Royal Family of Hyrule, who often play an integral role in the series.'); -- The Legend of Zelda: Ocarina of Time
INSERT INTO Main_Characters VALUES (NULL, 100004, 100004, 'Geralt of Rivia', 'Geralt of Rivia is a fictional character, the protagonist of The Witcher series of short stories and novels by Polish writer Andrzej Sapkowski, as well as its adaptations, which include film, TV series, comic books and video games.'); -- Witcher 3
INSERT INTO Main_Characters VALUES (NULL, 100004, 100004, 'Yennefer', 'Yennefer, born on Belleteyn in 1173, was a sorceress who lived in Vengerberg, the capital city of Aedirn.'); -- Witcher 3
INSERT INTO Main_Characters VALUES (NULL, 100004, 100004, 'Ciri', 'Cirilla Fiona Elen Riannon (better known as Ciri), was born in 1253, and most likely during the Belleteyn holiday.'); -- Witcher 3
INSERT INTO Main_Characters VALUES (NULL, 100004, 100004, 'Triss Merigold', 'Triss Merigold of Maribor was a legendary Temerian sorceress of the 13th century.'); -- Witcher 3


-- Data for table: Side Characters
-- Keys start at: 100000
INSERT INTO Side_Characters VALUES (NULL, 100000, 100000, 'Garrus Vakarian', 'Garrus Vakarian is a turian, formerly part of C-Secs Investigation Division.'); -- Mass Effect 2
INSERT INTO Side_Characters VALUES (NULL, 100000, 100000, 'Grunt', 'Grunt is a genetically engineered krogan super soldier.'); -- Mass Effect 2
INSERT INTO Side_Characters VALUES (NULL, 100000, 100000, 'Miranda Lawson', 'Miranda Lawson is a human Cerberus Officer. As Jacob Taylor informant, she gives him guidance and advice during missions, often via hologram.'); -- Mass Effect 2
INSERT INTO Side_Characters VALUES (NULL, 100001, 100001, 'Wheatley', 'Wheatley is a fictional artificial intelligence from the Portal franchise first introduced in the 2011 video game Portal 2.'); -- Portal 2
INSERT INTO Side_Characters VALUES (NULL, 100002, 100002, 'Amanda De Santa', 'Amanda De Santa (previously Amanda Townley) is the wife of Michael, and the mother of Jimmy and Tracey. She is played by Vicki Van Tassel.'); -- Grand Theft Auto V
INSERT INTO Side_Characters VALUES (NULL, 100002, 100002, 'Lazlow', 'Lazlow is an insecure, ill-mannered, and perverted radio host who has retained work across the Grand Theft Auto rendition of the United States for nearly thirty years, portrayed by Lazlow Jones.'); -- Grand Theft Auto V
INSERT INTO Side_Characters VALUES (NULL, 100002, 100002, 'Floyd Hebert', 'Floyd Hebert is Wade cousin and lives in his girlfriend Debra condo in Vespucci Beach. Jimmy Ray Bennett plays Floyd.'); -- Grand Theft Auto V
INSERT INTO Side_Characters VALUES (NULL, 100003, 100003, 'Impa', 'Impa typically serves as a nursemaid and/or bodyguard to Princess Zelda and often offers guidance to Link.'); -- The Legend of Zelda: Ocarina of Time
INSERT INTO Side_Characters VALUES (NULL, 100003, 100003, 'Sheik', 'Sheik serves as Princess Zelda alter ego in the game; to escape Ganondorf capture, Zelda passes herself off as a male Sheikah known as Sheik.'); -- The Legend of Zelda: Ocarina of Time
INSERT INTO Side_Characters VALUES (NULL, 100003, 100003, 'Impa', 'description'); -- The Legend of Zelda: Ocarina of Time
INSERT INTO Side_Characters VALUES (NULL, 100004, 100004, 'Keira Metz', 'Keira Metz of Carreras was a sorceress and former advisor to King Foltest of Temeria, a role that had also been held by Triss Merigold and Fercart.'); -- Witcher 3
INSERT INTO Side_Characters VALUES (NULL, 100004, 100004, 'Emhyr var Emreis', 'Emhyr var Emreis was Emperor of the Nilfgaardian Empire, Lord of Metinna, Ebbing, Gemmera, and Sovereign of Nazair and Vicovaro from 1257 until his death sometime in the late 13th century. He also became the King of Cintra after marrying Cirilla in 1268.'); -- Witcher 3
INSERT INTO Side_Characters VALUES (NULL, 100004, 100004, 'Letho', 'Letho of Gulet, also known as the Kingslayer, was a witcher from the School of the Viper. His closest associates were Auckes and Serrit, also kingslayers and fellow witchers from the School of the Viper.'); -- Witcher 3


-- Data for table: Workers
-- Keys start at: 10000
INSERT INTO Workers VALUES (NULL, 'Nadine', NULL, 'Briggs', 'Nadine is a considerate personal trainer who is obsessed with the murder of her friend Jasper, nine years ago.');
INSERT INTO Workers VALUES (NULL, 'Flora', NULL, 'Davis', 'Flora is a brave former gallery-commisioned artist who is obsessed with running.');
INSERT INTO Workers VALUES (NULL, 'Gregory', NULL, 'Plumb', 'He grew up in an upper class neighbourhood. He was raised in a happy family home with three loving parents.');
INSERT INTO Workers VALUES (NULL, 'Laura', NULL, 'Wishmonger', 'He grew up in a working class neighbourhood. He was raised by his father, his mother having left when he was young.');
INSERT INTO Workers VALUES (NULL, 'Kevin', NULL, 'Thornton', 'Kevin has a best friend who is a personal trainer named Edgar Mackay. They have a very firey friendship. He also hangs around with a personal trainer called Kaden Banks. They enjoy ferret racing together.');
INSERT INTO Workers VALUES (NULL, 'Aryaan', 'Farrington', 'Markham', 'She is a Dutch Hindu who defines herself as bisexual. She did not finish school. She is allergic to nickel.');
INSERT INTO Workers VALUES (NULL, 'Kevin', 'Kaia', 'Pate', 'Kevin is a British Christian who suffers from a severe phobia of butterflies.');
INSERT INTO Workers VALUES (NULL, 'Roger', 'Hannah', 'Wilson', 'Roger is a former cleaner at a studio with a serious addiction to chocolate.');
INSERT INTO Workers VALUES (NULL, 'Cuthbert', 'Mohammad', 'Sparkle', 'Cuthbert is a 52-year-old trainee tradesperson who enjoys listening to music, glamping and meditation. He is bright and exciting, but can also be very standoffish and a bit unstable.');
INSERT INTO Workers VALUES (NULL, 'Carla', 'kinkle', 'Dinkle', 'Physically, Carla is slightly overweight but otherwise in good shape. She is tall with brown skin, black hair and green eyes. She has a mole on the end of her nose.');
INSERT INTO Workers VALUES (NULL, 'Fred', 'Rob', 'Mohammad', 'Fred is a brave partner at a law firm who enjoys stealing candy from babies.');
INSERT INTO Workers VALUES (NULL, 'Garth', 'Pete', 'Meadows', 'She is an 45-year-old Australian senior Jedi who who enjoys checking news stories against Snopes.');
INSERT INTO Workers VALUES (NULL, 'Phil', 'Steven', 'Zeus', 'He grew up in an upper class neighbourhood. His parents separated when he was small, but remained friends and provided a happy, stable home.');
INSERT INTO Workers VALUES (NULL, 'Naomi', 'Lauren', 'McCallister', 'She is currently single. Her most recent romance was with a kitchen assistant named Taren Redd Hamilton, who was the same age as her. They broke up because Taren wanted somebody more reliable.');
INSERT INTO Workers VALUES (NULL, 'Mathias', 'Forest', 'Parker', 'Mathias Forest Parker is a 61-year-old with an unfortunate habit of bumping off the people around him. His first victim was his late wife, Tia Lorraine Dunn, who he killed because he thought she was flirting with other people. He has since killed two more people.');


-- Data for table: Companies Worker
-- Keys start at: 1000
INSERT INTO Companies_Worker VALUES (NULL, 1000, 10000, '2008-06-17', '2019-03-28');
INSERT INTO Companies_Worker VALUES (NULL, 1001, 10001, '2002-11-23', '2002-11-24');
INSERT INTO Companies_Worker VALUES (NULL, 1002, 10002, '2010-04-20', '2018-04-20');
INSERT INTO Companies_Worker VALUES (NULL, 1003, 10003, '2016-12-25', '2017-01-01');
INSERT INTO Companies_Worker VALUES (NULL, 1004, 10004, '2015-02-05', '2019-02-12');


-- Data for table: Developers
-- Keys start at: 100000
INSERT INTO Developers VALUES (NULL, 10000);
INSERT INTO Developers VALUES (NULL, 10001);
INSERT INTO Developers VALUES (NULL, 10002);


-- Data for table: Directors
-- Keys start at: 100000
INSERT INTO Directors VALUES (NULL, 10003);
INSERT INTO Directors VALUES (NULL, 10004);
INSERT INTO Directors VALUES (NULL, 10005);


-- Data for table: Writers
-- Keys start at: 100000
INSERT INTO Directors VALUES (NULL, 10006);
INSERT INTO Directors VALUES (NULL, 10007);
INSERT INTO Directors VALUES (NULL, 10008);


-- Data for table: Composers
-- Keys start at: 100000
INSERT INTO Directors VALUES (NULL, 10009);
INSERT INTO Directors VALUES (NULL, 10010);
INSERT INTO Directors VALUES (NULL, 10011);


-- Data for table: Producers
-- Keys start at: 100000
INSERT INTO Directors VALUES (NULL, 10012);
INSERT INTO Directors VALUES (NULL, 10013);
INSERT INTO Directors VALUES (NULL, 10014);
