#!/bin/bash

#a change

ROOT=${EMAIL}
MESSAGE=${MESSAGE}
SUBJECT=${SUBJECT}
TO=${TO}
AUTHUSER=${AUTHUSER:-$EMAIL}
MAILHUB=${MAILHUB:-smtp.gmail.com:587}
REWRITEDOMAIN=${REWRITEDOMAIN}
HOSTNAME=${HOSTNAME:-smtp.gmail.com:587}
USESTARTTLS=${USESTARTTLS:-YES}
USETLS=${USETLS:-YES}
AUTHPASS=${AUTHPASS}
AUTHMETHOD=${AUTHMETHOD:-LOGIN}
FROMLINEOVERRIDE=${FROMLINEOVERRIDE:-YES}

if [[ $EMAIL = '' ]] || [[ $MESSAGE = '' ]] || [[ $TO = '' ]]
then
	echo 'usage: docker run -e EMAIL=<email address> -e AUTHPASS=<password> -e MESSAGE=<message> -e TO=<email to> [-e AUTHUSER=[$EMAIL]] [-e MAILHUB=[smtp.gmail.com:587]] [-e HOSTNAME=[smtp.gmail.com:587]] [-e USESTARTTLS=[YES]] [-e USETLS=[YES]] [-e AUTHMETHOD=[LOGIN]] [-e FROMLINEOVERRIDE=[YES]] -e [-e REWRITEDOMAIN=[]] dockerinpractice/docker-mailer'
	exit 1
fi

cat > /etc/ssmtp/ssmtp.conf << EOF
root=${EMAIL}
mailhub=${MAILHUB}
rewriteDomain=${REWRITEDOMAIN}
hostname=${HOSTNAME}
UseSTARTTLS=${USESTARTTLS}
UseTLS=${USETLS}
AuthUser=${AUTHUSER}
AuthPass=${AUTHPASS}
AuthMethod=${AUTHMETHOD}
FromLineOverride=${FROMLINEOVERRIDE}
EOF

echo "$SUBJECT" | mail -s "$MESSAGE" -t "$TO"
