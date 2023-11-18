#!/bin/bash

echo "`cur_date` Starting stunnel"
su -s /bin/ash -c stunnel
echo "`cur_date` Starting go_pia"
/app/go_pia