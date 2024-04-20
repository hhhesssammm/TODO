#! /bin/bash
TILTE=nothing
PRIORITY=L
TitleExists=No
if [ $1 = "add" ]
	then 
	shift

	while [ -n "$1" ]
	do
		case $1 in
		-t | --title)
			if [ -z $2 ];then
				echo "Option -t|--title Needs a Parameter"
				exit 1
			fi
			TITLE=$2
			TitleExists=Yes
			shift
			shift;;
		-p | --priority)
			if [ $2 = "L" ] || [ $2 = "M" ] || [ $2 = "H" ]
			then
				PRIORITY=$2
				shift
				shift
			else
				echo "Option -p|--priority Only Accept L|M|H"
				exit 1
			fi;;
			*)break;;
		esac
	done

	if [ $TitleExists = "No" ]
	then
		echo "wrong!"
		exit 1
	fi
	echo "0,$PRIORITY,\"$TITLE\"" >> tasks.csv
fi
	
