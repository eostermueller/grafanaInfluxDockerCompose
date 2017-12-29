curl -i -u admin:admin -H "Accept:application/json" -H "Content-Type:application/json" -d  @createDataSource.txt http://localhost:3000/api/datasources


curl -u admin:admin -f http://admin:admin@localhost:3000/api/datasources/name/influxTimeShift

