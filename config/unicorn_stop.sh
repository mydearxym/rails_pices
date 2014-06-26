#! /bin/sh


echo $1
pid_file=$1
echo "get unicorn pid: # " $pid_file
if [ -f $pid_file ] ;then
  echo "found $pid_file"
  u_pid=`cat $pid_file`
  echo "u_pid: $u_pid"
  {
    echo "kill unicorn"
    kill -9 $u_pid
  } || {
    echo "cat't kill unicorn anyway"
  }
else
  echo "unicorn.pid not found"
fi
