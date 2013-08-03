printf "%-30s%-30s\n" FILENAME PORT
echo --------------------------------------------	


for i in /etc/init/*; do
	PORT=$(cat $i | grep "export PORT")
	if [ "$PORT" != "" ]; then
		printf "%-30s%-30s\n" $(basename "$i") "${PORT##*PORT=}"	
	fi
done
