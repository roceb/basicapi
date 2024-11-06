#!/bin/bash

set -e
(
ssh -o ExitOnForwardFailure=yes -f -N -L 8000:127.0.0.1:8000 jenkins@mac01.ls.lsst.org
ssh -o ExitOnForwardFailure=yes -f -N -L 8001:127.0.0.1:8000 jenkins@mac02.ls.lsst.org
ssh -o ExitOnForwardFailure=yes -f -N -L 8002:127.0.0.1:8000 jenkins@mac03.ls.lsst.org
ssh -o ExitOnForwardFailure=yes -f -N -L 8003:127.0.0.1:8000 jenkins@mac04.ls.lsst.org
ssh -o ExitOnForwardFailure=yes -f -N -L 8004:127.0.0.1:8000 jenkins@mac05.ls.lsst.org
ssh -o ExitOnForwardFailure=yes -f -N -L 8005:127.0.0.1:8000 jenkins@mac06.ls.lsst.org
while true
do
  curl -sf -o /dev/null http://localhost:8000 && echo "$(date -u) Success, connected to mini1"|| echo "$(date -u) Error Unable to connect to mini1"
  curl -sf -o /dev/null http://localhost:8001 && echo "$(date -u) Success, connected to mini2"|| echo "$(date -u) Error Unable to connect to mini2"
  curl -sf -o /dev/null http://localhost:8002 && echo "$(date -u) Success, connected to mini3"|| echo "$(date -u) Error Unable to connect to mini3"
  curl -sf -o /dev/null http://localhost:8003 && echo "$(date -u) Success, connected to mini4"|| echo "$(date -u) Error Unable to connect to mini4"
  curl -sf -o /dev/null http://localhost:8004 && echo "$(date -u) Success, connected to mini5"|| echo "$(date -u) Error Unable to connect to mini5"
  curl -sf -o /dev/null http://localhost:8005 && echo "$(date -u) Success, connected to mini6"|| echo "$(date -u) Error Unable to connect to mini6"
  sleep 2
done
) 2>&1 | tee client.log
