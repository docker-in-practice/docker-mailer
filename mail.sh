#!/bin/bash

ROOT="${EMAIL}"
MESSAGE="${MESSAGE}"
SUBJECT="${SUBJECT}"
TO="${TO}"
AUTHUSER="${AUTHUSER:-$EMAIL}"
MAILHUB="${MAILHUB:-smtp.gmail.com:587}"
USESTARTTLS="${USESTARTTLS:-YES}"
AUTHPASS="${AUTHPASS}"

if [[ $EMAIL = '' ]] || [[ $MESSAGE = '' ]] || [[ $TO = '' ]]
then
	echo 'usage: docker run -e EMAIL=<email address> -e AUTHPASS=<password> -e MESSAGE=<message> -e TO=<email to> [-e AUTHUSER=[$EMAIL]] [-e MAILHUB=[smtp.gmail.com:587]] [-e USESTARTTLS=[YES]] dockerinpractice/docker-mailer'
	exit 1
fi

cat > /etc/ssmtp/ssmtp.conf << EOF
mailhub=${MAILHUB}
UseSTARTTLS=${USESTARTTLS}
AuthUser=${AUTHUSER}
AuthPass=${AUTHPASS}
EOF

echo "$SUBJECT" | mail -s "$MESSAGE" -t "$TO"
