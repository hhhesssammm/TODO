#! /bin/bash
function Add {
	tit=""
	pri=""
	case $1 in
	-t | --title ) 
		ti=$2
 	;;	
	-p | --priority)
		pri=$2
	;;
	esac
	
	case $3 in
	-t | --title ) 
		ti=$4
	;;	
	-p | --priority)
		pri=$4
	;;
	esac
	
	if [ -z "$ti" ]
	then
		echo "Option -t|--title Needs a Parameter"
		exit 1
	fi
	
	if [ -z "$pri" ]
	then
		pri=L
	fi
	
	if [  $pri != "L" ] && [ $pri != "H" ] && [ $pri != "M" ]
	then
		echo "Option -p|--priority Only Accept L|M|H"
		exit 1
	fi
	
	echo "0,$pri,\"$ti\"" >> tasks.csv	
}
case $1 in
	add)
	Add "$2" "$3" "$4" "$5"
	exit 1
	;; 
	"clear")
	truncate -s 0 tasks.csv
	exit 1
	;;
	"list")
	awk -F\, '{print NR" | "$1" | "$2" | "$3}' tasks.csv
	exit 1
	;;
	*)
	echo "Command Not Supported!"
	exit 1
esac
