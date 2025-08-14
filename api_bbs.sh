#!/bin/bash

export BASE_URL=https://app.bbs.fans
export TOKEN=
export did=

export rsp=$(curl --insecure -s $BASE_URL/api/record/create \
    -X POST \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer "$TOKEN"" \
    -d '{
            "repo": "'$did'",
            "section_id": 0,
            "title": "first post",
            "text": "Hello, world!"
        }' | jq .
)
echo "
--- /api/record/create ---
response = $rsp"

export rsp=$(curl --insecure -s $BASE_URL/api/post/list \
    -X POST \
    -H "Content-Type: application/json" \
    -d '{
            "section_id": 0,
            "repo": "",
            "limit": 1,
            "cursor": "2025-08-12 05:25:37",
            "q": "",
        }' | jq .
)
echo "
--- /api/post/list ---
response = $rsp"

export rsp=$(curl --insecure -s $BASE_URL/api/post/top \
    -X POST \
    -H "Content-Type: application/json" \
    -d '{
            "section_id": 0
        }'
)
echo "
--- /api/post/top ---
response = $rsp"

export rsp=$(curl --insecure -s $BASE_URL/api/section/list \
    -X GET \
    -H "Content-Type: application/json" \
    | jq .
)
echo "
--- /api/section/list ---
response = $rsp"