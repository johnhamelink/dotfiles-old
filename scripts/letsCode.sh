#!/bin/sh

# ANSI Color -- use these variables to easily have different color
#    and format output. Make sure to output the reset sequence after
#    colors (f = foreground, b = background), and use the 'off'
#    feature for anything you turn on.

initializeANSI()
{
  esc=""

  blackf="${esc}[30m";   redf="${esc}[31m";    greenf="${esc}[32m"
  yellowf="${esc}[33m"   bluef="${esc}[34m";   purplef="${esc}[35m"
  cyanf="${esc}[36m";    whitef="${esc}[37m"

  blackb="${esc}[40m";   redb="${esc}[41m";    greenb="${esc}[42m"
  yellowb="${esc}[43m"   blueb="${esc}[44m";   purpleb="${esc}[45m"
  cyanb="${esc}[46m";    whiteb="${esc}[47m"

  boldon="${esc}[1m";    boldoff="${esc}[22m"
  italicson="${esc}[3m"; italicsoff="${esc}[23m"
  ulon="${esc}[4m";      uloff="${esc}[24m"
  invon="${esc}[7m";     invoff="${esc}[27m"

  reset="${esc}[0m"
}

# note in this first use that switching colors doesn't require a reset
# first - the new color overrides the old one.

initializeANSI

cat << EOF
${blackbg}${whitefg}


${bluef}88                                       ${greenf}   ,ad8888ba,                       88
${bluef}88                      ,d               ${greenf}  d8"'    \`"8b                      88
${bluef}88                      88               ${greenf} d8'                                88
${bluef}88          ,adPPYba, MM88MMM ,adPPYba,  ${greenf} 88             ,adPPYba,   ,adPPYb,88  ,adPPYba,
${bluef}88         a8P_____88   88    I8[    ""  ${greenf} 88            a8"     "8a a8"    \`Y88 a8P_____88
${bluef}88         8PP"""""""   88     \`"Y8ba,  ${greenf}  Y8,           8b       d8 8b       88 8PP"""""""
${bluef}88         "8b,   ,aa   88,   aa    ]8I  ${greenf}  Y8a.    .a8P "8a,   ,a8" "8a,   ,d88 "8b,   ,aa ${cyanf}888
${bluef}88888888888 \`"Ybbd8"'   "Y888 \`"YbbdP"'${greenf}     \`"Y8888Y"'   \`"YbbdP"'   \`"8bbdP"Y8  \`"Ybbd8"' ${cyanf}888


${reset}
EOF
