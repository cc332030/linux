#!/bin/sh

set -e

parameter=$*

curl_sh(){
  sh -c "curl -sL $1 | sh -s -- $parameter"
}
