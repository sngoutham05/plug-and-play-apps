echo "Starting spring-boot-realworld-example application >>>>> "
sh _startApplication-spring-boot-realworld-example.sh > /dev/null 2>&1 &

sleep 10

echo "Starting spring-boot-realworld-example Test Scripts >>>>> "
sh 0RegisterUser-spring-boot-realworld-example.sh > /dev/null 2>&1 &

sh 1user-test-spring-boot-realworld-example.sh > /dev/null 2>&1 &

sh 2articles-test-spring-boot-realworld-example.sh > /dev/null 2>&1 &

sh 3tags-test-spring-boot-realworld-example.sh > /dev/null 2>&1 &

sh 4external-profiles-test-spring-boot-realworld-example.sh > /dev/null 2>&1 &

sh 5message-logger-test-spring-boot-realworld-example.sh > /dev/null 2>&1 &

sleep 10

echo "spring-boot-realworld-example Processes >>>>> "

ps -ef | grep spring-boot-realworld-example

