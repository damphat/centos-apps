#get directory of this file
DIR=$(cd "$(dirname "$BASH_SOURCE")" && pwd)

#add yum repo
cp $DIR/nginx.repo /etc/yum.repos.d/

#install nginx
yum -y install nginx

#turn off httpd
chkconfig httpd off
service httpd stop

#turn on nginx
chkconfig nginx on
service nginx start
