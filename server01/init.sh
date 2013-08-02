DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

"$DIR/../ssh/init.sh"
"$DIR/../nginx/install.sh"
"#DIR/../nginx/add-vhost-proxy.sh" damphat.com 3000
"$DIR/../nodejs/install.sh"


#PULL damphat.com from GITHUB
test -d /myprojects || mkdir /myprojects		#make sure /myprojects exists
mkdir /myprojects/damphat.com
git clone git@github.com:damphat/damphat.git /myprojects/damphat.com
$(cd /myprojects/damphat.com && npm install)

#upstart script( we also use supervisor in upstart script )
npm install -g supervisor
cp -rf $DIR/etc /
start damphat.com


