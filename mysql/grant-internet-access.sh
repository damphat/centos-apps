echo
echo == MAKE MYSQL ACCESSIBLE FROM INTERNET ==
echo Set new password for internet user
read -p ">New password:" -s pass
echo
read -p ">Again       :" -s pass_again
echo 

[ $pass = $pass_again ] || (echo "password mismatch!" && exit 1);

# --force allow sql script continue if there are no root@% is found
mysql --force <<EOF
DROP USER 'root'@'%';
CREATE USER 'root'@'%' IDENTIFIED BY '$pass';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
EOF

echo "OK, GRANTED! try following cmd on you remote host:"
echo C:\>mysql -hdamphat.com -uroot -p
