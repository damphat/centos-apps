#get directory of this file
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

wget http://nginx.org/download/nginx-1.4.1.tar.gz
tar -xzf nginx-1.4.1.tar.gz
cd nginx-1.4.1
yum groupinstall "Development Tools"
./configurate



#turn off httpd
chkconfig httpd off
service httpd stop

#turn on nginx
chkconfig nginx on
service nginx start
