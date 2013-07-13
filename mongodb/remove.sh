service mongod stop
chkconfig mongod off
yum -y remove mongo-10gen mongo-10gen-server
rm /etc/yum.repos.d/10gen.repo