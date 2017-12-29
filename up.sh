#!/bin/bash

docker-compose up -d

echo "Grafana: http://127.0.0.1:3000 - admin/admin"
echo "Waiting for container startup before creating jmeter schema"
sleep 2

curl -i -XPOST http://localhost:8086/query --data-urlencode "q=CREATE DATABASE jmeter WITH DURATION 30d REPLICATION 1 SHARD DURATION 1h NAME \"one_month\""

curl -G "http://localhost:8086/query?pretty=true" --data-urlencode "q=SHOW DATABASES"

######
###### G R A F A N A
######
curl -L --max-time 10 -i -u admin:admin -H "Accept:application/json" -H "Content-Type:application/json" -d  @createDataSource.txt http://localhost:3000/api/datasources

curl -L --max-time 10 -f http://admin:admin@localhost:3000/api/datasources/name/influxTimeShift

