#!/bin/bash

git_push() {
	git add -f percentage.txt
	git commit -m "YearProgressBot: logfile: Current Percentage: ${PERCENTAGE}%"
	echo ${GIT_NAME_AND_REPONAME}
	git remote -v
	git push --quiet -f https://${GITHUB_USERNAME}:${GIT_TOKEN}@github.com/${GIT_NAME_AND_REPONAME}
}

get_percentage() {
        source config.txt
	CURRENT_YEAR=$(date +%Y)
	if [ $((CURRENT_YEAR % 400)) -eq 0 ]; then
		TOTAL_DAYS=366
	elif [ $((CURRENT_YEAR % 100)) -eq 0 ]; then
		TOTAL_DAYS=365
	elif [ $((CURRENT_YEAR % 4)) -eq 0 ]; then
		TOTAL_DAYS=366
	else
		TOTAL_DAYS=365
	fi
	CURRENT_DAY=$(echo "$(date +%j) + 0" | bc)
	echo $((CURRENT_DAY*100/TOTAL_DAYS))
}

display() {
	PERCENTAGE=$(get_percentage)
	if [ -f "percentage.txt" ]; then echo "percentage.txt present!" ; else echo "percentage.txt not found, generating it!" && touch percentage.txt ; fi
	if [ "${LENGTH}" = "" ]; then LENGTH=20 ; fi
	FILLED=$((LENGTH*PERCENTAGE/100));
	BLANK=$((LENGTH-FILLED))
	for ((i=0;i<FILLED;i++)) {
		BAR="${BAR}▓"
	}
	for ((i=0;i<BLANK;i++)) {
		BAR="${BAR}░"
	}
	BAR_TEXT_PERCENTAGE="Year Progress: ${BAR} ${PERCENTAGE}%"
}

telegram_message() {
        source config.txt
	echo ${CHAT_IDS}
	echo "Sending Telegram Message"
	echo "Current Percentage Is: ${BAR_TEXT_PERCENTAGE}"
	for CHAT_ID in ${CHAT_IDS}
	do
	   for TG_TOKEN_INDIVIDUAL in ${TG_TOKEN}
	   echo "Chat ID is: ${CHAT_ID}"
	   curl -X POST "https://api.telegram.org/bot${TG_TOKEN_INDIVIDUAL}/sendMessage" -d "chat_id=${CHAT_ID}&text=${BAR_TEXT_PERCENTAGE}"
	   done
	done
}

main() {
	#BAR_NOW=$(display)
	echo "Bot started."
	#echo $BAR_NOW
	echo $PERCENTAGE
	if [[ "$(tail -1 percentage.txt)" = "" ]] || [[ "$(tail -1 percentage.txt)" -lt "${PERCENTAGE}" ]]; then
		echo ${PERCENTAGE} >> percentage.txt
		git_push && telegram_message
	elif [[ "$(tail -1 percentage.txt)" -ge "99" ]] && [[ "${PERCENTAGE}" -le "1" ]]; then
		echo ${PERCENTAGE} >> percentage.txt
		git_push && telegram_message
	elif [[ "$(tail -1 percentage.txt)" = "${PERCENTAGE}" ]]; then
		echo "Percentage Same, Exiting...."
		exit 0
	else echo bruh
	fi
	telegram_message
}
display
main
