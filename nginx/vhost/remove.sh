
if [ $# != 1 ]; then
	echo 'Usage: nginx/vhost/remove.sh <host>'
	echo
	echo 'Example: nginx/vhost/remove.sh *.damphat.com'
	echo 'Example: nginx/vhost/remove.sh damphat.com'
fi

CONFIG_FILE=${1//\*/_}.conf

rm -f /etc/nginx/sites-available/$CONFIG_FILE
rm -f /etc/nginx/conf.d/$CONFIG_FILE

nginx -s reload
