#!/bin/bash

# start docke-compose

docker-compose up -d --remove-orphans

PSQL="docker exec -it test-psql psql -U postgres"

echo "TESTING IF WE HAVE ANY TALBES"
$PSQL -c "\dt"

$PSQL -c "create table if not exists testing_table (\
    id serial, \
    first_name varchar(50) not null \
  )"

echo "rename name field to first_name in table testing_table"
$PSQL -c "alter table testing_table rename column name to first_name"

echo "adding lastname field to testing_table"
$PSQL -c "alter table testing_table add column if not exists last_name varchar(50) not null "

echo "adding age field to testing_table"
$PSQL -c "alter table testing_table add column if not exists age int not null "

echo "check if we have some new tables"

echo "TESTING IF WE HAVE ANY TALBES"
$PSQL -c "\dt"

echo "describe table testing_table"
$PSQL -c  "\d testing_table"

echo "inserting sample values"
$PSQL -c"table testing_table"

echo "show databases"
$PSQL -c "\l"

echo "select all from "
$PSQL -c "select * from testing_table"
