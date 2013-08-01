#[[ "$(ls)" =~ "exist" ]] && echo "OK"

if [[ "$(curl https://api.github.com/repos/damphat/$1 | grep Found)" =~ "Not Found" ]]; then
	echo "Not found"
	exit 1
else
	echo "Found"
	exit 0
fi
