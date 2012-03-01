From: Marc MAURICE <marc-mlmmj@pub.positon.org>
Date: Thu, 01 Mar 2012 13:08:30 +0000
Subject: Re: [mlmmj] Subscribers management in php-admin
Message-Id: <4F4F74CE.1090609@pub.positon.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030700060900020804030506"
List-Id: <mlmmj.mlmmj.org>
References: <4F4BFAA7.4060702@pub.positon.org>
In-Reply-To: <4F4BFAA7.4060702@pub.positon.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------030700060900020804030506
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello,

A new patch using
filter_var($email, FILTER_VALIDATE_EMAIL)
and escapeshellarg().

Marc



Le 29/02/2012 04:57, Ben Schmidt a =E9crit :
>> As for the save.php, I also found some very silly piece of code like
>> this one:
>> // Perl's encode_entities (to be able to use tunables.pl)
>> function encode_entities($str) { return htmlentities($str); }
>>
>> I'd like someone to explain to me why htmlentities() has to be wrapped
>> like this... :)
>
> For exactly the reason in the code comment: it's so that tunables.pl ca=
n
> be used. The PHP file evaluates the tunables.pl (Perl) file as if it
> were a PHP file. The tunables.pl file uses the Perl function
> encode_entities(), so to make it work, a function of that name is
> defined in PHP that just calls the equivalent PHP function. The benefit
> is that only one tunables.pl file needs to be maintained, not a
> tunables.pl and a tunables.php.
>
>> Then, there's things like this which worries me:
>> fwrite($fp, $HTTP_POST_VARS[$name]);
>>
>> Not only the variable should be checked, but also, if I'm not mistakin=
g,
>> $HTTP_POST_VARS is deprecated, and maybe even *removed* (I didn't chec=
k)
>> from php 5.4, which is going to reach Debian SID in a mater of weeks n=
ow
>> (we should be using $_POST instead).
>
> This was at least partly fixed ages ago in version control, so you
> evidently didn't check the current state of Mlmmj either. :-)
>
>> Functions like mlmmj_boolean() has parameters that it isn't using, so
>> it's weird.
>>
>> So yes, all this needs a code review... :)
>
> Never hurts.
>
> Ben.
>
>
>
>
>

--------------030700060900020804030506
Content-Type: text/plain;
 name="patches2.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="patches2.txt"

diff -r 3168aed4b01a contrib/web/php-admin/README
--- a/contrib/web/php-admin/README	Wed Feb 22 00:11:07 2012 +1100
+++ b/contrib/web/php-admin/README	Thu Mar 01 14:03:42 2012 +0100
@@ -22,8 +22,19 @@
    you need to create a group (eg. mlmmj) and add both users to it. The
    subscribers.d directory then needs to be writable by that group:
 
+     # addgroup mlmmj
+     # adduser wwwrun mlmmj
+     # adduser mailuser mlmmj
      # chgrp -R mlmmj /var/spool/mlmmj/mlmmj-test/subscribers.d/
      # chmod -R g+w /var/spool/mlmmj/mlmmj-test/subscribers.d/
+     # chmod g+s /var/spool/mlmmj/mlmmj-test/subscribers.d/
+
+   setgid flag is needed when the webserver calls mlmmj-sub and creates a file
+   under subscribers.d, to keep the mlmmj group.
+
+   If using the Exim mailserver, you should add initgroups = true in your
+   mlmmj_transport, otherwise it won't be able to write files having write
+   permission to mlmmj group.
 
 5) To enable access control on Apache you have to rename dot.htaccess to
    .htaccess and edit the path inside the file to point to a htpasswd file
diff -r 3168aed4b01a contrib/web/php-admin/htdocs/index.php
--- a/contrib/web/php-admin/htdocs/index.php	Wed Feb 22 00:11:07 2012 +1100
+++ b/contrib/web/php-admin/htdocs/index.php	Thu Mar 01 14:03:42 2012 +0100
@@ -35,15 +35,16 @@
 
 $lists = "";
 
