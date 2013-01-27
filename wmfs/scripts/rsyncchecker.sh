log="/tmp/rsyncbackup"
if [ -f "$log" ]
then
	spinner=$RANDOM
	let "spinner %= 2"
	if [ "$spinner" -eq 1 ]
	then
		spinner="togglewhite.png"
	else
		spinner="togglered.png"
	fi
	echo "^i[right;14;14;/home/john/.config/wmfs/icons/$spinner]^s[right;\#DE5252; Backing up]^s[right;\#bbbbbb; :: ]"
fi
