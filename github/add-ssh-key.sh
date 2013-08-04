if [ $# != 2 ]; then
	echo $#
	echo './add-ssh-key.sh dell-pc "$(~/.ssh/id_rsa.pub)"'
	exit 1
fi

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
$DIR/login.sh

echo ---------
echo $1
echo --------
echo $2
echo --------

curl  -H "Authorization: token $(cat ~/github.token)" -d "{\"title\":\"$1\", \"key\":\"$2\"}" https://api.github.com/user/keys

