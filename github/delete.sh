USER=$(cat ~/github.user)
TOKEN=$(cat ~/github.token)
REPO=$1

echo ===========================================
echo 
echo WARNING !!!!! 
echo WARNING !!!!! 
echo WARNING !!!!! 
echo
echo You delete :  $USER/$REPO
echo
echo -n Sure? [y/N]
read ans

[[ "$ans" == "y" ]] || [[ "$ans" == "Y" ]] && curl -X DELETE -H "Authorization: bearer $TOKEN" https://api.github.com/repos/$USER/$REPO
