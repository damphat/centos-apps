printf "%-30s%-30s%-30s\n" DOMAIN FILENAME PORT
echo -----------------------------------------------------------------	


for i in /etc/init/*; do
	PORT=$(cat $i | grep "export PORT")
	if [ "$PORT" != "" ]; then
		DOMAIN=$(basename "$i")
		DOMAIN=${DOMAIN%%.conf}
		DOMAIN=${DOMAIN//_/\*}
		
		printf "%-30s%-30s%-30s\n" $DOMAIN $(basename "$i") "${PORT##*PORT=}"	
	fi
done
