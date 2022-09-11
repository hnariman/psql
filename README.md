# This is repo with fast start PSQL docker with mock data


### start docke-compose
```bash
docker-compose up -d --remove-orphans
```

### setting up PSQL command shortcut
```bash
PSQL="docker exec -it test-psql psql -U postgres"
```

### TESTING IF WE HAVE ANY TALBES
```bash
$PSQL -c "\dt"
```

### create some sample table
```bash
$PSQL -c "create table testing_table (\
    id serial, \
    name varchar(50) not null \
  )"
```

echo "check if we have some new tables"

echo "TESTING IF WE HAVE ANY TALBES"
$PSQL -c "\dt"

echo "describe table testing_table"
$PSQL -c  "\d testing_table"
