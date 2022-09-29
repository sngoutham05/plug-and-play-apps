#!/bin/bash

curl_cmd="curl --silent --output /dev/null"
#curl_cmd="curl"

endpoint="http://localhost:9090/message-logger"

sleep_cmd="sleep 5"

while true
do
	echo -n ">>--"
	
	$curl_cmd --get --data-urlencode "msg=A random message" "${endpoint}/error"
	$sleep_cmd
	$curl_cmd --get --data-urlencode "msg=Users CC Number is 1234-5678-9012-3456 for checkout" "${endpoint}/error"
	$sleep_cmd
	$curl_cmd --get --data-urlencode "msg=Users CC Number is 1234-5678-9012-3456 for checkout" "${endpoint}/info"
	$sleep_cmd
	$curl_cmd --get --data-urlencode "msg=Users CC Number is 1234-5678-9012-3456 for checkout" "${endpoint}/debug"
	$sleep_cmd
	$curl_cmd --get --data-urlencode "msg=Users CC Number is 1234-5678-9012-345 for checkout" "${endpoint}/info"
	$sleep_cmd
	$curl_cmd --get --data-urlencode "msg=Users CC Number is 1234-5678-9012-345 for checkout" "${endpoint}/error"
	$sleep_cmd
	$curl_cmd --get --data-urlencode "msg=Users CC Number is 1234-5678-9012-3 for checkout" "${endpoint}/info"
	$sleep_cmd
	$curl_cmd --get --data-urlencode "msg=Users CC Number is 1234-5678-9012-3 for checkout" "${endpoint}/error"
	$sleep_cmd
	$curl_cmd --get --data-urlencode "msg=Logged In User name is abcd@abcd.com" "${endpoint}/info"
	$sleep_cmd
done