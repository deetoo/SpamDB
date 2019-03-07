#!/bin/bash

# import the database schema.
#
# replace with your mysql credentials.
mysql -uUSERNAME -pPASSWORD < spam.sql

# setup DB connection details.
DBNAME="SpamDB"
DBUSER="SpamUser"
DBPASS="SpamPass"
ENTRIES=500

# read names from files, generate random first and last names.
FFILE='firstnames.txt'
LFILE='lastnames.txt'

# initialize the counter
i=1

# loop x ENTRIES times, populating the DB.
while [ "$i" -le "$ENTRIES" ]; do
		let "n=${RANDOM}%$(wc -l < $FFILE)"
		let "n=${RANDOM}%$(wc -l < $LFILE)"
		FIRST=`head -n $n $FFILE | tail -1`
		LAST=`head -n $n $LFILE | tail -1`
mysql -u$DBUSER -p$DBPASS $DBNAME -e "INSERT INTO SpamTable (id, FirstName, LastName) VALUES('$i','$FIRST', '$LAST');"
# DEBUG output
#	echo "Values: DB Name: $DBNAME - DB User: $DBUSER - DB Password: $DBPASS - SPAM: $FIRST $LAST"
	i=$(($i + 1))
done
