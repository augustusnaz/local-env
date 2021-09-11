#!/bin/bash

helpFunc()
{
  echo ""
  echo -e "Usage: \t$0 <config-file-name> -k server.key -o server.crt -d 730"
  echo -e "\t-k Certificate key name. Defaults to <config-file-name>/server.key"
  echo -e "\t-o Certificate file name. Defaults to <config-file-name>/server.crt"
  echo -e "\t-d Validity days"
  exit 1 # Exit script
}

if [ -z "$1" ]
  then
    echo "No arguments provided"
    exit 1
fi

config=$1
shift

if [ "$config" == "help" ]
  then
    helpFunc
    exit 0
fi

while getopts "k:o:d:" opt
do
  case "$opt" in
    k ) keyout="$OPTARG" ;;
    o ) out="$OPTARG" ;;
    d ) days="$OPTARG" ;;
    ? ) helpFunc ;;
  esac
done

# set defaults
keyout=${keyout:-"$config/server.key"}
out=${out:-"$config/server.crt"}
days="${days:-730}"

# Ensure folders exist
mkdir -p $(dirname $keyout)
mkdir -p $(dirname $out)

openssl req -x509 -nodes -days $days -newkey rsa:2048 -keyout $keyout -out $out -config $config.conf -sha256
# openssl req -x509 -nodes -days 730 -newkey rsa:2048 -keyout server.key -out server.crt -config crt.conf -sha256
