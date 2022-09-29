#!/bin/bash

curl_cmd="curl --silent --output /dev/null"
#curl_cmd="curl"

while true
do
	echo -n ">>--"
	$curl_cmd "http://localhost:8080/external-profiles"
	sleep 10
	$curl_cmd "http://localhost:8080/external-profiles/random"
	sleep 10
done