#!/bin/bash

curl_cmd="curl"
#curl_cmd="curl --silent --output /dev/null"
endpoint="http://localhost:8080"
content_type_header="Content-Type: application/json"
auth_header=""
post_header="-X POST"
sleep_cmd="sleep 5"


$curl_cmd -H "$content_type_header" -d '{"user":{"username": "Jacob","email": "jake@jake.jake","password": "jakejake"}}' $post_header "${endpoint}/users"

