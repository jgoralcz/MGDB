import sys
from datetime import datetime
import random
from insertion.HelperFunctions.Populator import Populator as pop
from insertion.Insert import Insert as ins

# offsets for auto incrementing due to the id number.
engine_offset = 1
companies_offset = 1000
critics_offset = 1000
series_offset = 1000
game_offset = 100000
ratings_offset = 1000000
companies_game_offset = 1000
platforms_offset = 1
game_release_date_offset = 1000000
genres_offset = 1
game_genres_offset = 1
dlc_offset = 100000
dlc_release_date_offset = 1000000
cosmetics_offset = 10000
weapons_offset = 10000
characters_offest = 100000
main_characters_offset = 100000
side_characters_offset = 100000
workers_offset = 10000
companies_worker_offest = 1000
developer_offset = 100000
director_offset = 100000
writer_offset = 100000
composers_offset = 100000
producers_offset = 100000
works_on_offset = 1000000


# get the args to parse. Default of 5 and 2
args = sys.argv[1:]

length = 5
depth = 2

# get the length
if len(args) > 0:
    try:
        length = int(args[0])
    except Exception:
        pass

if len(args) > 1:
    try:
        depth = int(args[1])
    except Exception:
        pass

print(length, depth)

# create date time
now = datetime.now()
now = str(now).replace(' ', '_').replace('/', '-').replace(':', '.')

