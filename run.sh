#!/bin/ash

hostname=$(hostname -f)
echo "using hostname set by env."
/app/c2_community-linux-64 -hostname $hostname -db $dbpath -reverseProxy -reverseProxyPort 443 -https