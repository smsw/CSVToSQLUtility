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
`ruby run.rb`

## Tests
`ls **/*.* | entr rspec`

## Add codes to database
`sqlite3 database.sqlite3 < codes.sql`
