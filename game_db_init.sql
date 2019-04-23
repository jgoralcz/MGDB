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

#INDEXES
CREATE INDEX idx_egine_name ON Engines(name);

-- workers can work for various companies
-- games can have various companies as well
CREATE TABLE IF NOT EXISTS Companies (
  id INTEGER AUTO_INCREMENT,
  name VARCHAR(128) NOT NULL,
  description TEXT,

  CONSTRAINT pk_company_id PRIMARY KEY(id)

) AUTO_INCREMENT = 1000;

#INDEXES
#unsure of the law implications of companies having the same name across countries, so leaving this as not unique
CREATE INDEX idx_company_name ON Companies(name);


-- game critics
CREATE TABLE IF NOT EXISTS Critics (
  id            INTEGER AUTO_INCREMENT,
  name          VARCHAR(32),

  CONSTRAINT pk_critic_id PRIMARY KEY(id)

) AUTO_INCREMENT=1000;

# INDEXES
CREATE INDEX idx_critic_name ON Critics(name);


-- a game can be part of a series.
CREATE TABLE IF NOT EXISTS Series (
  id           INTEGER AUTO_INCREMENT,
  name         VARCHAR(128) NOT NULL UNIQUE,
  release_date DATE,
  description  TEXT,
  image        VARCHAR(256),

  CONSTRAINT pk_series PRIMARY KEY(id)

) AUTO_INCREMENT=1000;

# INDEXES
# unique already creates an index
# CREATE INDEX idx_series_name ON Series(name);

-- video games, starts at 1000000 (1 million)
CREATE TABLE IF NOT EXISTS Games (
  id            INTEGER AUTO_INCREMENT,
  engine_id     INTEGER NOT NULL,
  series_id     INTEGER,
  description   TEXT,
  english_name  VARCHAR(64) NOT NULL,
  other_name    VARCHAR(64),
  image         VARCHAR(256),

  CONSTRAINT pk_game_id PRIMARY KEY (id),
  CONSTRAINT fk_games_engine_id FOREIGN KEY (engine_id) REFERENCES Engines(id) ON UPDATE CASCADE,
  CONSTRAINT fk_games_series_id FOREIGN KEY (series_id) REFERENCES Series(id) ON UPDATE CASCADE

) AUTO_INCREMENT=100000;

# INDEXES
CREATE INDEX idx_english_name ON Games(english_name);
CREATE INDEX idx_other_name ON Games(other_name);

-- ratings for a game, starts at 10000000 (10 million)
CREATE TABLE IF NOT EXISTS Ratings (
  id             INTEGER AUTO_INCREMENT,
  game_id        INTEGER NOT NULL,
  critic_id      INTEGER NOT NULL,
  score          INT NOT NULL,
  date           DATE,
  description    TEXT,

  CONSTRAINT pk_critic_id PRIMARY KEY(id),
  CONSTRAINT fk_ratings_game_id FOREIGN KEY (game_id) REFERENCES Games(id) ON UPDATE CASCADE,
  CONSTRAINT fk_ratings_critic_id FOREIGN KEY (critic_id) REFERENCES Critics(id) ON UPDATE CASCADE

) AUTO_INCREMENT=1000000;

#INDEXES
CREATE INDEX idx_score_id ON Ratings(score);

