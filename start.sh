#!/bin/bash
source /app/config.sh

service ssh start
service nginx start

echo "set ngrok token: $NGROK_TOKEN"
ngrok authtoken $NGROK_TOKEN
ngrok http --domain=good-glider-heavily.ngrok-free.app 80
echo "start ngrok service"
ngrok tcp 22 --log=stdout > ngrok.log
