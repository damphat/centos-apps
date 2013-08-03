yum install php-gd php-mbstring php-mysql php-xml php-fpm -y
chkconfig php-fpm on
service php-fpm start
echo PHP-FPM CONFIGURATION:
echo /etc/php-fpm.conf 
echo /etc/php-fpm.d/www.conf
