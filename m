From: Marc MAURICE <marc-mlmmj@pub.positon.org>
Date: Mon, 05 Mar 2012 12:02:26 +0000
Subject: Re: [mlmmj] Subscribers management in php-admin
Message-Id: <4F54AB52.6060207@pub.positon.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010109070207000104010401"
List-Id: <mlmmj.mlmmj.org>
References: <4F4BFAA7.4060702@pub.positon.org>
In-Reply-To: <4F4BFAA7.4060702@pub.positon.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------010109070207000104010401
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello Ben,

Here is the new patch.

> - You have added new files; could they have headers clarifying their
>   license, please?
license added to subscribers.php
> - /var/spool/mlmmj should not be hardcoded; you should use $topdir.
done
> - You need to unset($out) before calling exec(...,$out,...); see the PH=
P
>   documentation for exec().
done
> - Please don't ini_set display_errors to true; that could expose detail=
s
>   that the server administrator does not want to expose; admins should
>   have their PHP logging set up adequately to give them what they need,
>   or can change ini settings themselves if they need to.
deleted
> - Could you concatenate strings and use \n for linebreaks, please,
>   maintaining the indent in the PHP script, instead of having string
>   literals that span multiple lines?
done in index.php
> - Could you consider extending this slightly to allow subscription of
>   digesters and nomailers? (Update the README, too, to get permissions
>   set correctly on all relevant directories.) This could be a separate
>   patch, or omitted, but it would be nice.
Yes, it would be better in a new patch.
I will try to find some time to work on it next days.

Ho I have on question : what is the main purpose of nomailers ?
I understand that those people do not get any list mail.
Is it to be able to post to a list without receiving mail with subonlypos=
t ?

I did not find anything about it in the doc.

Thanks in advance,

Marc



>
>
>
>
> On 2/03/12 11:59 PM, Marc MAURICE wrote:
>> Here is the new patch version.
>>
>> The email should be displayed, otherwise the user will have no clue=20
>> about which
>> email is wrong if his email list is very long.
>>
>> I put htmlspecialchars everywhere and errors are now enclosed in=20
>> <pre> tags.
>> no need for ln2br in <pre> tags no ?
>>
>> Marc
>>
>>
>> Le 01/03/2012 16:07, Thomas Goirand a =E9crit :
>>> On 03/01/2012 09:08 PM, Marc MAURICE wrote:
>>>> +if (isset($_POST["tosubscribe"])) {
>>>> +
>>>> + foreach (preg_split('/\r\n|\n|\r/', $_POST["tosubscribe"]) as=20
>>>> $line) {
>>>> + $email =3D trim($line);
>>>> + if ($email !=3D "") {
>>>> + if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
>>>> + $cmd =3D "/usr/bin/mlmmj-sub -L=20
>>>> '/var/spool/mlmmj/".escapeshellarg($list)."' -a
>>>> '".escapeshellarg($email)."' 2>&1";
>>>> + exec($cmd, $out, $ret);
>>>> + if ($ret !=3D=3D 0) {
>>>> + $message.=3D "Subscribe error for $email<!--cmd=3D$cmd=20
>>>> out=3D".implode($out)."
>>>> ret=3D$ret--> <br/>";
>>>> + }
>>>> + } else {
>>>> + $message.=3D "Email address not valid: $email<br/>";
>>> If $email isn't valid, then it's even more a reason not to display it
>>> (eg: unless you want to shoot yourself in the foot with issues like
>>> cross site scripting...).
>>>
>>> Also, I'm not sure what you are attempting with "displaying" the outp=
ut
>>> of the subscribing command in a HTML comment. Why not displaying it f=
or
>>> real, using htmlspecialchars() (which by the way, you didn't use, whi=
ch
>>> is dangerous) and ln2br() in a<pre> tag?
>>>
>>> Thomas
>>>
>>>

--------------010109070207000104010401
Content-Type: text/plain;
 name="patches3.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="patches3.txt"

diff -r 3168aed4b01a contrib/web/php-admin/README
--- a/contrib/web/php-admin/README	Wed Feb 22 00:11:07 2012 +1100
+++ b/contrib/web/php-admin/README	Mon Mar 05 12:54:28 2012 +0100
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
+++ b/contrib/web/php-admin/htdocs/index.php	Mon Mar 05 12:54:28 2012 +0100
@@ -35,15 +35,15 @@
 
 $lists = "";
 
-$dir = opendir($topdir);
-while ($file = readdir($dir)) {
+# use scandir to have alphabetical order
+foreach (scandir($topdir) as $file) {
     if (!ereg("^\.",$file))
     {
-	$lists .= "<a href=\"edit.php?list=".urlencode($file)."\">".
-	    htmlentities($file)."</a><br />\n";
+	$lists .= "<p>".htmlentities($file)."<br/>\n";
+	$lists .= "<a href=\"edit.php?list=".urlencode($file)."\">Config</a> - <a href=\"subscribers.php?list=".urlencode($file)."\">Subscribers</a>\n";
+	$lists .= "</p>\n";
     }
 }
-closedir($dir); 
 
 $tpl->assign(array("LISTS" => $lists));
 
diff -r 3168aed4b01a contrib/web/php-admin/htdocs/subscribers.php
--- /dev/null	Thu Jan 01 00:00:00 1970 +0000
+++ b/contrib/web/php-admin/htdocs/subscribers.php	Mon Mar 05 12:54:28 2012 +0100
@@ -0,0 +1,114 @@
+<?php
+
+/* Copyright (C) 2012 Marc MAURICE <marc-mlmmj at pub dot positon dot org>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
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
+				$cmd = "/usr/bin/mlmmj-sub -L ".escapeshellarg("$topdir/$list")." -a ".escapeshellarg($email)." 2>&1";
+				unset($out);
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
+	$cmd = "/usr/bin/mlmmj-unsub -L ".escapeshellarg("$topdir/$list")." -a ".escapeshellarg($email)." 2>&1";
+	unset($out);
+	exec($cmd, $out, $ret);
+	if ($ret !== 0) {
+		$message.= "* Unsubscribe error.\ncommand: $cmd\nreturn code: $ret\noutput: ".implode("\n", $out)."\n";
+	}
+}
+
+$subscribers="";
+
+# get subscribers from mlmmj
+$cmd = "/usr/bin/mlmmj-list -L ".escapeshellarg("$topdir/$list")." 2>&1";
+unset($out);
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
+++ b/contrib/web/php-admin/templates/subscribers.html	Mon Mar 05 12:54:28 2012 +0100
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
+++ b/src/subscriberfuncs.c	Mon Mar 05 12:54:28 2012 +0100
@@ -132,6 +132,7 @@
 		subreadname = concatstr(2, subddirname, dp->d_name);
 		subread = open(subreadname, O_RDONLY);
 		if(subread < 0) {
+	                log_error(LOG_ARGS, "Could not open %s", subreadname);
 			myfree(subreadname);
 			continue;
 		}

--------------010109070207000104010401--

