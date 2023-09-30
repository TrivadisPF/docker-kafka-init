#!/bin/sh

if [ -n "$KAFKA_USERS" ]; then
	kafka_users=$(echo $KAFKA_USERS | tr "," "\n")

	for kafka_user in $kafka_users
	do
    	echo "creating [$kafka_user]"
	done
fi