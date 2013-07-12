#turn off nginx
service nginx stop
chkconfig nginx off

#turn on httpd
service httpd start
chkconfig httpd on

#remove nginx and repo
yum -y remove nginx
rm /etc/yum.repos.d/nginx.repo

