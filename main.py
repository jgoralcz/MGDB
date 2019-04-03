import sys
import random
from insertion.HelperFunctions.Populator import Populator as pop
from insertion.Insert import Insert as ins

# args = sys.argv[1:]
args = 5
depth = 2

# offsets for autoincrementing
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



# run for engine; index starts at 1
# for i in range(args):
#     print(ins.insert("Engines", "NULL, %s, %s, %s, %s" % (pop.random_string(32), pop.random_string(1000), pop.random_date(), pop.random_string(256))))
#
# # run for Companies; index starts at 1000
# for i in range(args):
#     print(ins.insert("Companies", "NULL, %s, %s" % (pop.random_string(128), pop.random_string(1000))))
#
# # run for Critics; index starts at 1000
# for i in range(args):
#     print(ins.insert("Critics", "NULL, %s") % (pop.random_string(32)))
#
# # run for Series; index starts at 1000
# for i in range(args):
#     print(ins.insert("Series", "NULL, %s, %s, %s, %s") % (pop.random_string(128), pop.random_date(), pop.random_string(1000), pop.random_string(256)))

# run for Games
for i in range(1, args):
    for j in range(depth):
        print(ins.insert("Games", "NULL, %d, %d, %s, %s, %s, %s") % (random.randint(engine_offset, i+engine_offset), random.randint(series_offset, i+series_offset), pop.random_string(1000), pop.random_string(64),  pop.random_string(64),  pop.random_string(256)))
    print(ins.insert("Games", "NULL, %d, %d, %s, %s, %s, %s") % (i, i+series_offset, pop.random_string(1000), pop.random_string(64),  pop.random_string(64),  pop.random_string(256)))

# run for Ratings
for i in range(1, args):
    for j in range(depth):
        print(ins.insert("Ratings", "NULL, %d, %d, %s, %s, %s, %s") % (random.randint(game_offset, i+game_offset), random.randint(critics_offset, i+critics_offset), pop.random_string(1000), pop.random_string(64),  pop.random_string(64),  pop.random_string(256)))
    print(ins.insert("Ratings", "NULL, %d, %d, %s, %s, %s, %s") % (i+game_offset, i+critics_offset, pop.random_string(1000), pop.random_string(64),  pop.random_string(64),  pop.random_string(256)))

# run for Companies_Game
for i in range(1, args):
    for j in range(depth):
        print(ins.insert("Companies_Game", "NULL, %d, %d, %s, %s") % (random.randint(companies_offset, i+companies_offset), random.randint(game_offset, i+game_offset), pop.random_date(), pop.random_date()))
    print(ins.insert("Companies_Game", "NULL, %d, %d, %s, %s") % (i+companies_offset, i+game_offset, pop.random_date(), pop.random_date()))

# run for Platforms
for i in range(1, args):
    for j in range(depth):
        print(ins.insert("Platforms", "NULL, %s, %s, %s, %s") % (pop.random_string(32), pop.random_string(1000), pop.random_date(), pop.random_string(256)))
    print(ins.insert("Platforms", "NULL, %s, %s, %s, %s") % (pop.random_string(32), pop.random_string(1000), pop.random_date(), pop.random_string(256)))

# run for Game_Release_Date
for i in range(1, args):
    for j in range(depth):
        print(ins.insert("Game_Release_Date", "NULL, %d, %d, %s, %s") % (random.randint(game_offset, i+game_offset), random.randint(platforms_offset, i+platforms_offset), pop.random_string(1000), pop.random_date()))
    print(ins.insert("Game_Release_Date", "NULL, %d, %d, %s, %s") % (i+game_offset, i+platforms_offset, pop.random_date(), pop.random_string(256)))

# run for Genres
for i in range(1, args):
    for j in range(depth):
        print(ins.insert("Genres", "NULL, %s, %s") % (pop.random_string(32), pop.random_string(1000)))
    print(ins.insert("Genres", "NULL, %s, %s") % (pop.random_string(32), pop.random_string(1000)))

# run for Game_Genres
for i in range(1, args):
    for j in range(depth):
        print(ins.insert("Genres", "NULL, %s, %s") % (pop.random_string(32), pop.random_string(1000)))
    print(ins.insert("Genres", "NULL, %s, %s") % (pop.random_string(32), pop.random_string(1000)))

# run for DLC
for i in range(1, args):
    for j in range(depth):
        print(ins.insert("DLC", "NULL, %d, %s, %s, %s, %s") % (random.randint(game_offset, i+game_offset), pop.random_string(256), pop.random_string(1000), pop.random_date(), pop.random_string(256)))
    print(ins.insert("DLC", "NULL, %d, %s, %s, %s, %s") % (i+game_offset, pop.random_string(256), pop.random_string(1000), pop.random_date(), pop.random_string(256)))

# run for DLC_Release_Dates
for i in range(1, args):
    for j in range(depth):
        print(ins.insert("DLC_Release_Dates", "NULL, %d, %s, %s") % (random.randint(dlc_offset, i+dlc_offset), random.randint(platforms_offset, i+platforms_offset), pop.random_date()))
    print(ins.insert("DLC_Release_Dates", "NULL, %d, %s, %s") % (i+dlc_offset, i+platforms_offset, pop.random_date()))