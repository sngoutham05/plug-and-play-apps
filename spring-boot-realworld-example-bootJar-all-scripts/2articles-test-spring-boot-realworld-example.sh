#!/bin/bash

#curl_cmd="curl"
curl_cmd="curl --silent --output /dev/null"
endpoint="http://localhost:8080"
content_type_header="Content-Type: application/json"
post_header="-X POST"
sleep_cmd="sleep 5"
article_slug_dragon="how-to-train-your-dragon"
article_slug_this_moment="enjoy-this-moment"

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


#Create Article
$curl_cmd -H "$content_type_header" -H "$auth_header" -d '{"article": {"title": "How to train your dragon","description": "Ever wonder how?","body": "You have to believe","tagList": ["reactjs", "angularjs", "dragons"]}}' $post_header "${endpoint}/articles"
$curl_cmd -H "$content_type_header" -H "$auth_header" -d '{"article": {"title": "Enjoy this moment","description": "Ever wonder how?","body": "You have to believe","tagList": ["self-awareness-goals","Think-big"]}}' $post_header "${endpoint}/articles"
#Get Article
$curl_cmd -H "$content_type_header" "${endpoint}/articles/${article_slug_dragon}"
$curl_cmd -H "$content_type_header" "${endpoint}/articles/${article_slug_this_moment}"

while true
do
	nano_number=$( date +%s )
	echo -n ">>--$nano_number"
	$curl_cmd -H "$content_type_header" -H "$auth_header" -d '{"article": {"title": "Test Article '${nano_number}'","description": "testt Article for load","body": "Dummy article","tagList": ["helloword"]}}' $post_header "${endpoint}/articles"
	$sleep_cmd
	article_slug="test-article-${nano_number}"
	#Get Article
	$curl_cmd -H "$content_type_header" "${endpoint}/articles/${article_slug}"
	$sleep_cmd
	#Get Articles
	$curl_cmd -H "$content_type_header" "${endpoint}/articles"
	$sleep_cmd
	#Get Articles - Tthink big
	$curl_cmd -H "$content_type_header" "${endpoint}/articles?tag=Think-big"
	$sleep_cmd
	#Get Articles - helloworld
	$curl_cmd -H "$content_type_header" "${endpoint}/articles?tag=helloword"
	$sleep_cmd
	#Delete Article
	$curl_cmd -H "$content_type_header" -H "$auth_header" -X DELETE "${endpoint}/articles/${article_slug}"
	$sleep_cmd
done