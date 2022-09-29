echo "Starting spring-petclinic application >>>>> "
sh 0startApplication-spring-petclinic.sh > /dev/null 2>&1 &

sleep 10

echo "Starting spring-petclinic Test Scripts >>>>> "

sh 1message-logger-spring-petclinic.sh > /dev/null 2>&1 &

sleep 10

echo "spring-petclinic Processes >>>>> "

ps -ef | grep spring-petclinic

