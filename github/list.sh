#list all repositories

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
$DIR/login.sh

TEXT=$(curl -s -H "Authorization: bearer $(cat ~/github.token)" https://api.github.com/user/repos | grep "name")

echo "$TEXT" | while read line ; do
	NAME=$(expr "$line" : $'"name": "\(.*\)"')
	
	[  "$NAME" != "" ] && echo $NAME
done
