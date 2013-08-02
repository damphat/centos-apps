get() {
	STR="$1"
	VAR="$2"
	
	RET=${STR%%#*}
	RET=${RET%%;}
	RET=${RET##*$VAR }
	echo $RET	
}


printf "%-30s %-30s %-30s\n" "FILE" "SERVER_NAME" "PROXY_PASS"
echo -------------------------------------------------------------------------------------
for i in /etc/nginx/conf.d/* 
do
	FILE=$(basename $i)
	SERVER=$(cat $i | grep server_name)
	PROXY=$(cat $i | grep proxy_pass)
	printf "%-30s %-30s %-30s\n" "${FILE}" $(get "$SERVER" server_name) $(get "$PROXY" proxy_pass)
done

