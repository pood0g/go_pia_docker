#!/bin/bash

## FUNCTIONS ##
cur_date () {
     date +'%Y/%m/%d %H:%M:%S' 
     }

host_ip=$(hostname -i)

# listen for transmission only on docker interface prevent port open in PIA
echo -e "`cur_date` \033[32mINFO:\033[0m Starting stunnel"
sed -i -E "s/^accept.+/accept = $host_ip:9091/" /etc/stunnel/stunnel.conf
su -s /bin/ash -c stunnel

echo -e "`cur_date` \033[32mINFO:\033[0m Starting go_pia"
/app/go_pia