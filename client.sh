#!/bin/bash

set -e
(
while true
do
  curl -sf -o /dev/null http://localhost:8000 && echo "$(date -u) Connection successful"|| echo "$(date -u) OH NO! Unable to connect to server"
  sleep 2
done
) 2>&1 | tee client.log
