-- GAME DATABASE INITIALIZATION
-- SER 322 Deliverable 3
-- Authors: Josh Goralczyk (jgoralcz), Jeremy Powell (jcpowel5)

-- create the database
CREATE DATABASE IF NOT EXISTS `mygame_db`;
USE `mygame_db`;


-- TABLES

-- game engine
CREATE TABLE IF NOT EXISTS Engines (
  id            INTEGER AUTO_INCREMENT,
  name          VARCHAR(32) NOT NULL UNIQUE,
  description   TEXT,
  date          DATE,
  image         VARCHAR(256),

  CONSTRAINT pk_engine_id PRIMARY KEY (id)

) AUTO_INCREMENT = 1;

-- workers can work for various companies
-- games can have various companies as well
CREATE TABLE IF NOT EXISTS Companies (
  id INTEGER AUTO_INCREMENT,
  name VARCHAR(128) NOT NULL,
  description TEXT,

  CONSTRAINT pk_company_id PRIMARY KEY(id)

) AUTO_INCREMENT = 1000;

-- game critics
CREATE TABLE Critics (
  id            INTEGER AUTO_INCREMENT,
  name          VARCHAR(32),

  CONSTRAINT pk_critic_id PRIMARY KEY(id)

) AUTO_INCREMENT=1000;


-- a game can be part of a series.
CREATE TABLE IF NOT EXISTS Series (
  id           INTEGER AUTO_INCREMENT,
  name         VARCHAR(128),
  release_date DATE,

  CONSTRAINT pk_series PRIMARY KEY(id)

) AUTO_INCREMENT=1000;

-- video games, starts at 1000000 (1 million)
CREATE TABLE IF NOT EXISTS Games (
  id            INTEGER AUTO_INCREMENT,
  engine_id     INTEGER NOT NULL,
  series_id     INTEGER,
  description   TEXT,
  english_name  VARCHAR(32) NOT NULL UNIQUE,
  other_name    VARCHAR(32),
  image         VARCHAR(256),

  CONSTRAINT pk_game_id PRIMARY KEY (id),
  CONSTRAINT fk_games_engine_id FOREIGN KEY (engine_id) REFERENCES Engines(id),
  CONSTRAINT fk_games_series_id FOREIGN KEY (series_id) REFERENCES Series(id)

) AUTO_INCREMENT=100000;

-- ratings for a game, starts at 10000000 (10 million)
CREATE TABLE IF NOT EXISTS Ratings (
  id             INTEGER AUTO_INCREMENT,
  game_id        INTEGER NOT NULL,
  critic_id      INTEGER NOT NULL,
  score          INT NOT NULL,
  date           DATE,
  description    VARCHAR(255),

  CONSTRAINT pk_critic_id PRIMARY KEY(id),
  CONSTRAINT fk_ratings_game_id FOREIGN KEY (game_id) REFERENCES Games(id),
  CONSTRAINT fk_ratings_critic_id FOREIGN KEY (critic_id) REFERENCES Critics(id)

) AUTO_INCREMENT=1000000;

-- a game can be part of a series.
CREATE TABLE IF NOT EXISTS Companies_Game (
  id          INTEGER AUTO_INCREMENT,
  company_id  INTEGER NOT NULL,
  game_id     INTEGER,
  date_start  DATE,
  date_end    DATE,

  CONSTRAINT pk_game_company_id PRIMARY KEY (id),
  CONSTRAINT fk_game_company_id FOREIGN KEY (company_id) REFERENCES Companies(id),
  CONSTRAINT fk_company_game_id FOREIGN KEY (game_id) REFERENCES Games(id)

) AUTO_INCREMENT=1000;

-- platform id, starts at 1
CREATE TABLE IF NOT EXISTS Platforms (
  id          INTEGER AUTO_INCREMENT,
  name        VARCHAR(32),
  description TEXT,
  date        DATE,
  image       VARCHAR(256),

  CONSTRAINT pk_platform_id PRIMARY KEY (id)

) AUTO_INCREMENT = 1;

-- the same game can have different release dates due to various platforms (consoles)
-- video games, starts at 1000000 (1 million)
CREATE TABLE IF NOT EXISTS Game_Release_Date (
  id          INTEGER AUTO_INCREMENT,
  game_id     INTEGER NOT NULL,
  platform_id INTEGER NOT NULL,
  date        DATE NOT NULL,

  CONSTRAINT pk_game_release_id PRIMARY KEY (id),
  CONSTRAINT fk_game_releaseid FOREIGN KEY (game_id) REFERENCES Games(id),
  CONSTRAINT fk_game_platform_id FOREIGN KEY (platform_id) REFERENCES Platforms(id)

) AUTO_INCREMENT = 1000000;

