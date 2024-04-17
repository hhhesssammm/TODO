#! /bin/bash
#$1 is command
if [ $1="add" ]
then
	ti=""
	pi=""
	case $2 in
	-t | --title ) 
		ti=$3
 	;;	
	-p | --priority)
		pri=$3
	;;
	esac
	
	case $4 in
	-t | --title ) 
		ti=$5
	;;	
	-p | --priority)
		pri=$5
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
fi
#make tasks.csv
#cat << EOF >> tasks.csv
#0,$priority,$title
#EOF
echo "0,$pri,\"$ti\"" >> tasks.csv
