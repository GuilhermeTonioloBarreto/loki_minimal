START=$(date -d '15 minutes ago' +%s%N)
END=$(date +%s%N)

curl -s -G http://localhost:3100/loki/api/v1/query_range \
  --data-urlencode 'query={job="quati"}' \
  --data-urlencode "start=$START" \
  --data-urlencode "end=$END" \
  --data-urlencode "limit=1000" \
| jq -r '
  .data.result[].values[] |
  ((.[0] | tonumber / 1000000000) | strftime("%Y-%m-%d %H:%M:%S"))
  + " - "
  + .[1]
'
