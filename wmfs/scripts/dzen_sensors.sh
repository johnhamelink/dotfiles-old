
#!/bin/bash
#
# pop-up uname -a + uptime for dzen & wmfs2
# Original code by Robert Maneaq & arpinux
# (c) 2013 John Hamelink <john@johnhamelink.com>
 
# Define the number of monitors
NUMBEROFMONITORS=2

# Get the screen width of all monitors, divide by number of monitors
SCREENRESOLUTION=$((`xdpyinfo | grep dimensions | sed 's/.*://g' | sed 's/x.*//g' | sed 's/\s//g'` / NUMBEROFMONITORS))

# X coord of mouse
MOUSECOORDS=`xdotool getmouselocation | grep x | sed 's/.*x://g' | sed 's/y.*//g' | sed 's/\s//g'`

# Divide the X coord of the mouse by the screen resolution to get the currently used screen
ACTIVESCREEN=$(($MOUSECOORDS / $SCREENRESOLUTION + 1))

# Multiply the active screen by the resolution to get the last pixel of the current
# screen. Subtract from there, and it'll show up correctly on each monitor.
CURRENTSCREEN=$(($SCREENRESOLUTION*$ACTIVESCREEN))


# If dzen2 is running, kill it and exit.
# This gives us a toggle effect.
if [ "$(pidof dzen2)" ] 
then
	pkill dzen2;
else
	# Finally, run dzen2
	(sensors; sleep 60) | dzen2 -fn '-*-tamsyn-*-*-*-*-12-*-*-*-*-*-iso10646-*' -x $(($CURRENTSCREEN-$1)) -y 15 -h 15 -w 300 -l 35 -sa c -e 'onstart=uncollapse;button1=exit;button3=exit'
fi
