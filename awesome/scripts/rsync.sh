log="/tmp/rsyncbackup"
if [ -f "$log" ]
then
	elipses=$RANDOM
	let "elipses %= 2"
	if [ "$elipses" -eq 1 ]
	then
		elipses="..."
	else
		elipses=".."
	fi
	echo "<span color='#DE5252'>Backing up$elipses</span>"
fi
