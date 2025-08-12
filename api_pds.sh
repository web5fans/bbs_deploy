#!/bin/bash

# 设置环境变量
export PDS_HOSTNAME=localhost:2583
export PLC_HOSTNAME=localhost:2582

# /xrpc/com.atproto.server.createAccount
export pds_account_handle=$(openssl rand --hex 2)
export pds_account_password=$(openssl rand --hex 16)
export createAccount_rsp=$(curl --insecure -s http://$PDS_HOSTNAME/xrpc/com.atproto.server.createAccount \
    -X POST \
    -H "Content-Type: application/json" \
    -d '{"handle": "'$pds_account_handle'.test", "email": "'$pds_account_handle'@web5.bbs.fans", "password": "'$pds_account_password'"}')
export did=$(echo $createAccount_rsp | jq -r .did)
echo "--- /xrpc/com.atproto.server.createAccount
pds_account_handle = $pds_account_handle
pds_account_password = $pds_account_password
response = $createAccount_rsp"

# xrpc/com.atproto.server.createSession
export createSession_rsp=$(curl --insecure -s http://$PDS_HOSTNAME/xrpc/com.atproto.server.createSession \
    -X POST \
    -H "Content-Type: application/json" \
    -d '{"identifier": "'$pds_account_handle'@web5.bbs.fans", "password": "'$pds_account_password'"}' | jq .)
export accessJwt=$(echo $createSession_rsp | jq -r .accessJwt)
export refreshJwt=$(echo $createSession_rsp | jq -r .refreshJwt)
echo "
--- xrpc/com.atproto.server.createSession
response = $createSession_rsp"

# DID document
# export did_dpc_rsp=$(curl --insecure -s -X GET http://$PLC_HOSTNAME/$did | jq .)
# echo "
# --- DID document
# did = $did
# response = $did_dpc_rsp"

# # /xrpc/app.bsky.actor.getProfile
# export getProfile_rsp=$(curl --insecure -s -X GET http://$PDS_HOSTNAME/xrpc/app.bsky.actor.getProfile?actor=$did \
#     -H "Content-Type: application/json" \
#     -H "Authorization: Bearer "$accessJwt"" | jq .)
# echo "
# --- /xrpc/app.bsky.actor.getProfile
# response = $getProfile_rsp"

# # /xrpc/com.atproto.repo.describeRepo
# export describeRepo_rsp=$(curl --insecure -s -X GET http://$PDS_HOSTNAME/xrpc/com.atproto.repo.describeRepo?repo=$did | jq .)
# echo "
# --- /xrpc/com.atproto.repo.describeRepo
# response = $describeRepo_rsp"

# /xrpc/com.atproto.repo.createRecord
export collection="app.bsky.feed.post"
export createRecord_rsp=$(curl --insecure -s http://$PDS_HOSTNAME/xrpc/com.atproto.repo.createRecord \
    -X POST \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer "$accessJwt"" \
    -d '{"repo": "'$did'", "collection": "'$collection'", "record": {"text": "Hello, world!", "createdAt": "'$(date -Iseconds)'"}}' | jq .)
export rkey=$(echo $createRecord_rsp | jq -r .uri | cut -d '/' -f 5)
echo "
--- /xrpc/com.atproto.repo.createRecord
collection = $collection
response = $createRecord_rsp"

# /xrpc/com.atproto.repo.putRecord
export collection="app.actor.profile"
export createRecord_rsp=$(curl --insecure -s http://$PDS_HOSTNAME/xrpc/com.atproto.repo.putRecord \
    -X POST \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer "$accessJwt"" \
    -d '{"repo": "'$did'", "collection": "'$collection'", "rkey": "self", "record": {"display_name": "JLer", "description": "简介", "created": "'$(date -Iseconds)'"}}' | jq .)
export rkey=$(echo $createRecord_rsp | jq -r .uri | cut -d '/' -f 5)
echo "
--- /xrpc/com.atproto.repo.createRecord
collection = $collection
response = $createRecord_rsp"

# /xrpc/com.atproto.repo.getRecord
export getRecord_api="http://$PDS_HOSTNAME/xrpc/com.atproto.repo.getRecord?repo=$did&collection=$collection&rkey=$rkey"
export getRecord_rsp=$(curl --insecure -s -X GET $getRecord_api | jq .)
echo "
--- /xrpc/com.atproto.repo.getRecord
rkey = $rkey
collection = $collection
response = $getRecord_rsp"


# # /xrpc/com.atproto.repo.applyWrites
# export applyWrites_rsp=$(curl --insecure -s http://$PDS_HOSTNAME/xrpc/com.atproto.repo.applyWrites \
#     -X POST \
#     -H "Content-Type: application/json" \
#     -H "Authorization: Bearer "$accessJwt"" \
#     -d '{"repo":"'$did'","writes":[{"$type":"com.atproto.repo.applyWrites#create","collection":"app.bsky.feed.post","rkey":"3lr7svkn4ffff","value":{"$type":"app.bsky.feed.post","createdAt":"'$(date -Iseconds)'","text":"123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890","langs":["zh"]}}],"validate":true}' | jq .)
# export rkey=$(echo $applyWrites_rsp | jq -r .uri | cut -d '/' -f 5)
# echo "
# --- /xrpc/com.atproto.repo.applyWrites
# response = $applyWrites_rsp"
