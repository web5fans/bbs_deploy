#!/bin/bash

export BASE_URL=https://app.bbs.fans
export TOKEN=
export did=

# export rsp=$(curl --insecure -s $BASE_URL/api/record/create \
#     -X POST \
#     -H "Content-Type: application/json" \
#     -H "Authorization: Bearer "$TOKEN"" \
#     -d '{
#             "repo": "'$did'",
#             "section_id": 0,
#             "title": "first post",
#             "text": "Hello, world!"
#         }' | jq .
# )
# echo "
# --- /api/record/create ---
# response = $rsp"

export rsp=$(curl --insecure -s $BASE_URL/api/post/list \
    -X POST \
    -H "Content-Type: application/json" \
    -d '{
            "section_id": "1",
            "repo": "",
            "limit": 1,
            "cursor": "2025-08-12 05:25:37",
            "q": ""
        }'
)
echo "
--- /api/post/list ---
response = $rsp"

export rsp=$(curl --insecure -s $BASE_URL/api/post/top \
    -X POST \
    -H "Content-Type: application/json" \
    -d '{
            "section_id": "1"
        }'
)
echo "
--- /api/post/top ---
response = $rsp"

export rsp=$(curl --insecure -s $BASE_URL/api/post/detail?uri= \
    -X GET \
    -H "Content-Type: application/json"
)
echo "
--- /api/post/detail ---
response = $rsp"

export rsp=$(curl --insecure -s $BASE_URL/api/reply/list \
    -X POST \
    -H "Content-Type: application/json" \
    -d '{
            "root": "",
            "parent": "",
            "page": 1,
            "per_page": 20
        }'
)
echo "
--- /api/reply/list ---
response = $rsp"

export rsp=$(curl --insecure -s $BASE_URL/api/section/detail?id=1 \
    -X GET \
    -H "Content-Type: application/json"
)
echo "
--- /api/section/detail ---
response = $rsp"