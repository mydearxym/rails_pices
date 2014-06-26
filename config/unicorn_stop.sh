#! /bin/sh

echo $1
pid_file=$1
echo "get unicorn pid: # " $pid_file
if [ -f $pid_file ] ;then
  echo "found unicorn.pid"
  u_pid=`ls $pid_file`
  echo "kill unicorn"
  kill -9 `cat $u_pid`
else
  echo "unicorn.pid not found"
fi
