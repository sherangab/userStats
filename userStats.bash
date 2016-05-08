#!/bin/bash
#File: userStats - how many processes does each user have
echo "content-type: text/html"
echo

echo "<html><head><title>Current User Stats</title></head>"
echo "<body>"
users=`who | cut -f1 -d' ' | sort -u`
echo "<h1>The current users are:<br></h1>"
echo "<table border=1><tr><th>Name</th><th>Humber ID</th> <th>Processes</th></tr>"

for someUser in $users
do
	nProcesses=`ps -u $someUser | wc -l`
	userName=`egrep "^$someUser" /etc/passwd | cut -f5 -d':'`
	echo "<tr><td>$userName</td><td>$someUser</td><td>$nProcesses</td></tr>"
done
echo "</table></body></html>"