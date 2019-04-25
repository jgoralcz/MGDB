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

## Optimizations and Rationale
Before we were in the third normal form. However, after this we have denormalized.

1) The first optimization is a minor optimization on joins. Instead of joining on multiple attributes, I chose to make an autoincrementing index and make the joins easier.

2) The second optimization is adding indexes to commonly used attributes especially when used on a where clause.
While some attributes have a UNIQUE constraint, mysql sometimes doesn't add the index. I had to add a normal index on top of a unique constraint for Series.
I wanted to play it safe, so I did this for most of them as well. 
Additionally, in this deliverable, you can see that an index was added to nearly every table where a name attribute is applicable.
Examples include (but not limited to): `CREATE INDEX idx_company_name ON Companies(name);`, `CREATE INDEX idx_english_name ON Games(english_name);` and more.

3) Thirdly, we added prepared statements in the rdbm.properties file to 
(1) add separation of concerns (why would we hardcode a string without it being a file??)
and (2) now the database can execute partially compiled/cached statements.

4) Denormalization on workers. Whether they are developers, directors, composers, etc, they are now boolean expressions in Companies_Worker. However, this can either leave some of the data as useless and some of it redudant. Updating could potentially be awful as a result.

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

I was considering optimizing JDBC settings, but looking through some of the options, I thought it would be unnecessary, except for a few obvious things.
First of all, I'm not sure if a connection pool is necessary this early on. Secondly, I wanted to optimize the structure of the tree to do more selects before joins first on all of the queries,
but I only did it on 1 query, where I selected out the main stuff, then limited the query (getAllInformationOnGame).
Overall, I also performed JDBC best practices, which could be treated as an optimization if you consider than I'm not wasting memory by using `select *`.

I also set the fetchSize to 100 at most in the game side. This is because there can be a ton of games, but we only need a certain amount at a time.
Otherwise, I added a limit where needed on the database side.

I looked into object caching, attempted it using VO (like in 422) and considered its use cases by checking for the object first before querying. 
While this would be nice, it would require a bit more work to refactor the code. I started with it a little bit, then I didn't want to pursue refactoring the code.
Although I do already have the classes created in the model directories, I would need to store them, which, as stated before, would require more refactoring.
While the above a little more realistic, sharding or partitioning the database is way out of the question. For an application like this,
I do not ever foresee partioning the database (unless we somehow take over YouTube) because I don't think we'll have over several gigabytes of data.

_________

## Optimization Benchmarks
To perform optimizations, I ran mysql workbench with my database seed script. Remember, I updated the script.
For this test (this will generate A LOT of data; between 2-3 GB, either take my word, do a smaller portion, or take the risk).
Run `python main.py 4000 100` (this will also take some time inserting into the database; even worse inserting with an index trade-off; took be about an hour).
I ended up with about 470,000 rows in each table. **I limited each row to 1000 in mysql workbench**

Here's what adding an index did, despite me having a unique constraint on it (I used 'a' as the '?'):
1) This query is for `sql.getMatchingGameList` (it used to also have a search through the series)... 12.028 sec / 0.0042 sec, now it is 
0.00070 sec / 0.00022 sec **(adding indexes was a HUGE improvement!)**

2) The minor optimization on joins was mainly for a ease of joining. I couldn't find a solid way to determine it was a huge improvement.

3) Adding a prepared statement adds the cache. I could not use mysql workbench for this because it is a jdbc/java thing. It was hard to accurately measure it.

4) the denormalization with the tables representing developers, composers, producers, directors, etc, has been removed and combined (see above).
Before this query (sql.getAllWorkersByGameName) ran about: 7.764 sec / 0.0024 sec (this is also with indexes)

However, after I denormalized, the query took 2.967 sec / .00075 sec (huge improvement! At a cost... See above)
This huge improvement is because of the 5 joins I did not have to perform.


