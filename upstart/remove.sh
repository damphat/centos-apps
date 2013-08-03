if [ $# != 1 ]; then
	echo 'Example: ./remove.sh  damphat'
fi

stop $1
rm -f /etc/init/$1.conf

