#!/bin/bash

curl_cmd="curl --silent --output /dev/null"
#curl_cmd="curl"

endpoint="http://localhost:8080/message-logger"

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
	$curl_cmd --get --data-urlencode "msg=[2022-09-01 06:21:41,357] {taskinstance.py:1277} INFO - Marking task as SUCCESS. dag_id=Osdu_ingest, task_id=update_status_running_task, execution_date=20220901T062134, start_date=20220901T062137, end_date=20220901T062141" "${endpoint}/info"
	$sleep_cmd
	$curl_cmd --get --data-urlencode "msg=[2022-09-01 04:30:49,251] {taskinstance.py:1277} INFO - Marking task as SUCCESS. dag_id=Osdu_ingest, task_id=update_status_running_task, execution_date=20220901T043044, start_date=20220901T043045, end_date=20220901T043049" "${endpoint}/info"
	$sleep_cmd
	$curl_cmd --get --data-urlencode "msg=isoDate Formats, iso1=2022-09-05T15:30:49,251+05:30, iso2=2022-09-01T04:30:44, iso3=2022-09-01 04:30:49,251" "${endpoint}/info"
	$sleep_cmd
done