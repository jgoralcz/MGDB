# MGDB
my game database deliverable 5

#### For the first part of this deliverable, you can populate the database with python (once you have the DDL added).
To use the python autogeneration use it like so from the root directory of this file: 
`python3 main.py <length> <depth>` where `length` (default 5) is the number of rows to generate and `depth` (default 2) is the extra random numbers to add to tables that depend on other tables (foreign key testing).
An example could like like `python3 main.py 30, 10` or simply `python3 main.py` **if you do not have python3 try just using python instead (or install python3)**

####IMPORTANT: as of the 5th deliverable there is a 2nd python file to populate the database and a 2nd DDL with indexes and denormalization from its original (close) 3rd normal form.
I updated main.py to work with our new database format (denormalized a few things)

To run tomcat go to the bin folder and type in `./catalina.sh run` for **mac/unix users** (not sure what windows uses).
**To verify it's working simply go to localhost:8080** in your browser.

To run mySQL on your system:
    `mysql -u root -p`    
**Make sure you change the username/password in the `properties/rdbm.properties` file. TO YOUR OWN MYSQL USERNAME/PASSWORD!!!**
    
To build tomcat, make sure you point it to a correct tomcat instance in the `build.properties` file.
The `tomcat.home` in the build should be enough to satisfy this.

then run `ant deploy` on the command line with the root of the folder having the `build.xml`
you can then go to the `localhost:8080/mgdb/` as mentioned before.

As for the website, make sure you are connected to your tomcat instance (I used port 8080)
It will look something like: `localhost:8080/mgdb/` and then from there use the buttons to search.


If you get a JDBC error check your `properties/rdbm.properties` and make sure you have the right info.
Also make sure you have the right DDL and have populated it with a correct DML. Then do `ant deploy` to redo it.


### Site
In case you are given gibberish data, you can check in the properties/rdbm.properties file
to see what each of them should return.

Otherwise, I will explain:

Games has two functions when searching: list and all. List is a brief overview, while all is mostly all information on it (descriptions).

Series searches for games when you're searching for a series name.

Game Workers searches for workers by a given game's name. In other words, who all worked on this game?

Main Character searches for main characters of a given game by game name.

Companies searches by either company name or game name. Where you can find game info or company info based on which one you choose.

Finally, JUnit testing was finished.
As for the DBUnit testing, we attempted it.

Unfortunately did not have enough time for the Dockerfile. Although feel free to add to what is there if you think it'll be easier.
    

