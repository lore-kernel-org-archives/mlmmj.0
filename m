From: Marc MAURICE <marc-mlmmj@pub.positon.org>
Date: Fri, 02 Mar 2012 12:59:03 +0000
Subject: Re: [mlmmj] Subscribers management in php-admin
Message-Id: <4F50C417.4030803@pub.positon.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------070407000906000101000803"
List-Id: <mlmmj.mlmmj.org>
References: <4F4BFAA7.4060702@pub.positon.org>
In-Reply-To: <4F4BFAA7.4060702@pub.positon.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------070407000906000101000803
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Here is the new patch version.

The email should be displayed, otherwise the user will have no clue=20
about which email is wrong if his email list is very long.

I put htmlspecialchars everywhere and errors are now enclosed in <pre> ta=
gs.
no need for ln2br in <pre> tags no ?

Marc


Le 01/03/2012 16:07, Thomas Goirand a =E9crit :
> On 03/01/2012 09:08 PM, Marc MAURICE wrote:
>> +if (isset($_POST["tosubscribe"])) {
>> +=09
>> +	foreach (preg_split('/\r\n|\n|\r/', $_POST["tosubscribe"]) as $line)=
 {
>> +		$email =3D trim($line);
>> +		if ($email !=3D "") {
>> +			if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
>> +				$cmd =3D "/usr/bin/mlmmj-sub -L '/var/spool/mlmmj/".escapeshellar=
g($list)."' -a '".escapeshellarg($email)."' 2>&1";
>> +				exec($cmd, $out, $ret);
>> +				if ($ret !=3D=3D 0) {
>> +					$message.=3D "Subscribe error for $email<!--cmd=3D$cmd out=3D".i=
mplode($out)." ret=3D$ret-->  <br/>";
>> +				}
>> +			} else {
>> +				$message.=3D "Email address not valid: $email<br/>";
> If $email isn't valid, then it's even more a reason not to display it
> (eg: unless you want to shoot yourself in the foot with issues like
> cross site scripting...).
>
> Also, I'm not sure what you are attempting with "displaying" the output
> of the subscribing command in a HTML comment. Why not displaying it for
> real, using htmlspecialchars() (which by the way, you didn't use, which
> is dangerous) and ln2br() in a<pre>  tag?
>
> Thomas
>
>

--------------070407000906000101000803
Content-Type: text/plain;
 name="patches3.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="patches3.txt"

diff -r 3168aed4b01a contrib/web/php-admin/README
--- a/contrib/web/php-admin/README	Wed Feb 22 00:11:07 2012 +1100
+++ b/contrib/web/php-admin/README	Fri Mar 02 13:54:31 2012 +0100
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
+++ b/contrib/web/php-admin/htdocs/index.php	Fri Mar 02 13:54:31 2012 +0100
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
+++ b/contrib/web/php-admin/htdocs/subscribers.php	Fri Mar 02 13:54:31 2012 +0100
@@ -0,0 +1,93 @@
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
+# this will be displayed on the top of the page
+$message = "";
+
+# subscribe some people if tosubscribe is set
+if (isset($_POST["tosubscribe"])) {
+	
+	foreach (preg_split('/\r\n|\n|\r/', $_POST["tosubscribe"]) as $line) {
+		$email = trim($line);
+		if ($email != "") {
+			if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
+				$cmd = "/usr/bin/mlmmj-sub -L ".escapeshellarg("/var/spool/mlmmj/$list")." -a ".escapeshellarg($email)." 2>&1";
+				exec($cmd, $out, $ret);
+				if ($ret !== 0) {
+					$message.= "* Subscribe error for $email\ncommand: $cmd\nreturn code: $ret\noutput: ".implode("\n", $out)."\n";
+				}
+			} else {
+				$message.= "* Email address not valid: $email\n";
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
+	$cmd = "/usr/bin/mlmmj-unsub -L ".escapeshellarg("/var/spool/mlmmj/$list")." -a ".escapeshellarg($email)." 2>&1";
+	exec($cmd, $out, $ret);
+	if ($ret !== 0) {
+		$message.= "* Unsubscribe error.\ncommand: $cmd\nreturn code: $ret\noutput: ".implode("\n", $out)."\n";
+	}
+}
+
+$subscribers="";
+
+# get subscribers from mlmmj
+$cmd = "/usr/bin/mlmmj-list -L ".escapeshellarg("/var/spool/mlmmj/$list")." 2>&1";
+exec($cmd, $out, $ret);
+if ($ret !== 0) {
+	$message.= "* Error: Could not get subscribers list.\n";
+} else {
+
+	foreach ($out as $email) {
+		$email = trim($email);
+
+		$form = "<form action=\"subscribers.php?list=".htmlspecialchars($list)."\" method=\"post\" style=\"margin: 0; margin-left: 1em\">";
+		$form.= "<input type=\"hidden\" name=\"email\" value=\"".htmlspecialchars($email)."\" />";
+		$form.= "<input type=\"submit\" name=\"delete\" value=\"Remove\" />";
+		$form.= "</form>";
+
+		$subscribers.= "<tr><td>".htmlspecialchars($email)."</td><td>$form</td></tr>\n";
+	}
+
+	if ($subscribers === "") {
+		$subscribers = "<tr><td>This list is empty.</td></tr>\n";
+	}
+}
+
+# set template vars
+$tpl->define(array("main" => "subscribers.html"));
+
+$tpl->assign(array("LIST" => htmlspecialchars($list)));
+$tpl->assign(array("MESSAGE" => "<pre>".htmlspecialchars($message)."</pre>"));
+$tpl->assign(array("SUBS" => $subscribers));
+
+$tpl->parse("MAIN","main");
+$tpl->FastPrint("MAIN");
+
+?>
diff -r 3168aed4b01a contrib/web/php-admin/templates/subscribers.html
--- /dev/null	Thu Jan 01 00:00:00 1970 +0000
+++ b/contrib/web/php-admin/templates/subscribers.html	Fri Mar 02 13:54:31 2012 +0100
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
+++ b/src/subscriberfuncs.c	Fri Mar 02 13:54:31 2012 +0100
@@ -132,6 +132,7 @@
 		subreadname = concatstr(2, subddirname, dp->d_name);
 		subread = open(subreadname, O_RDONLY);
 		if(subread < 0) {
+	                log_error(LOG_ARGS, "Could not open %s", subreadname);
 			myfree(subreadname);
 			continue;
 		}

--------------070407000906000101000803--

