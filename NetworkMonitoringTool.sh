#!/bin/bash
#Wriiten by Abhishek Singh

#Defining Variables for Colors
RED='\033[1;34m'
YEL='\033[0;33m'
BLUE='\033[0;36m'
NC='\033[0m' # No Color

clear
#Figlet Tool for Banner
figlet "Network Monitoring Tool"

#Welcome Text
echo -e ""
echo -e "	<<<<<Welcome to ${YEL}Network Monitoring Tool${NC} Project>>>>>"
echo -e ""
echo -e "This project is made by${BLUE}Abhishek Singh(15BCE1009)${NC}"
echo -e ""

#Function to show choices.
function Information {
	echo -e "Please choose an option from the choices given below: "
	echo -e "     	  1. Bandwidth Analysis (Singular Data)"
	echo -e "     	  2. Bandwidth Analysis (Graph)"
	echo -e "     	  3. CPU-MEM Usage Analysis (Graph)"
	echo -e "     	  4. Packet Loss and Jitter Analysis"
	echo -e "     	  5. Connected Nodes"
	echo -e "     	  6. Public/Private IP"
	echo -e "     	  7. Exit"
}


#Variables Declaration

condition=true

#Main While loop
while $condition
do
	echo ""
	Information
	echo ""
	printf "Please provide your choice: "
	read choice
	
	case $choice in
		1)
			echo -e ""			
			echo -e "You've choosen ${YEL}Network Bandwidth Analysis${NC}. Go on - "
			printf "Please mention Upload(UP)/Download(DL)/TotalUpload(TU)/TotalDownload(TD): "
			read choice2
			echo -e ""
			case $choice2 in
				UP)
					chmod +x /root/Networks/Codes/BANDWIDTH\ Graphs/status.sh
					printf "${YEL}The upload statistic:${NC} "
					/root/Networks/Codes/BANDWIDTH\ Graphs/status.sh up wlan0 HUMAN
					echo -e ""
					;;
				DL)
					chmod +x /root/Networks/Codes/BANDWIDTH\ Graphs/status.sh
					printf "${YEL}The download statistic:${NC} "
					/root/Networks/Codes/BANDWIDTH\ Graphs/status.sh down wlan0 HUMAN
					echo -e ""
					;;
				TU)
					chmod +x /root/Networks/Codes/BANDWIDTH\ Graphs/status.sh
					printf "${YEL}The total upload statistic:${NC} "
					/root/Networks/Codes/BANDWIDTH\ Graphs/status.sh total-up wlan0 HUMAN
					echo -e ""
					;;
				TD)
					chmod +x /root/Networks/Codes/BANDWIDTH\ Graphs/status.sh
					printf "${YEL}The total download statistic:${NC} "
					/root/Networks/Codes/BANDWIDTH\ Graphs/status.sh total-down wlan0 HUMAN
					echo -e ""
					;;
			esac
			;;
		2)
			echo -e ""
			echo -e "You've choosen ${YEL}Network Bandwidth Graphs${NC}. Go on - "
			/root/Networks/Codes/NETWORKS\ Graphs/nbwmon	
			;;
		3)
			echo -e ""
			echo -e "You've choosen ${YEL}CPU Usage Analysis${NC}. Go on - "
			ttysys -mh	
			;;
		4)
			echo -e ""
			echo -e "You've choosen ${YEL}Packet Loss and Jitter Analysis${NC}. Go on - "
			guake -n --execute-command="iperf -c 192.168.43.46 -u"
			iperf -su -i 1 | awk '{ print $10 "  " $11 "  " $12$13$14$15}'
			echo -e ""
			;;

		5)
			echo -e ""
			echo -e "${YEL}Connected nodes${NC} are. Go on - "
			python /root/Networks/Codes/Check\ Nodes/CheckNodes.py
			;;
		6)
			echo -e ""
			echo -e "You've choosen ${YEL}Public/Private IP${NC}. Go on - "
			echo -e ""
			myprivateip="$(hostname -I)"
			printf "${BLUE}My Private IP address:${NC} ${myprivateip}"
			echo ""
			mypublicip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
			printf "${BLUE}My Public IP address:${NC} ${mypublicip}"	
			;;
		7)
			echo -e ""				
			echo -e "${RED}GOODBYE!!! Thanks for using this program :P${NC}"
			echo -e ""
			figlet "GOODBYE"
			exit
	esac
	sleep 2
	clear
	#Figlet Tool for Banner
	figlet "Network Monitoring Tool"	
	echo -e "---------------------------------------------------------"
	echo -e "---------------------------------------------------------"
	echo -e "${BLUE}Here we go again! Choose again :)${NC}"
done