-$dir = opendir($topdir);
-while ($file = readdir($dir)) {
+# use scandir to have alphabetical order
+foreach (scandir($topdir) as $file) {
     if (!ereg("^\.",$file))
     {
-	$lists .= "<a href=\"edit.php?list=".urlencode($file)."\">".
-	    htmlentities($file)."</a><br />\n";
+	$lists .= "<p>".htmlentities($file)."<br/>
+<a href=\"edit.php?list=".urlencode($file)."\">Config</a> - <a href=\"subscribers.php?list=".urlencode($file)."\">Subscribers</a>
+</p>
+";
     }
 }
-closedir($dir); 
 
 $tpl->assign(array("LISTS" => $lists));
 
diff -r 3168aed4b01a contrib/web/php-admin/htdocs/subscribers.php
--- /dev/null	Thu Jan 01 00:00:00 1970 +0000
+++ b/contrib/web/php-admin/htdocs/subscribers.php	Thu Mar 01 14:03:42 2012 +0100
@@ -0,0 +1,92 @@
+<?php
+
+# show errors like permission denied...
+ini_set('display_errors',1);
+
+require(dirname(dirname(__FILE__))."/conf/config.php");
+require(dirname(__FILE__)."/class.rFastTemplate.php");
+
+$tpl = new rFastTemplate($templatedir);
+
+# get the list parameter and check that list exists
+$list = $_GET["list"];
+
+if(!isset($list))
+die("no list specified");
+
+if (dirname(realpath($topdir."/".$list)) != realpath($topdir))
+die("list outside topdir");
+
+if(!is_dir($topdir."/".$list))
+die("non-existent list");
+
+# this will be displayed on the to of the page
+$message = "";
+
+# subscribe some people if tosubscribe is set
+if (isset($_POST["tosubscribe"])) {
+	
+	foreach (preg_split('/\r\n|\n|\r/', $_POST["tosubscribe"]) as $line) {
+		$email = trim($line);
+		if ($email != "") {
+			if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
+				$cmd = "/usr/bin/mlmmj-sub -L '/var/spool/mlmmj/".escapeshellarg($list)."' -a '".escapeshellarg($email)."' 2>&1";
+				exec($cmd, $out, $ret);
+				if ($ret !== 0) {
+					$message.= "Subscribe error for $email <!--cmd=$cmd out=".implode($out)." ret=$ret--> <br/>";
+				}
+			} else {
+				$message.= "Email address not valid: $email <br/>";
+			}
+		}
+		
+	}
+
+# delete some people if delete is set
+} else if (isset($_POST["delete"])) {
+
+	$email = $_POST["email"];
+	if (! filter_var($email, FILTER_VALIDATE_EMAIL)) die("Email address not valid");
+	
+	$cmd = "/usr/bin/mlmmj-unsub -L '/var/spool/mlmmj/".escapeshellarg($list)."' -a '".escapeshellarg($email)."' 2>&1";
+	exec($cmd, $out, $ret);
+	if ($ret !== 0) {
+		$message = "Unsubscribe error. cmd=$cmd out=".implode($out)." ret=$ret";
+	}
+}
+
+$subscribers="";
+
+# get subscribers from mlmmj
+$cmd = "/usr/bin/mlmmj-list -L '/var/spool/mlmmj/".escapeshellarg($list)."' 2>&1";
+exec($cmd, $out, $ret);
+if ($ret !== 0) {
+	$message.= "Error: Could not get subscribers list.";
+}
+
+foreach ($out as $email) {
+	$email = trim($email);
+
+	$form = "<form action=\"subscribers.php?list=$list\" method=\"post\" style=\"margin: 0; margin-left: 1em\">";
+	$form.= "<input type=\"hidden\" name=\"email\" value=\"".htmlspecialchars($email)."\" />";
+	$form.= "<input type=\"submit\" name=\"delete\" value=\"Remove\" />";
+	$form.= "</form>";
+
+	$subscribers.= "<tr><td>".htmlspecialchars($email)."</td><td>$form</td></tr>\n";
+}
+
+if ($subscribers === "") {
+	$subscribers = "<tr><td>This list is empty.</td></tr>\n";
+}
+
+# set template vars
+$tpl->define(array("main" => "subscribers.html"));
+
+$tpl->assign(array("LIST" => $list));
+$tpl->assign(array("MESSAGE" => "</p>$message</p>"));
+$tpl->assign(array("SUBS" => $subscribers));
+
+$tpl->parse("MAIN","main");
+$tpl->FastPrint("MAIN");
+
+?>
diff -r 3168aed4b01a contrib/web/php-admin/templates/subscribers.html
--- /dev/null	Thu Jan 01 00:00:00 1970 +0000
+++ b/contrib/web/php-admin/templates/subscribers.html	Thu Mar 01 14:03:42 2012 +0100
@@ -0,0 +1,38 @@
+<html>
+<head>
+<title>mlmmj - {LIST} subscribers</title>
+<style type="text/css">
+#subscribers {
+	float: left;
+}
+
+#addsubscribers {
+        float: left;
+	margin-left: 2em;
+}
+#index {
+	clear: both;
+}
+</style>
+</head>
+<body>
+<h1>{LIST} subscribers</h1>
+
+{MESSAGE}
+
+<table id="subscribers">
+{SUBS}
+</table>
+
+<form method="post" action="subscribers.php?list={LIST}" id="addsubscribers">
+Add subscribers:<br/>
+<textarea name="tosubscribe" rows="5" cols="30">
+</textarea><br/>
+<input type="submit" name="submit" value="Add" />
+</form>
+
+<p id="index">
+<a href="index.php">Index</a>
+</p>
+</body>
+</html>
diff -r 3168aed4b01a src/subscriberfuncs.c
--- a/src/subscriberfuncs.c	Wed Feb 22 00:11:07 2012 +1100
+++ b/src/subscriberfuncs.c	Thu Mar 01 14:03:42 2012 +0100
@@ -132,6 +132,7 @@
 		subreadname = concatstr(2, subddirname, dp->d_name);
 		subread = open(subreadname, O_RDONLY);
 		if(subread < 0) {
+	                log_error(LOG_ARGS, "Could not open %s", subreadname);
 			myfree(subreadname);
 			continue;
 		}

--------------030700060900020804030506--

