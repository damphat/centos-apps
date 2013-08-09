USER=$(cat ~/github.user)
TOKEN=$(cat ~/github.token)
REPO=$1

curl -X DELETE -H "Authorization: bearer $TOKEN" https://api.github.com/repos/$USER/$REPO
