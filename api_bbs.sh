#!/bin/bash

export BASE_URL=http://localhost:8080
export TOKEN=
export did=

export rsp=$(curl --insecure -s $BASE_URL/api/post/create \
    -X POST \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer "$TOKEN"" \
    -d '{"repo": "'$did'", "section_id": 0, "title": "first post", "text": "Hello, world!"}' | jq . )
echo "
--- /api/post/create
response = $rsp"

export rsp=$(curl --insecure -s $BASE_URL/api/post/list \
    -X POST \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer "$TOKEN"" \
    -d '{"limit": 1, "cursor": "2025-08-12 05:25:37"}' )
    # -d '{"limit": 1}' )
echo "
--- /api/post/list
response = $rsp"