#!/bin/bash
#
# Script to get the wan ip from belkin router
# It compares to previous ip address and if it has changed, it updates the wan ip at the
# freedns.afraid.org DNS
#
# Author: Guillermo Maldonado
# Date: 24/11/2014
# Raspberry pi / Raspbian Wheezy
#
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
DYNDNS=~/dyndns
wget http://192.168.2.1/status.stm -O $DYNDNS/status.html
new=`awk -F\" '{if ($1=="var wan_ip=") {print $2}}' < $DYNDNS/status.html`
if [ -a $DYNDNS/current_ip ]
then
   old=`cat $DYNDNS/current_ip`
else
   old="First time"
fi
#echo $new $old
if [ "$new" != "$old" ]
then
   echo "IP has changed to: $new"
   wget -O - http://freedns.afraid.org/dynamic/update.php?UmhISE9OaWRGSUNVTkRVQ1NkRktTVVVDOjEzMDE4OTUw >> $DYNDNS/freedns_maldonadoga_mooo_com.log
   echo $new > $DYNDNS/current_ip
fi
