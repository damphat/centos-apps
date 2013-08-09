if [ $# != 1 ]; then
	echo 'Example: ./remove.sh  damphat'
	exit 1
fi

NAME=${1//\*/_}
stop $NAME || exit 1
rm -f /etc/init/$NAME.conf

