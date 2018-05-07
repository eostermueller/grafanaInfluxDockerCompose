

echo About to permanently delete all data from all tables.
read -p "@@ Press any key to continue, or Ctrl+C to exit."

curl 'http://localhost:8086/query?pretty=true' --data-urlencode "db=jmeter" --data-urlencode "q=DROP measurement requestsRaw "
curl 'http://localhost:8086/query?pretty=true' --data-urlencode "db=jmeter" --data-urlencode "q=DROP measurement virtualUsers"
curl 'http://localhost:8086/query?pretty=true' --data-urlencode "db=jmeter" --data-urlencode "q=DROP measurement testStartEnd"
