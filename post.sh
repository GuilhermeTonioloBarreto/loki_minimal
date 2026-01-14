#!/bin/bash

jq -n '{
  streams: [
    {
      stream: {
        job: "pps",
        service: "pps_quati",
        level: "info",
        env: "dev"
      },
      values: [
        [ ((now * 1000000000) | floor | tostring), "O Gabs  é sensacional" ]
      ]
    }
  ]
}' | curl -X POST http://localhost:3100/loki/api/v1/push \
  -H "Content-Type: application/json" \
  -d @-
