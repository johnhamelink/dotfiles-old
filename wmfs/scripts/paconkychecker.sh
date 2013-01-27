log="/tmp/paconkystatus"
if [ -f "$log" ]
then
	if [ -s "$log" ]
	then
		log=$(tail -1 $log)
		echo "^s[right;\#bbbbbb;:: ]^i[right;0;0;/home/john/.config/wmfs/icons/pacman.png]^s[right;\#bbbbbb; $log]"
	fi
fi
