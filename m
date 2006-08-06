From: "Magnus Naeslund(k)" <mag@kite.se>
Date: Sun, 06 Aug 2006 17:09:01 +0000
Subject: Submitting patches, more automatic list creation
Message-Id: <44D6222D.5020802@kite.se>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Are patches welcome, or.. is this patch of any interest?
I'm trying to automate list creatation when mlmmj-make-ml.sh is used in
another script.
I've added some options to mlmmj-make-ml.sh to make it easier for us to
use it.
I'm also considering to add an alternate listdir :
/var/spool/mlmmj/$LISTNAME@$FQDN, would that be of interest to have in a
switch?

I'm pasting in this patch into thunderbird, I hope it doesn't get garbeled.

Regards,
Magnus

--- mlmmj-make-ml.sh.in.orig	2006-08-06 18:15:58.000000000 +0200
+++ mlmmj-make-ml.sh.in	2006-08-06 18:43:57.000000000 +0200
@@ -6,6 +6,7 @@
 VERSION="0.1"
 DEFAULTDIR="/var/spool/mlmmj"
 ALIASFILE=/etc/aliases
+TEXTPATHDEF="@textlibdir@"
 
 USAGE="mlmmj-make-ml "$VERSION"
 "$0" [OPTIONS]
@@ -14,10 +15,14 @@
 -L	the name of the mailinglist
 -s	your spool directory if not "$DEFAULTDIR"
 -a	create the needed entrys in your $ALIASFILE file
+-d	domain for the list
+-o	owner of the list
+-y	assume Yes and default options on most questions
+-t	text/language template directory (default: "$TEXTPATHDEF")
 -z	nuffn for now
 -c	chown the spool dir"
 
-while getopts ":hL:s:azc:" Option
+while getopts ":yhL:s:azc:d:s:o:s:t:s" Option
 do
 case "$Option" in 
 	h )
@@ -37,6 +42,18 @@
 	a )
 	A_CREATE="YES"
 	;;
+	d )
+	FQDN="$OPTARG"
+	;;
+	o )
+	OWNER="$OPTARG"
+	;;
+	t )
+	TEXTPATH="$OPTARG"
+	;;
+	y )
+	ALLYES="YES"
+	;;
 	c )
 	DO_CHOWN=1
 	CHOWN="$OPTARG"
@@ -59,7 +76,7 @@
 	echo -n "What should the name of the Mailinglist be? [mlmmj-test] : "
 	read LISTNAME
 	if [ -z "$LISTNAME" ]; then
-	LISTNAME="mlmmj-test"
+		LISTNAME="mlmmj-test"
 	fi
 fi
 
@@ -76,35 +93,54 @@
 
 test -f "$LISTDIR"/index || touch "$LISTDIR"/index
 
-echo -n "The Domain for the List? [] : "
-read FQDN
 if [ -z "$FQDN" ]; then
-	FQDN=`domainname -f`
+	if which domainname >/dev/null 2>&1 ; then
+		FQDN_SYSTEM=`domainname -f`
+	else
+		FQDN_SYSTEM=`dnsdomainname -f`
+	fi	
+	
+	echo -n "The Domain for the List? [$FQDN_SYSTEM] : "
+	[ -z "$ALLYES" ] && read FQDN
+	if [ -z "$FQDN" ]; then
+		FQDN="$FQDN_SYSTEM"
+	fi
 fi
 
-echo -n "The emailaddress of the list owner? [postmaster] : "
-read OWNER
 if [ -z "$OWNER" ]; then
-	OWNER="postmaster"
-fi
+	echo -n "The emailaddress of the list owner? [postmaster] : "
+	if [ -z "$ALLYES" ]; then
+		read OWNER
+	else
+		echo
+	fi
+	if [ -z "$OWNER" ]; then
+		OWNER="postmaster"
+	fi
+fi	
 echo "$OWNER" > "$LISTDIR"/"control/owner"
 
-TEXTPATHDEF=@textlibdir@
-echo -n "The path to texts for the list? [$TEXTPATHDEF] : "
-read TEXTPATHIN
-if [ -z "$TEXTPATHIN" ] ; then
-	TEXTPATH=$TEXTPATHDEF
-else
-	TEXTPATH=$TEXTPATHIN
-fi
-if [ ! -d "$TEXTPATH" ]; then
-	echo
-        echo "**NOTE** Could not copy the texts for the list"
-        echo "Please manually copy the files from the listtexts/ directory"
-        echo "in the source distribution of mlmmj."
-	sleep 2
-else
-        cp "$TEXTPATH"/* "$LISTDIR"/"text"
+if [ -z "$TEXTPATH" ] ; then
+	echo -n "The path to texts for the list? [$TEXTPATHDEF] : "
+	if [ -z "$ALLYES" ]; then
+		read TEXTPATHIN
+	else
+		echo
+	fi
+	if [ -z "$TEXTPATHIN" ] ; then
+		TEXTPATH=$TEXTPATHDEF
+	else
+		TEXTPATH=$TEXTPATHIN
+	fi
+	if [ ! -d "$TEXTPATH" ]; then
+		echo
+	        echo "**NOTE** Could not copy the texts for the list"
+	        echo "Please manually copy the files from the listtexts/ directory"
+	        echo "in the source distribution of mlmmj."
+		sleep 2
+	else
+	        cp "$TEXTPATH"/* "$LISTDIR"/"text"
+	fi
 fi
 
 LISTADDRESS="$LISTNAME@$FQDN"
@@ -120,15 +156,20 @@
 	MLMMJMAINTD="/path/to/mlmmj-maintd"
 fi
 
-ALIAS="$LISTNAME:  \"|$MLMMJRECIEVE -L $SPOOLDIR/$LISTNAME/\""
-CRONENTRY="0 */2 * * * \"$MLMMJMAINTD -F -L $SPOOLDIR/$LISTNAME/\""
+ALIAS="$LISTNAME:  \"|$MLMMJRECIEVE -L $LISTDIR/\""
+CRONENTRY="0 */2 * * * \"$MLMMJMAINTD -F -L $LISTDIR/\""
 
 if [ -n "$A_CREATE" ]; then
 	echo "I want to add the following to your $ALIASFILE file:"
 	echo "$ALIAS"
 
 	echo -n "is this ok? [y/N] : "
-	read OKIDOKI
+	if [ -z "$ALLYES" ] ; then
+		read OKIDOKI
+	else
+		OKIDOKI="Y"
+		echo "Y"
+	fi
 	case $OKIDOKI in
 		y|Y)
 		echo "$ALIAS" >> $ALIASFILE
@@ -147,11 +188,16 @@
 
 if [ "$DO_CHOWN" ] ; then
 	echo
-	echo -n "chown -R $CHOWN $SPOOLDIR/$LISTNAME? [y/n]: "
-	read OKIDOKI
+	echo -n "chown -R $CHOWN $LISTDIR? [y/n]: "
+	if [ -z "$ALLYES" ] ; then
+		read OKIDOKI
+	else
+		OKIDOKI="Y"
+		echo "Y"
+	fi
 	case $OKIDOKI in
 		y|Y)
-			chown -R $CHOWN $SPOOLDIR/$LISTNAME
+			chown -R "$CHOWN" "$LISTDIR"
 		;;
 		n|N)
 			exit 0

