#!/bin/bash

NEWRELIC_APP_ID=1027014437
NEWRELIC_API_KEY=${NEWRELIC_API_KEY}

rev=`git rev-parse HEAD`
user=`git show -s --format='%ae' ${rev}`

curl -X POST "https://api.newrelic.com/v2/applications/${NEWRELIC_APP_ID}/deployments.json" \
-H "X-Api-Key:${NEWRELIC_API_KEY}" \
-i \
-H "Content-Type: application/json" \
-d \
'{
"deployment": {
"revision": "'${rev}'",
"changelog": "deploy",
"description": "deploy",
"user": "'${user}'"
}
}'

