#!/bin/bash

# start docke-compose

docker-compose up -d --remove-orphans

PSQL="docker exec -it test-psql psql -U postgres"

echo "TESTING IF WE HAVE ANY TALBES"
$PSQL -c "\dt"

$PSQL -c "create table testing_table (\
    id serial, \
    name varchar(50) not null \
  )"

echo "check if we have some new tables"

echo "TESTING IF WE HAVE ANY TALBES"
$PSQL -c "\dt"

echo "describe table testing_table"
$PSQL -c  "\d testing_table"


echo "inserting sample values"
$PSQL -c"table testing_table"
