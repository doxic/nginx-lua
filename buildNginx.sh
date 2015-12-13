#!/bin/bash

##
## Build Nginx with Lua
##

set -e
start_dir=`pwd`
function finish {
  # Cleanup
  cd $start_dir
}
trap finish EXIT

# VARS
openresty_url=https://openresty.org/download/ngx_openresty-1.9.3.2.tar.gz

# Prereq
sudo apt-get update
sudo apt-get install -y curl libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl make build-essential

# Get Sources
curl $openresty_url | tar xvz
cd ngx_openresty-*

# Build
./configure
make
sudo make install