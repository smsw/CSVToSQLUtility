# CSV Processor
Processes CSV file containing codes and builds a SQL file which can then be inserted.

## Format of CSV
Very simple, just one code per line, no headers needed :-)
```
GZHZPCWKHV2KJX4X
JM23QFYMJ6PT929D
T94EJKW9TXGRN3RT
...
PQZ6TP3TRWQFFZD7
```

## Configure and run
Change the path of the CSV file and the path to the SQL file in run.rb, then run
```
ruby run.rb
```

## Tests
Uses a utility called `entr`, download and install (`apt install entr` or `brew install entr`) and then it will
call RSpec when any file changes are detected. Alternatively just call `rspec`.
```
ls **/*.* | entr rspec
```

## Add codes to database
Where ever the database is (in Rails it'll be in `db/production.sqlite3`) `cd` there and run
```
sqlite3 database.sqlite3 < codes.sql
```
