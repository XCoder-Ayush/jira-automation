#!/bin/bash

TICKET_ID=$1

response=$(curl --silent --request GET \
  --url "${JIRA_BASE_URL}/rest/api/2/issue/${TICKET_ID}" \
  --user "${JIRA_USER_EMAIL}:${JIRA_API_TOKEN}")

if echo "$response" | grep -q "\"key\":\"${TICKET_ID}\""; then
  echo "::set-output name=exists::true"
else
  echo "::set-output name=exists::false"
fi
