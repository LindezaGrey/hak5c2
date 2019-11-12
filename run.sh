#!/bin/bash

IPv4ADDRESS=$(hostname -I | cut -f1 -d' ')
hostname=$(hostname -f)
echo "Your Local IP Address is $IPv$IPv4ADDRESS"
echo "using hostname set by env."
/app/c2_community-linux-64 -hostname $hostname -db $dbpath -reverseProxy -reverseProxyPort 443 -https