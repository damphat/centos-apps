if [ $# != 1 ]; then
	echo 'Usage: github/create.sh <REPO>'
	echo
	echo 'Example: github/create.sh damphat.com'
fi

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
$DIR/login.sh

curl -H "Authorization: bearer $(cat ~/github.token)"  https://api.github.com/user/repos -d "{\"name\": \"$1\"}"
