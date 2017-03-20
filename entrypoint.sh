#!/bin/sh
#chown -R named:named /var/cache/bind
#/usr/sbin/named -c /etc/bind/named.conf -g -u named


OPT_PARAMS='-c' 
OPT_PARAMS="$OPT_PARAMS /etc/bind/named.conf"
OPT_PARAMS="$OPT_PARAMS -g"
OPT_PARAMS="$OPT_PARAMS -u root"


disable_ipv6="${DISABLE_IPV6:-True}"

if [ "$disable_ipv6" == True ]; then
  OPT_PARAMS="$OPT_PARAMS -4"
fi

/usr/sbin/named "${OPT_PARAMS}"
