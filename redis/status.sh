SERVICE=redis
STATUS=$(service $SERVICE status)

if ! [[ "$(service redis status)" =~ "unrecognized" ]]; then
	echo         'Installed    : [YES]'
	
	if [[ "$STATUS" =~ "running" ]]; then
		echo 'Running      : [YES]'
	else
		echo 'Running      : [NO]'
	fi

	if [[ "$(chkconfig --list $SERVICE)" =~ "3:on" ]]; then
		echo 'Auto starting: [YES]'
	else
		echo 'Auto starting: [NO]'
	fi

else
	echo         'Installed    : [NO]'
fi
