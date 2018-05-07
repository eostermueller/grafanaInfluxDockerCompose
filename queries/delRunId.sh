#DROP SERIES FROM <measurement_name[,measurement_name]> WHERE <tag_key>='<tag_value>'

curl 'http://localhost:8086/query?pretty=true' --data-urlencode "db=jmeter" --data-urlencode "q=DROP SERIES FROM requestsRaw WHERE \"testName\" = 'Chunky-vs-Chatty' and \"runId\"='DB_STRATEGY_01' "
curl 'http://localhost:8086/query?pretty=true' --data-urlencode "db=jmeter" --data-urlencode "q=DROP SERIES FROM virtualUsers WHERE \"testName\" =     'Chunky-vs-Chatty' and \"runId\"='DB_STRATEGY_01' "
curl 'http://localhost:8086/query?pretty=true' --data-urlencode "db=jmeter" --data-urlencode "q=DROP SERIES FROM testStartEnd WHERE \"testName\" =     'Chunky-vs-Chatty' and \"runId\"='DB_STRATEGY_01' "
