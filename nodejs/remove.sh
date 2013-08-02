#remove all global node packages?


#remove npm nodejs
yum -y remove nodejs npm

rpm -e $(rpm -qa | grep ^remi-release)
rpm -e $(rpm -qa | grep ^epel-release)
