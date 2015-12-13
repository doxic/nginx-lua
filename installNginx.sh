#!/bin/bash
. /path/to/function.sh
##
## Install Nginx with Lua
##

set -e
start_dir=`pwd`
function finish {
  # Cleanup code
  cd $start_dir
}
trap finish EXIT

## VARS ##
# http://openresty.org/#Download
openresty_url=https://openresty.org/download/ngx_openresty-1.9.3.2.tar.gz

## Req
sudo apt-get update
sudo apt-get install -y curl libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl make build-essential

## OpenResty ##
# http://openresty.org/#Download
curl $openresty_url | tar xvz

cd ngx_openresty-*

./configure
make
make install