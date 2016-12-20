# CSV Processor
Processes CSV file containing codes and builds a SQL file which can then be inserted into the database.

Client should supply a CSV of approved codes, which can be processed into a SQL insert statement by
doing the following:

## First, check format of CSV is good
Just one code per line is needed, no headers please :-)

```
GZHZPCWKHV2KJX4X
JM23QFYMJ6PT929D
T94EJKW9TXGRN3RT
...
PQZ6TP3TRWQFFZD7
```

## Second, configure and run the utility (`run.rb`)
Change the path of the CSV file and the path to the SQL file in `run.rb` if necessary, then run

```
ruby run.rb
```

## Third, add the codes to the database
Upload the newly generated sql file to where the app is running and run:

```
sqlite3 /path/to/database.sqlite3 < /path/to/codes.sql
```

## TDD
Uses RSpec and a utility called `entr`, download and install (`apt install entr` or `brew install entr`) and run and it will
call RSpec when any file changes are detected.

```
ls **/*.* | entr rspec
```

Alternatively just call `rspec`.
