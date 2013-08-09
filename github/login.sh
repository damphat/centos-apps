USER=$1

[ "$USER" != "" ]     && echo $USER > ~/github.user
[ -f ~/github.user ]  || touch ~/github.user
[ "$USER" == "" ]     && USER=$(cat ~/github.user)
[ "$USER" == "" ]     && read -p "Github User:" USER
[ "$USER" != "" ]     && echo $USER > ~/github.user
[ -f ~/github.token ] && TOKEN=$(cat ~/github.token)

[ "$TOKEN" != "" ]    && TRY=$(curl -H "Authorization: bearer $(cat ~/github.token)" -s https://api.github.com/user | grep '"login"')

# FIXME this should be case insensitive

if ! [[ "$TRY" =~ "\"$USER\"" ]]; then

	TOKEN=$(curl -s -u "$USER" -d '{"scope":["user", "repo", "delete_repo"], "note":"centos-aaps"}' https://api.github.com/authorizations | grep \"token\")
	TOKEN=$(expr "$TOKEN" : '.*"token" *: *"\([0-9a-z]*\)"')

	echo $TOKEN > ~/github.token

	[[ "$TOKEN" == "" ]] && { echo "Invalid username or password"; exit 1;} || { echo Github account: $USER; }
fi
