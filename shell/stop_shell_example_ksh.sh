#!/bin/ksh

PROC_NAME=fbrecv_f

wait_stop() {
  echo "Wait for stop process : $1"

  for (( c=1; c<=20; c++ ))
  do
     echo "Check process stopped $c times"
     pid=`ps -ef|grep -v grep|grep $PROC_NAME|awk '{print $2}'`

     if [ -z $pid ]
     then
       echo "Stopped process $PROC_NAME"
       break
     else
       echo "Not yet stopped !!!"
       kill $pid
       sleep 3
     fi
  done
}

# ---- Wait for stop process  ----
wait_stop

echo "Try start $PROC_NAME "

# execute start shell script ..