with open(now+".sql", 'a') as sql_file:

    # run for engine; index starts at 1
    sql_file.write("-- Autogenerated Engines Insertion.\n")
    for i in range(length):
        sql_file.write(ins.insert("`Engines`", "NULL, '%s', '%s', '%s', '%s'" % (pop.random_string(32), pop.random_string(1000), pop.random_date(), pop.random_string(256))))
    sql_file.write("\n")


    # run for Companies; index starts at 1000
    sql_file.write("-- Autogenerated Companies Insertion.\n")
    for i in range(length):
        sql_file.write(ins.insert("Companies", "NULL, '%s', '%s'" % (pop.random_string(128), pop.random_string(1000))))
    sql_file.write("\n")


    # run for Critics; index starts at 1000
    sql_file.write("-- Autogenerated Critics Insertion.\n")
    for i in range(length):
        sql_file.write(ins.insert("Critics", "NULL, '%s'") % (pop.random_string(32)))
    sql_file.write("\n")


    # run for Series; index starts at 1000
    sql_file.write("-- Autogenerated Series Insertion.\n")
    for i in range(length):
        sql_file.write(ins.insert("Series", "NULL, '%s', '%s', '%s', '%s'") % (pop.random_string(128), pop.random_date(), pop.random_string(1000), pop.random_string(256)))
    sql_file.write("\n")


    # run for Games
    sql_file.write("-- Autogenerated Games Insertion.\n")
    for i in range(1, length):
        for j in range(depth):
            sql_file.write(ins.insert("Games", "NULL, %d, %d, '%s', '%s', '%s', '%s'") % (random.randint(engine_offset, i+engine_offset), random.randint(series_offset, i+series_offset), pop.random_string(1000), pop.random_string(64),  pop.random_string(64),  pop.random_string(256)))
        sql_file.write(ins.insert("Games", "NULL, %d, %d, '%s', '%s', '%s', '%s'") % (i, i+series_offset, pop.random_string(1000), pop.random_string(64),  pop.random_string(64),  pop.random_string(256)))
    sql_file.write("\n")


    # run for Ratings
    sql_file.write("-- Autogenerated Ratings Insertion.\n")
    for i in range(1, length):
        for j in range(depth):
            sql_file.write(ins.insert("Ratings", "NULL, %d, %d, '%s', '%s', '%s', '%s'") % (random.randint(game_offset, i+game_offset), random.randint(critics_offset, i+critics_offset), pop.random_string(1000), pop.random_string(64),  pop.random_string(64),  pop.random_string(256)))
        sql_file.write(ins.insert("Ratings", "NULL, %d, %d, '%s', '%s', '%s', '%s'") % (i+game_offset, i+critics_offset, pop.random_string(1000), pop.random_string(64),  pop.random_string(64),  pop.random_string(256)))
    sql_file.write("\n")


    # run for Companies_Game
    sql_file.write("-- Autogenerated Companies_Game Insertion.\n")
    for i in range(1, length):
        for j in range(depth):
            sql_file.write(ins.insert("Companies_Game", "NULL, %d, %d, '%s', '%s'") % (random.randint(companies_offset, i+companies_offset), random.randint(game_offset, i+game_offset), pop.random_date(), pop.random_date()))
        sql_file.write(ins.insert("Companies_Game", "NULL, %d, %d, '%s', '%s'") % (i+companies_offset, i+game_offset, pop.random_date(), pop.random_date()))
    sql_file.write("\n")


    # run for Platforms
    sql_file.write("-- Autogenerated Platforms Insertion.\n")
    for i in range(1, length):
        for j in range(depth):
            sql_file.write(ins.insert("Platforms", "NULL, '%s', '%s', '%s', '%s'") % (pop.random_string(32), pop.random_string(1000), pop.random_date(), pop.random_string(256)))
        sql_file.write(ins.insert("Platforms", "NULL, '%s', '%s', '%s', '%s'") % (pop.random_string(32), pop.random_string(1000), pop.random_date(), pop.random_string(256)))
    sql_file.write("\n")


    # run for Game_Release_Date
    sql_file.write("-- Autogenerated Game_Release_Date Insertion.\n")
    for i in range(1, length):
        for j in range(depth):
            sql_file.write(ins.insert("Game_Release_Date", "NULL, %d, '%s', '%s'") % (random.randint(game_offset, i+game_offset), random.randint(platforms_offset, i+platforms_offset), pop.random_string(1000)))
        sql_file.write(ins.insert("Game_Release_Date", "NULL, %d, '%s', '%s'") % (i+game_offset, i+platforms_offset, pop.random_date()))
    sql_file.write("\n")


    # run for Genres
    sql_file.write("-- Autogenerated Genres Insertion.\n")
    for i in range(1, length):
        for j in range(depth):
            sql_file.write(ins.insert("Genres", "NULL, '%s', '%s'") % (pop.random_string(32), pop.random_string(1000)))
        sql_file.write(ins.insert("Genres", "NULL, '%s', '%s'") % (pop.random_string(32), pop.random_string(1000)))
    sql_file.write("\n")


    # run for Game_Genres
    sql_file.write("-- Autogenerated Game_Genres Insertion.\n")
    for i in range(1, length):
        for j in range(depth):
            sql_file.write(ins.insert("Genres", "NULL, '%s', '%s'") % (pop.random_string(32), pop.random_string(1000)))
        sql_file.write(ins.insert("Genres", "NULL, '%s', '%s'") % (pop.random_string(32), pop.random_string(1000)))
    sql_file.write("\n")


    # run for DLC
    sql_file.write("-- Autogenerated DLC Insertion.\n")
    for i in range(1, length):
        for j in range(depth):
            sql_file.write(ins.insert("DLC", "NULL, %d, '%s', '%s', '%s', '%s'") % (random.randint(game_offset, i+game_offset), pop.random_string(256), pop.random_string(1000), pop.random_date(), pop.random_string(256)))
        sql_file.write(ins.insert("DLC", "NULL, %d, '%s', '%s', '%s', '%s'") % (i+game_offset, pop.random_string(256), pop.random_string(1000), pop.random_date(), pop.random_string(256)))
    sql_file.write("\n")


    # run for DLC_Release_Dates
    sql_file.write("-- Autogenerated DLC_Release_Dates Insertion.\n")
    for i in range(1, length):
        for j in range(depth):
            sql_file.write(ins.insert("DLC_Release_Dates", "NULL, %d, '%s', '%s'") % (random.randint(dlc_offset, i+dlc_offset), random.randint(platforms_offset, i+platforms_offset), pop.random_date()))
        sql_file.write(ins.insert("DLC_Release_Dates", "NULL, %d, '%s', '%s'") % (i+dlc_offset, i+platforms_offset, pop.random_date()))
    sql_file.write("\n")


    # run for Cosmetics
    sql_file.write("-- Autogenerated Cosmetics Insertion.\n")
    for i in range(1, length):
        for j in range(depth):
            sql_file.write(ins.insert("Cosmetics", "NULL, %d, %d, '%s', '%s', '%s'") % (random.randint(game_offset, i+game_offset), random.randint(dlc_offset, i+dlc_offset), pop.random_string(128), pop.random_string(1000), pop.random_string(1000)))
        sql_file.write(ins.insert("Cosmetics", "NULL, %d, %d, '%s', '%s', '%s'") % (i+game_offset, i+dlc_offset, pop.random_string(128), pop.random_string(1000), pop.random_string(1000)))
    sql_file.write("\n")


    # run for Weapons
    sql_file.write("-- Autogenerated Weapons Insertion.\n")
    for i in range(1, length):
        for j in range(depth):
            sql_file.write(ins.insert("Weapons", "NULL, %d, %d, '%s', '%s', '%s'") % (random.randint(game_offset, i+game_offset), random.randint(dlc_offset, i+dlc_offset), pop.random_string(128), pop.random_string(1000), pop.random_string(1000)))
        sql_file.write(ins.insert("Weapons", "NULL, %d, %d, '%s', '%s', '%s'") % (i+game_offset, i+dlc_offset, pop.random_string(128), pop.random_string(1000), pop.random_string(1000)))
    sql_file.write("\n")


    # run for Characters
    sql_file.write("-- Autogenerated Characters Insertion.\n")
    for i in range(1, length):
        sql_file.write(ins.insert("Characters", "NULL, '%s', '%s'") % (pop.random_string(128), pop.random_string(1000)))
    sql_file.write("\n")


    # run for Main_Characters
    sql_file.write("-- Autogenerated Main_Characters Insertion.\n")
    for i in range(1, length):
        for j in range(depth):
            sql_file.write(ins.insert("Main_Characters", "NULL, %d, %d, '%s', '%s'") % (random.randint(characters_offest, i+characters_offest), random.randint(game_offset, i+game_offset), pop.random_string(64), pop.random_string(1000)))
        sql_file.write(ins.insert("Main_Characters", "NULL, %d, %d, '%s', '%s'") % (random.randint(characters_offest, i+characters_offest), random.randint(game_offset, i+game_offset), pop.random_string(64), pop.random_string(1000)))
    sql_file.write("\n")


    # run for Side_Characters
    sql_file.write("-- Autogenerated Side_Characters Insertion.\n")
    for i in range(1, length):
        for j in range(depth):
            sql_file.write(ins.insert("Side_Characters", "NULL, %d, %d, '%s', '%s'") % (random.randint(characters_offest, i+characters_offest), random.randint(game_offset, i+game_offset), pop.random_string(64), pop.random_string(1000)))
        sql_file.write(ins.insert("Side_Characters", "NULL, %d, %d, '%s', '%s'") % (random.randint(characters_offest, i+characters_offest), random.randint(game_offset, i+game_offset), pop.random_string(64), pop.random_string(1000)))
    sql_file.write("\n")


    # run for Workers
    sql_file.write("-- Autogenerated Workers Insertion.\n")
    for i in range(1, length):
        sql_file.write(ins.insert("Workers", "NULL, '%s', '%s', '%s', '%s'") % (pop.random_string(64), pop.random_string(64), pop.random_string(64), pop.random_string(1000)))
    sql_file.write("\n")


    # run for Companies_Worker
    sql_file.write("-- Autogenerated Companies_Worker Insertion.\n")
    for i in range(1, length):
        for j in range(depth):
            sql_file.write(ins.insert("Companies_Worker", "NULL, %d, %d, '%s', '%s'") % (random.randint(companies_offset, i+companies_offset), random.randint(workers_offset, i+workers_offset), pop.random_date(), pop.random_date()))
        sql_file.write(ins.insert("Companies_Worker", "NULL, %d, %d, '%s', '%s'") % (random.randint(companies_offset, i+companies_offset), random.randint(workers_offset, i+workers_offset), pop.random_date(), pop.random_date()))
    sql_file.write("\n")


    # run for Developers
    sql_file.write("-- Autogenerated Developers Insertion.\n")
    for i in range(1, length):
        for j in range(depth):
            sql_file.write(ins.insert("Developers", "NULL, %d") % (random.randint(workers_offset, i+workers_offset)))
        sql_file.write(ins.insert("Developers", "NULL, %d") % (random.randint(workers_offset, i+workers_offset)))
    sql_file.write("\n")


    # run for Directors
    sql_file.write("-- Autogenerated Directors Insertion.\n")
    for i in range(1, length):
        for j in range(depth):
            sql_file.write(ins.insert("Directors", "NULL, %d") % (random.randint(workers_offset, i+workers_offset)))
        sql_file.write(ins.insert("Directors", "NULL, %d") % (random.randint(workers_offset, i+workers_offset)))
    sql_file.write("\n")


    # run for Writers
    sql_file.write("-- Autogenerated Writers Insertion.\n")
    for i in range(1, length):
        for j in range(depth):
            sql_file.write(ins.insert("Writers", "NULL, %d") % (random.randint(workers_offset, i+workers_offset)))
        sql_file.write(ins.insert("Writers", "NULL, %d") % (random.randint(workers_offset, i+workers_offset)))
    sql_file.write("\n")


    # run for Composers
    sql_file.write("-- Autogenerated Composers Insertion.\n")
    for i in range(1, length):
        for j in range(depth):
            sql_file.write(ins.insert("Composers", "NULL, %d") % (random.randint(workers_offset, i+workers_offset)))
        sql_file.write(ins.insert("Composers", "NULL, %d") % (random.randint(workers_offset, i+workers_offset)))
    sql_file.write("\n")


    # run for Producers
    sql_file.write("-- Autogenerated Producers Insertion.\n")
    for i in range(1, length):
        for j in range(depth):
            sql_file.write(ins.insert("Producers", "NULL, %d") % (random.randint(workers_offset, i+workers_offset)))
        sql_file.write(ins.insert("Producers", "NULL, %d") % (random.randint(workers_offset, i+workers_offset)))
    sql_file.write("\n")


    # run for Works_On
    sql_file.write("-- Autogenerated Works_On Insertion.\n")
    for i in range(1, length):
        for j in range(depth):
            sql_file.write(ins.insert("Works_On", "NULL, %d, %d") % (random.randint(workers_offset, i+workers_offset), random.randint(game_offset, i+game_offset)))
        sql_file.write(ins.insert("Works_On", "NULL, %d, %d") % (random.randint(workers_offset, i+workers_offset), random.randint(game_offset, i+game_offset)))
    sql_file.write("\n")