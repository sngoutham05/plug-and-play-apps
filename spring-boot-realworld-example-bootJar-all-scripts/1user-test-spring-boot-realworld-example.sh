#!/bin/bash

#curl_cmd="curl"
curl_cmd="curl --silent --output /dev/null"
endpoint="http://localhost:8080"
content_type_header="Content-Type: application/json"
post_header="-X POST"
sleep_cmd="sleep 5"

#Login
login_response=$(curl --silent -H "$content_type_header" -d '{"user":{"email": "jake@jake.jake","password": "jakejake"}}' $post_header "${endpoint}/users/login")
#echo $login_response
#echo ">>>>>"
delimiter='"token":"'
conCatString=$login_response$delimiter
splitMultiChar=()
while [[ $conCatString ]]; do
splitMultiChar+=( "${conCatString%%"$delimiter"*}" )
conCatString=${conCatString#*"$delimiter"}
done

#echo "<<<<<<"
conCatString=${splitMultiChar[1]}
auth_token=${conCatString%"\"}}"}
#echo $auth_token
auth_header="Authorization: Token $auth_token"

while true
do
	echo -n ">>--"
	$curl_cmd "${endpoint}/profiles/Jacob"
	$sleep_cmd
	#Login - User does not exist
	$curl_cmd -H "$content_type_header" -d '{"user":{"email": "invaliduser@email.com","password": "invalidpwd"}}' $post_header "${endpoint}/users/login"
	$sleep_cmd
	#Login - without password
	$curl_cmd -H "$content_type_header" -d '{"user":{"email": "jake@jake.jake"}}' $post_header "${endpoint}/users/login"
	$sleep_cmd
	#Login - Success
	$curl_cmd -H "$content_type_header" -d '{"user":{"email": "jake@jake.jake","password": "jakejake"}}' $post_header "${endpoint}/users/login"
	$sleep_cmd
	$curl_cmd -H "$auth_header" "${endpoint}/user"
	$sleep_cmd
	# Duplicate User Registration - Business Error
	$curl_cmd -H "$content_type_header" -d '{"user":{"username": "Jacob","email": "jake@jake.jake","password": "jakejake"}}' $post_header "${endpoint}/users"
	$sleep_cmd
	# Registration without password - Validation Error
	$curl_cmd -H "$content_type_header" -d '{"user":{"username": "goutham","email": "goutham@goutham.com"}}' $post_header "${endpoint}/users"
	$sleep_cmd
done
