#!/usr/bin/env bash
set -x
trap read debug

if [ $# != 3 ]; then
	echo 'Usage: ./add-node-site.sh  <GITHUB_REPO>  <SERVER_NAME>   <PROXY_PORT>'
	echo 
	echo '       ./add-node-site.sh  damphat        *.damphat.com   3000' 
	echo '       ./add-node-site.sh  nodesnips      *.nodesnips.com 3001'
	exit 1
fi

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) 

GITHUB_REPO=$1
SERVER_NAME=$2
PROXY_PORT=$3

rm -rf /myprojects/$GITHUB_REPO
git clone git@github.com:damphat/$GITHUB_REPO.git /myprojects/$GITHUB_REPO || exit 1

cd /myprojects/$GITHUB_REPO || exit 1 
npm install

$DIR/../upstart/add-node.sh $GITHUB_REPO $PROXY_PORT || exit 1
$DIR/../nginx/vhost/add-proxy.sh $SERVER_NAME $PROXY_PORT || exit 1

nginx -s reload
start $GITHUB_REPO