-- genres, starts at 1
CREATE TABLE Genres (
 id           INTEGER AUTO_INCREMENT,
 description  INTEGER NOT NULL,
 category     INTEGER NOT NULL,

  CONSTRAINT pk_genre_id PRIMARY KEY (id)
) AUTO_INCREMENT = 1;

-- many games have various genres game genres, starts at 1
CREATE TABLE Game_Genres (
  id       INTEGER AUTO_INCREMENT,
  game_id  INTEGER NOT NULL,
  genre_id INTEGER NOT NULL,

  CONSTRAINT pk_game_genre PRIMARY KEY (id),
  CONSTRAINT fk_genre_game_id FOREIGN KEY (game_id) REFERENCES Games(id),
  CONSTRAINT fk_game_genre_id FOREIGN KEY (genre_id) REFERENCES Genres(id)

) AUTO_INCREMENT = 1;


-- games can have many dlc
CREATE TABLE IF NOT EXISTS DLC (
  id              INTEGER AUTO_INCREMENT,
  game_id         INTEGER NOT NULL,
  description     TEXT,
  name            VARCHAR(256),
  date            DATE,
  image           VARCHAR(256),

  CONSTRAINT pk_dlc_id PRIMARY KEY (id),
  CONSTRAINT fk_game_id FOREIGN KEY (game_id) REFERENCES Games(id)

) AUTO_INCREMENT = 100000;

-- the same dlc can have different release dates due to various platforms (consoles)
-- video games, starts at 1000000 (1 million)
CREATE TABLE IF NOT EXISTS DLC_Release_Dates (
  id          INTEGER AUTO_INCREMENT,
  dlc_id      INTEGER NOT NULL,
  platform_id INTEGER NOT NULL,
  date        DATE NOT NULL,

  CONSTRAINT pk_dlc_release_id PRIMARY KEY (id),
  CONSTRAINT fk_release_dlc_id FOREIGN KEY (dlc_id) REFERENCES DLC(id),
  CONSTRAINT fk_release_platform_id FOREIGN KEY (platform_id) REFERENCES Platforms(id)

) AUTO_INCREMENT = 1000000;

-- games have many cosmetics and can be part of the DLC or not
CREATE TABLE IF NOT EXISTS Cosmetics (
	id                INTEGER AUTO_INCREMENT,
	game_id           INTEGER NOT NULL,
	dlc_id            INTEGER,
	description       TEXT NOT NULL,
	name              VARCHAR(128),
	stats             TEXT,

	CONSTRAINT pk_cosmetic_id PRIMARY KEY(id),
	CONSTRAINT fk_cosmetic_game_id FOREIGN KEY (game_id) REFERENCES Games(id),
	CONSTRAINT fk_cosmetic_dlc_id FOREIGN KEY (dlc_id) REFERENCES DLC(id)

) AUTO_INCREMENT = 10000;

-- games can have many weapons that can or cannot be part of a DLC
CREATE TABLE IF NOT EXISTS Weapons (
  id                INTEGER AUTO_INCREMENT,
  game_id           INTEGER NOT NULL,
  dlc_id            INTEGER,
  description       TEXT NOT NULL,
  name              VARCHAR(128),
  stats             TEXT,

  CONSTRAINT pk_weapons_id PRIMARY KEY(id),
  CONSTRAINT fk_weapons_game_id FOREIGN KEY (game_id) REFERENCES Games(id),
  CONSTRAINT fk_weapons_dlc_id FOREIGN KEY (dlc_id) REFERENCES DLC(id)

) AUTO_INCREMENT = 10000;

-- games can have many characters, but this table mainly serves to solve the impedance mismatch we have with inheritance.
CREATE TABLE IF NOT EXISTS Characters (
  id                INTEGER AUTO_INCREMENT,
  description       TEXT NOT NULL,
  name              VARCHAR(128),

  CONSTRAINT pk_characters_id PRIMARY KEY(id)
) AUTO_INCREMENT = 100000;

-- games can have many main characters, which is a character from another game.
-- Think how Mario can be in 100 different games. His name can be a different name because of the series.
-- Maybe he is Shadow Mario based off of Mario.
CREATE TABLE IF NOT EXISTS Main_Characters (
  id           INTEGER AUTO_INCREMENT,
  character_id INTEGER NOT NULL,
  game_id      INTEGER NOT NULL,
  description  TEXT,
  name         VARCHAR(64),

  CONSTRAINT pk_mc_id PRIMARY KEY(id),
  CONSTRAINT fk_mc_id FOREIGN KEY (character_id) REFERENCES Characters(id),
  CONSTRAINT fk_mc_game_id FOREIGN KEY (game_id) REFERENCES Games(id)
) AUTO_INCREMENT = 100000;

