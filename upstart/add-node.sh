if [ $# != 2 ]; then
	echo 'Usage:   ./add-node.sh  <PROJECT_NAME> <PORT>'
	echo
	echo 'Example: ./add-node.sh  damphat        3000'
	exit 1
fi

PROJECT_NAME=${1//\*/_}
PORT=$2

if [ ! -f /myprojects/$PROJECT_NAME/app.js ]; then
	echo "/myprojects/$PROJECT_NAME/app.js not exist"
	exit 2
fi

$(cd /myprojects/$PROJECT_NAME && npm install)
which supervisor || npm install -g supervisor

#TODO generate upstart script at /etc/init/$PROJECT_NAME

cat > /etc/init/$PROJECT_NAME.conf <<_EOF_ 
#!upstart
description "expressjs project=$PROJECT_NAME port=$PORT"
author      "by centos-apps/upstart/add-node.sh"

start on startup
stop on shutdown

script
        cd /myprojects/$PROJECT_NAME
        export PORT=$PORT
	export NODE_ENV=production
	supervisor -w -- app.js # "-w" disable watch because of server high load
end script
_EOF_

stop  $PROJECT_NAME
start $PROJECT_NAME
