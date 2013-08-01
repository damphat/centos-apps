if [ $# != 1 ]; then
	echo 'Usage: github/create.sh <REPO>'
	echo
	echo 'Example: github/create.sh damphat.com'
fi

curl -u 'damphat' https://api.github.com/user/repos -d "{\"name\":\"$1\"}"
