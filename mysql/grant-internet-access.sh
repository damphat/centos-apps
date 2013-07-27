echo
echo == MAKE MYSQL ACCESSIBLE FROM INTERNET ==
echo Set new password for internet user
read -p ">New password:" -s pass
echo
read -p ">Type again  :" -s pass_again
echo 

[ $pass = $pass_again ] || (echo "password mismatch!" && exit 1);

# --force allow sql script continue if there are no root@% is found
read -p "Password for mysql root account:" -s root_pass && echo

if [ "$root_pass" == "" ]
then
	root_pass_param=
else
	root_pass_param=-p$root_pass
fi


mysql --force $root_pass_param <<EOF
DROP USER 'root'@'%';
CREATE USER 'root'@'%' IDENTIFIED BY '$pass';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
EOF

echo "OK, GRANTED! try following cmd on you remote host:"
echo C:\>mysql -hdamphat.com -uroot -p
