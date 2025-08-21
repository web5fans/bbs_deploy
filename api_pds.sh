#!/bin/bash

# 设置环境变量
export PDS_HOSTNAME=https://web5.bbs.fans

# xrpc/com.atproto.server.createSession
export createSession_rsp=$(curl --insecure -s $PDS_HOSTNAME/xrpc/com.atproto.server.createSession \
    -X POST \
    -H "Content-Type: application/json" \
    -d '{"identifier": "did:web5:5todaearszbwxyrluncvvx6by5ofuauj", "password": "0x1e910cf624fcfb73fc2a2b26d6f0bca63b8b71cfa7f7027fdef9bce0a59251f0"}' | jq .)
export accessJwt=$(echo $createSession_rsp | jq -r .accessJwt)
export refreshJwt=$(echo $createSession_rsp | jq -r .refreshJwt)
echo "
--- xrpc/com.atproto.server.createSession
response = $createSession_rsp"

# # /xrpc/app.bsky.actor.getProfile
# export getProfile_rsp=$(curl --insecure -s -X GET $PDS_HOSTNAME/xrpc/app.bsky.actor.getProfile?actor=$did \
#     -H "Content-Type: application/json" \
#     -H "Authorization: Bearer "$accessJwt"" | jq .)
# echo "
# --- /xrpc/app.bsky.actor.getProfile
# response = $getProfile_rsp"

# # /xrpc/com.atproto.repo.describeRepo
# export describeRepo_rsp=$(curl --insecure -s -X GET $PDS_HOSTNAME/xrpc/com.atproto.repo.describeRepo?repo=$did | jq .)
# echo "
# --- /xrpc/com.atproto.repo.describeRepo
# response = $describeRepo_rsp"

# /xrpc/com.atproto.repo.createRecord
# export collection="app.bsky.feed.post"
# export createRecord_rsp=$(curl --insecure -s $PDS_HOSTNAME/xrpc/com.atproto.repo.createRecord \
#     -X POST \
#     -H "Content-Type: application/json" \
#     -H "Authorization: Bearer "$accessJwt"" \
#     -d '{"repo": "'$did'", "collection": "'$collection'", "record": {"text": "Hello, world!", "createdAt": "'$(date -Iseconds)'"}}' | jq .)
# export rkey=$(echo $createRecord_rsp | jq -r .uri | cut -d '/' -f 5)
# echo "
# --- /xrpc/com.atproto.repo.createRecord
# collection = $collection
# response = $createRecord_rsp"

# /xrpc/com.atproto.repo.putRecord
# export collection="app.actor.profile"
# export createRecord_rsp=$(curl --insecure -s $PDS_HOSTNAME/xrpc/com.atproto.repo.putRecord \
#     -X POST \
#     -H "Content-Type: application/json" \
#     -H "Authorization: Bearer "$accessJwt"" \
#     -d '{"repo": "'$did'", "collection": "'$collection'", "rkey": "self", "record": {"display_name": "JLer", "description": "简介", "created": "'$(date -Iseconds)'"}}' | jq .)
# export rkey=$(echo $createRecord_rsp | jq -r .uri | cut -d '/' -f 5)
# echo "
# --- /xrpc/com.atproto.repo.createRecord
# collection = $collection
# response = $createRecord_rsp"

# /xrpc/com.atproto.repo.getRecord
# export getRecord_api="$PDS_HOSTNAME/xrpc/com.atproto.repo.getRecord?repo=$did&collection=$collection&rkey=$rkey"
# export getRecord_rsp=$(curl --insecure -s -X GET $getRecord_api | jq .)
# echo "
# --- /xrpc/com.atproto.repo.getRecord
# rkey = $rkey
# collection = $collection
# response = $getRecord_rsp"


# # /xrpc/com.atproto.repo.applyWrites
# export applyWrites_rsp=$(curl --insecure -s $PDS_HOSTNAME/xrpc/com.atproto.repo.applyWrites \
#     -X POST \
#     -H "Content-Type: application/json" \
#     -H "Authorization: Bearer "$accessJwt"" \
#     -d '{"repo":"'$did'","writes":[{"$type":"com.atproto.repo.applyWrites#create","collection":"app.bsky.feed.post","rkey":"3lr7svkn4ffff","value":{"$type":"app.bsky.feed.post","createdAt":"'$(date -Iseconds)'","text":"123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890","langs":["zh"]}}],"validate":true}' | jq .)
# export rkey=$(echo $applyWrites_rsp | jq -r .uri | cut -d '/' -f 5)
# echo "
# --- /xrpc/com.atproto.repo.applyWrites
# response = $applyWrites_rsp"

# /xrpc/com.atproto.identity.resolveIdentity
export getRecord_api="$PDS_HOSTNAME/xrpc/com.atproto.identity.resolveIdentity?identifier=did:web5:5todaearszbwxyrluncvvx6by5ofuauj"
export getRecord_rsp=$(curl --insecure -s $getRecord_api \
    -X GET \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer "$accessJwt"" | jq .)
echo "
--- /xrpc/com.atproto.identity.resolveIdentity
response = $getRecord_rsp"