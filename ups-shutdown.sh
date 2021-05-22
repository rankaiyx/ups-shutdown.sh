#!/bin/bash

#config
network_card_name="enp2s0"

shutdown_command()
{
  #echo "shutdown start"
  shutdown now
}

send_message_to_all_user()
{
  wall -n "Warning! AC Power cut off time: "$1" < 120s   The system will shutdown!"
}

#program
AC_Power_cut_off_time=0
while true
do
  read net_online < /sys/class/net/$network_card_name/carrier
  if [ $net_online == "1" ]
  then
    AC_Power_cut_off_time=0
  else
    if [ $AC_Power_cut_off_time -lt 120 ]
    then
      send_message_to_all_user "$AC_Power_cut_off_time"
      echo $(date +"%Y-%m-%d %H:%M.%S")"   AC_Power_cut_off_time: "$AC_Power_cut_off_time" < 120s   The system will shutdown!" >> /root/ups-shutdown.sh/ups-shutdown.log
      AC_Power_cut_off_time=`expr $AC_Power_cut_off_time + 5`
    else
      echo $(date +"%Y-%m-%d %H:%M.%S")"   AC_Power_cut_off_time > 120s   shutdown start!" >> /root/ups-shutdown.sh/ups-shutdown.log
      shutdown_command
    fi
  fi
  sleep 5s
done
