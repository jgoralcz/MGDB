import sys
import random
from insertion.HelperFunctions.Populator import Populator as pop
from insertion.Insert import Insert as ins

# args = sys.argv[1:]
args = 5

# run for engine; index starts at 1
for i in range(args):
    print(ins.insert("Engines", "NULL, %s, %s, %s, %s" % (pop.random_string(32), pop.random_string(1000), pop.random_date(), pop.random_string(256))))

# run for Companies; index starts at 1000
for i in range(args):
    print(ins.insert("Companies", "NULL, %s, %s" % (pop.random_string(128), pop.random_string(1000))))

# run for Critics; index starts at 1000
for i in range(args):
    print(ins.insert("Critics", "NULL, %s") % (pop.random_string(32)))

# run for Series; index starts at 1000
for i in range(args):
    print(ins.insert("Series", "NULL, %s, %s, %s") % (pop.random_string(128), pop.random_date(), pop.random_string(1000), pop.random_string(256)))

# run for Games
for i in range(1, args):
    print(ins.insert("Critics", "NULL, %d, %d, %s, %s, %s, %s") % (random.randint(1, i), random.randint(), pop.random_string(1000), pop.random_string(64), pop.random_string(64), pop.random_string(256) ))

