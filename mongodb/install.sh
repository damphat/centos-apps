#get directory of this file
DIR=$(cd "$(dirname "$BASH_SOURCE")" && pwd)

if [ $(arch) -eq 'x86_64' ]
then
	cp $DIR/10gen-64bits.repo /etc/yum.repos.d/10gen.repo  
else
	cp $DIR/10gen-32bits.repo /etc/yum.repos.d/10gen.repo  
fi
	
yum install mongo-10gen mongo-10gen-server

service mongod start
chkconfig mongod on

#display help