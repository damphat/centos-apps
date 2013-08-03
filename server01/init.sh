#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

"$DIR/../ssh/init.sh"
"$DIR/../nginx/install.sh"
"$DIR/../nodejs/install.sh"
"$DIR/../mongodb/install.sh"

#				GITHUB_REPO		SERVER_NAME		PROXY_PORT
#-----------------------------------------------------------------------------------------
"$DIR/add-node-site.sh"		damphat			*.damphat.com		3000
"$DIR/add-node-site.sh"		nodesnips		*.nodesnips.com		3001


