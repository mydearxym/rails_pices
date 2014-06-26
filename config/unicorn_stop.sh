#! /bin/sh

echo $1
echo "get unicorn pid"
if [ -f $1/current/tmp/pids/unicorn.pid ] ;then 
  echo "found unicorn.pid"
  u_pid=`ls $1/current/tmp/pids/unicorn.pid`
  echo "kill unicorn"
  kill -9 `cat $u_pid` 
else 
  echo "unicorn.pid not found"
fi
