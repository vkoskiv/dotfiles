#!/bin/bash
#
# Trivial dynamic DNS logger by @vkoskiv
# Stick it a crontab. This runs it hourly:
# 0 * * * * /path/to/dns.sh user@server
#

SSH_TARGET="$1"
if [ -z "$SSH_TARGET" ]; then
	echo "usage: $0 ssh_user@ssh_host"
	exit 1
fi
server_log () {
	echo "$1" | ssh "$SSH_TARGET" "cat | ts '%Y-%m-%dT%H:%M:%S%z' >> ~/$(hostname)_ip" 
}
IP_FILE="/tmp/public_ip"
CUR_IP=$(curl -s https://ipinfo.io/ip || curl -s https://ifconfig.me)
if [ -z "$CUR_IP" ]; then
	server_log "Failed to get ip, probably do something about that"
  exit 1
elif [[ ! "$CUR_IP" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
	server_log "'$CUR_IP' is not a valid-looking IPv4?"
	exit 1
fi

LAST_IP="$(cat $IP_FILE 2>/dev/null)"
if [ -z "$LAST_IP" ]; then
	echo "$CUR_IP" > $IP_FILE
	server_log "Booted -> $CUR_IP"
elif [ "$CUR_IP" != "$LAST_IP" ]; then
	echo "$CUR_IP" > $IP_FILE
	server_log "IPv4 changed $LAST_IP -> $CUR_IP"
fi
