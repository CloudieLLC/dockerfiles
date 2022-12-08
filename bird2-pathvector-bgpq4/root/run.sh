[ $BIRD_ENABLE ] && { sleep 5; bird -c /usr/local/etc/bird.conf -d & }
tail -f /dev/null