-- a game can be part of a series.
CREATE TABLE IF NOT EXISTS Companies_Game (
  id          INTEGER AUTO_INCREMENT,
  company_id  INTEGER NOT NULL,
  game_id     INTEGER,
  date_start  DATE,
  date_end    DATE,

  CONSTRAINT pk_game_company_id PRIMARY KEY (id),
  CONSTRAINT fk_game_company_id FOREIGN KEY (company_id) REFERENCES Companies(id) ON UPDATE CASCADE,
  CONSTRAINT fk_company_game_id FOREIGN KEY (game_id) REFERENCES Games(id) ON UPDATE CASCADE

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

# not really used that often, may only be like 100 platforms.
CREATE INDEX idx_platform_name ON Platforms(name);

-- the same game can have different release dates due to various platforms (consoles)
-- video games, starts at 1000000 (1 million)
CREATE TABLE IF NOT EXISTS Game_Release_Date (
  id          INTEGER AUTO_INCREMENT,
  game_id     INTEGER NOT NULL,
  platform_id INTEGER NOT NULL,
  date        DATE NOT NULL,

  CONSTRAINT pk_game_release_id PRIMARY KEY (id),
  CONSTRAINT fk_game_releaseid FOREIGN KEY (game_id) REFERENCES Games(id) ON UPDATE CASCADE,
  CONSTRAINT fk_game_platform_id FOREIGN KEY (platform_id) REFERENCES Platforms(id) ON UPDATE CASCADE

) AUTO_INCREMENT = 1000000;

-- genres, starts at 1
CREATE TABLE IF NOT EXISTS Genres (
  id           INTEGER AUTO_INCREMENT,
  category     VARCHAR(32) NOT NULL,
  description  TEXT NOT NULL,

  CONSTRAINT pk_genre_id PRIMARY KEY (id)
) AUTO_INCREMENT = 1;

# may only have 500 of these (or at least I can see), not sure if entirely useful
CREATE INDEX idx_genre_category ON Genres(category);

-- many games have various genres game genres, starts at 1
CREATE TABLE IF NOT EXISTS Game_Genres (
  id       INTEGER AUTO_INCREMENT,
  game_id  INTEGER NOT NULL,
  genre_id INTEGER NOT NULL,

  CONSTRAINT pk_game_genre PRIMARY KEY (id),
  CONSTRAINT fk_genre_game_id FOREIGN KEY (game_id) REFERENCES Games(id) ON UPDATE CASCADE,
  CONSTRAINT fk_game_genre_id FOREIGN KEY (genre_id) REFERENCES Genres(id) ON UPDATE CASCADE

) AUTO_INCREMENT = 1;


-- games can have many dlc
CREATE TABLE IF NOT EXISTS DLC (
  id              INTEGER AUTO_INCREMENT,
  game_id         INTEGER NOT NULL,
  name            VARCHAR(256),
  description     TEXT,
  date            DATE,
  image           VARCHAR(256),

  CONSTRAINT pk_dlc_id PRIMARY KEY (id),
  CONSTRAINT fk_game_id FOREIGN KEY (game_id) REFERENCES Games(id) ON UPDATE CASCADE

) AUTO_INCREMENT = 100000;

CREATE INDEX idx_dlc_name ON DLC(name);

-- the same dlc can have different release dates due to various platforms (consoles)
-- dlc release date, starts at 1000000 (1 million)
CREATE TABLE IF NOT EXISTS DLC_Release_Dates (
  id          INTEGER AUTO_INCREMENT,
  dlc_id      INTEGER NOT NULL,
  platform_id INTEGER NOT NULL,
  date        DATE NOT NULL,

  CONSTRAINT pk_dlc_release_id PRIMARY KEY (id),
  CONSTRAINT fk_release_dlc_id FOREIGN KEY (dlc_id) REFERENCES DLC(id) ON UPDATE CASCADE,
  CONSTRAINT fk_release_platform_id FOREIGN KEY (platform_id) REFERENCES Platforms(id) ON UPDATE CASCADE

) AUTO_INCREMENT = 1000000;

-- games have many cosmetics and can be part of the DLC or not
CREATE TABLE IF NOT EXISTS Cosmetics (
  id                INTEGER AUTO_INCREMENT,
  game_id           INTEGER NOT NULL,
  dlc_id            INTEGER,
  name              VARCHAR(128),
  description       TEXT NOT NULL,
  stats             TEXT,

  CONSTRAINT pk_cosmetic_id PRIMARY KEY(id),
  CONSTRAINT fk_cosmetic_game_id FOREIGN KEY (game_id) REFERENCES Games(id) ON UPDATE CASCADE,
  CONSTRAINT fk_cosmetic_dlc_id FOREIGN KEY (dlc_id) REFERENCES DLC(id) ON UPDATE CASCADE

) AUTO_INCREMENT = 10000;

CREATE INDEX idx_cosmetics_name ON Cosmetics(name);


-- games can have many weapons that can or cannot be part of a DLC
CREATE TABLE IF NOT EXISTS Weapons (
  id                INTEGER AUTO_INCREMENT,
  game_id           INTEGER NOT NULL,
  dlc_id            INTEGER,
  name              VARCHAR(128),
  description       TEXT NOT NULL,
  stats             TEXT,

  CONSTRAINT pk_weapons_id PRIMARY KEY(id),
  CONSTRAINT fk_weapons_game_id FOREIGN KEY (game_id) REFERENCES Games(id) ON UPDATE CASCADE,
  CONSTRAINT fk_weapons_dlc_id FOREIGN KEY (dlc_id) REFERENCES DLC(id) ON UPDATE CASCADE

) AUTO_INCREMENT = 10000;

CREATE INDEX idx_weapons_name ON Weapons(name);

-- games can have many characters, but this table mainly serves to solve the impedance mismatch we have with inheritance.
-- Developers.worker_id is a FK to Workers.idw
CREATE TABLE IF NOT EXISTS Characters (
  id                INTEGER AUTO_INCREMENT,
  name              VARCHAR(128),
  description       TEXT NOT NULL,

  CONSTRAINT pk_characters_id PRIMARY KEY(id)
) AUTO_INCREMENT = 100000;

CREATE INDEX idx_characters_name ON Characters(name);

-- games can have many main characters, which is a character from another game.
-- Think how Mario can be in 100 different games. His name can be a different name because of the series.
-- Maybe he is Shadow Mario based off of Mario.
CREATE TABLE IF NOT EXISTS Main_Characters (
  id           INTEGER AUTO_INCREMENT,
  character_id INTEGER NOT NULL,
  game_id      INTEGER NOT NULL,
  name         VARCHAR(64),
  description  TEXT,

  CONSTRAINT pk_mc_id PRIMARY KEY (id),
  CONSTRAINT fk_mc_id FOREIGN KEY (character_id) REFERENCES Characters(id) ON UPDATE CASCADE,
  CONSTRAINT fk_mc_game_id FOREIGN KEY (game_id) REFERENCES Games(id) ON UPDATE CASCADE
) AUTO_INCREMENT = 100000;

CREATE INDEX idx_main_character_name ON Main_Characters(name);

-- games can have many side characters, which is a character from another game.
-- Think how Mario can be in 100 different games. His name can be a different name because of the series.
-- Maybe he is Shadow Mario based off of Mario.
CREATE TABLE IF NOT EXISTS Side_Characters (
  id           INTEGER AUTO_INCREMENT,
  character_id INTEGER NOT NULL,
  game_id      INTEGER NOT NULL,
  name         VARCHAR(64),
  description  TEXT,

  CONSTRAINT pk_sc_id PRIMARY KEY(id),
  CONSTRAINT fk_sc_id FOREIGN KEY (character_id) REFERENCES Characters(id) ON UPDATE CASCADE,
  CONSTRAINT fk_sc_game_id FOREIGN KEY (game_id) REFERENCES Games(id) ON UPDATE CASCADE
) AUTO_INCREMENT = 100000;

CREATE INDEX idx_side_character_name ON Side_Characters(name);

-- worker that solves an impedance mismatch problem at the cost of another join.
CREATE TABLE IF NOT EXISTS Workers (
  id          INTEGER AUTO_INCREMENT,
  first_name  VARCHAR(64) NOT NULL,
  middle_name VARCHAR(64),
  last_name   VARCHAR(64) NOT NULL,
  bio         TEXT,
  image_url   VARCHAR(256) NOT NULL,

  CONSTRAINT pk_worker_id PRIMARY KEY (id)
) AUTO_INCREMENT = 10000;

CREATE INDEX idx_workers_first_name ON Workers(first_name);
CREATE INDEX idx_workers_middle_name ON Workers(middle_name);
CREATE INDEX idx_workers_last_name ON Workers(last_name);


-- a worker can work for various companies throughout his or her lifetime.
CREATE TABLE IF NOT EXISTS Companies_Worker (
  id            INTEGER AUTO_INCREMENT,
  company_id    INTEGER NOT NULL,
  worker_id     INTEGER NOT NULL,
  date_start    DATE,
  date_end      DATE,
  is_developer  BOOLEAN,
  is_director   BOOLEAN,
  is_writer     BOOLEAN,
  is_composer   BOOLEAN,
  is_producer   BOOLEAN,

  CONSTRAINT pk_company_worker_id PRIMARY KEY (id),
  CONSTRAINT fk_company_worker_id FOREIGN KEY (company_id) REFERENCES Companies(id) ON UPDATE CASCADE,
  CONSTRAINT fk_worker_company_id FOREIGN KEY (worker_id) REFERENCES Workers(id) ON UPDATE CASCADE

) AUTO_INCREMENT = 1000;


-- many workers can work on various games throughout their life
CREATE TABLE IF NOT EXISTS Works_On (
  id        INTEGER AUTO_INCREMENT,
  worker_id INTEGER NOT NULL,
  game_id   INTEGER NOT NULL,

  CONSTRAINT pk_works_on_id PRIMARY KEY(id),
  CONSTRAINT fk_worker_game_id FOREIGN KEY (worker_id) REFERENCES Workers(id) ON UPDATE CASCADE,
  CONSTRAINT fk_game_worker_id FOREIGN KEY (game_id) REFERENCES Games(id) ON UPDATE CASCADE

) AUTO_INCREMENT = 1000000;
