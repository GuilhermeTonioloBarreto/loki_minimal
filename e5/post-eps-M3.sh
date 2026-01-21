#!/bin/bash

jq -n '{
  streams: [
    {
      stream: {
        job: "quati",
        service: "eps",
        level: "info",
        env: "dev"
      },
      values: [
        [ ((now * 1000000000) | floor | tostring), "M3 está com problema" ]
      ]
    }
  ]
}' | curl -X POST http://localhost:3100/loki/api/v1/push \
  -H "Content-Type: application/json" \
  -d @-
