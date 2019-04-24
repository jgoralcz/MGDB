# MGDB
my game database deliverable 5

#### For the first part of this deliverable, you can populate the database with python (once you have the DDL added).
To use the python autogeneration use it like so from the root directory of this file: 
`python3 main.py <length> <depth>` where `length` (default 5) is the number of rows to generate and `depth` (default 2) is the extra random numbers to add to tables that depend on other tables (foreign key testing).
An example could like like `python3 main.py 150 30` or simply `python3 main.py` **if you do not have python3 try just using python instead (or install python3)**

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
_________

## Site
In case you are given gibberish data, you can check in the properties/rdbm.properties file
to see what each of them should return.

Otherwise, I will explain:

Games has two functions when searching: list and all. List is a brief overview, while all is mostly all information on it (descriptions).

Series searches for games when you're searching for a series name.

Game Workers searches for workers by a given game's name. In other words, who all worked on this game?

Main Character searches for main characters of a given game by game name.

Companies searches by either company name or game name. Where you can find game info or company info based on which one you choose.

________

## Testing
Finally, JUnit testing was finished. The tests are found in the `/test` folder
to run the unit tests use `ant test`

As for the DBUnit testing, we attempted it.

________

## Optimizations
Before we were in the third normal form. However, after this we have denormalized.

1) The first optimization is a minor optimization on joins. Instead of joining on multiple attributes, I chose to make an autoincrementing index and make the joins easier.

2) The second optimization is adding indexes to commonly used attributes especially when used on a where clause.
While some attributes have a UNIQUE constraint, these already create indexes. However, in this deliverable, you can see that an index was added to nearly every table where a name attribute is applicable.
Examples include (but not limited to): `CREATE INDEX idx_company_name ON Companies(name);`, `CREATE INDEX idx_english_name ON Games(english_name);` and more.

3) Denormalization on workers. Whether they are developers, directors, composers, etc, they are now boolean expressions in Companies_Worker. However, this can either leave some of the data as useless and some of it redudant. Updating could potentially be awful as a result.

Before: 
```$xslt
    CREATE TABLE IF NOT EXISTS Producers (
     id           INTEGER AUTO_INCREMENT,
     worker_id    INTEGER NOT NULL,
     CONSTRAINT pk_producer_id PRIMARY KEY(id),
     CONSTRAINT fk_producer_worker_id FOREIGN KEY (worker_id) REFERENCES Workers(id) ON UPDATE CASCADE
   ) AUTO_INCREMENT = 100000;
```
We removed this table, and the join that it would cause in certain queries. In one query I was using about 7 joins!
Now I am only doing 2 joins. The new table looks like:

```$xslt
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
```
This table has a problem with nulls and redundant company/worker_id combination. Although I could add a default constraint of false,
that would also be wasting data.


I thought about optimizing JDBC driver settings because that sounded pretty easy, but I thought about it. 
