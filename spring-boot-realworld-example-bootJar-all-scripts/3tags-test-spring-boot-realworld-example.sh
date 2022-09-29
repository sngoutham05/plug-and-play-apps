#!/bin/bash

curl_cmd="curl --silent --output /dev/null"
#curl_cmd="curl"

endpoint="http://localhost:8080"
while true
do
	echo -n ">>--"
	$curl_cmd "${endpoint}/tags"
	sleep 10
done