-- games can have many side characters, which is a character from another game.
-- Think how Mario can be in 100 different games. His name can be a different name because of the series.
-- Maybe he is Shadow Mario based off of Mario.
CREATE TABLE IF NOT EXISTS Side_Characters (
  id           INTEGER AUTO_INCREMENT,
  character_id INTEGER NOT NULL,
  game_id      INTEGER NOT NULL,
  description  TEXT,
  name         VARCHAR(64),

  CONSTRAINT pk_sc_id PRIMARY KEY(id),
  CONSTRAINT fk_sc_id FOREIGN KEY (character_id) REFERENCES Characters(id),
  CONSTRAINT fk_sc_game_id FOREIGN KEY (game_id) REFERENCES Games(id)
) AUTO_INCREMENT = 100000;

-- worker that solves an impedance mismatch problem at the cost of another join.
CREATE TABLE IF NOT EXISTS Workers (
  id          INTEGER AUTO_INCREMENT,
  first_name  VARCHAR(64) NOT NULL,
  middle_name VARCHAR(64),
  last_name   VARCHAR(64) NOT NULL,
  bio         TEXT,

  CONSTRAINT pk_worker_id PRIMARY KEY (id)
) AUTO_INCREMENT = 10000;


-- a worker can work for various companies throughout his lifetime.
CREATE TABLE IF NOT EXISTS Companies_Worker (
  id          INTEGER AUTO_INCREMENT,
  company_id  INTEGER NOT NULL,
  worker_id   INTEGER,
  date_start  DATE,
  date_end    DATE,

  CONSTRAINT pk_company_worker_id PRIMARY KEY (id),
  CONSTRAINT fk_company_worker_id FOREIGN KEY (company_id) REFERENCES Companies(id),
  CONSTRAINT fk_worker_company_id FOREIGN KEY (worker_id) REFERENCES Games(id)

) AUTO_INCREMENT=1000;


-- separate tables in case we want to add more information later on, and separation of concerns to join on only stuff we want.
CREATE TABLE IF NOT EXISTS Developers (
  id           INTEGER AUTO_INCREMENT,
  worker_id    INTEGER NOT NULL,

  CONSTRAINT pk_developer_id PRIMARY KEY(id),
  CONSTRAINT fk_developer_worker_id FOREIGN KEY (worker_id) REFERENCES Workers(id)

) AUTO_INCREMENT = 100000;

CREATE TABLE IF NOT EXISTS Directors (
  id           INTEGER AUTO_INCREMENT,
  worker_id    INTEGER NOT NULL,

  CONSTRAINT pk_director_id PRIMARY KEY(id),
  CONSTRAINT fk_director_worker_id FOREIGN KEY (worker_id) REFERENCES Workers(id)

) AUTO_INCREMENT = 100000;


CREATE TABLE IF NOT EXISTS Writers (
  id           INTEGER AUTO_INCREMENT,
  worker_id    INTEGER NOT NULL,

  CONSTRAINT pk_writer_id PRIMARY KEY(id),
  CONSTRAINT fk_writer_worker_id FOREIGN KEY (worker_id) REFERENCES Workers(id)

) AUTO_INCREMENT = 100000;


CREATE TABLE IF NOT EXISTS Composers (
  id           INTEGER AUTO_INCREMENT,
  worker_id    INTEGER NOT NULL,

  CONSTRAINT pk_composer_id PRIMARY KEY(id),
  CONSTRAINT fk_composer_worker_id FOREIGN KEY (worker_id) REFERENCES Workers(id)

) AUTO_INCREMENT = 100000;


CREATE TABLE IF NOT EXISTS Producers (
  id           INTEGER AUTO_INCREMENT,
  worker_id    INTEGER NOT NULL,

  CONSTRAINT pk_producer_id PRIMARY KEY(id),
  CONSTRAINT fk_producer_worker_id FOREIGN KEY (worker_id) REFERENCES Workers(id)

) AUTO_INCREMENT = 100000;

-- many workers can work on various games throughout their life
CREATE TABLE IF NOT EXISTS Works_On (
  id        INTEGER AUTO_INCREMENT,
  worker_id INTEGER NOT NULL,
  game_id   INTEGER NOT NULL,

  CONSTRAINT pk_works_on_id PRIMARY KEY(id),
  CONSTRAINT fk_worker_game_id FOREIGN KEY (worker_id) REFERENCES Workers(id),
  CONSTRAINT fk_game_worker_id FOREIGN KEY (game_id) REFERENCES Games(id)

) AUTO_INCREMENT = 1000000;
