#!/bin/sh
 
# Load configuration options
. ./config

# Set AutoSSH parameters
export AUTOSSH_PATH=/usr/bin/ssh
export AUTOSSH_GATETIME=0
export AUTOSSH_DEBUG=1

autossh -M 0 -o ExitOnForwardFailure=yes -o ConnectTimeout=60 -o ServerAliveInterval=60 -o ServerAliveCountMax=3 -o TCPKeepAlive=yes -o StrictHostKeyChecking=yes -o UserKnownHostsFile="$KNOWN_HOSTS" -p "$PORT" -N -R 0:localhost:22 -i "$PRIV_KEY" -v "$USER"@"$REMOTE"
