From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 05 Oct 2010 11:24:16 +0000
Subject: Re: [mlmmj] Is using the include path for php-admin a good idea?
Message-Id: <4CAB0AE0.2090201@yahoo.com.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030808080507050307040908"
List-Id: <mlmmj.mlmmj.org>
References: <4CA87D1F.6030009@yahoo.com.au>
In-Reply-To: <4CA87D1F.6030009@yahoo.com.au>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------030808080507050307040908
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

>>> As a longtime php-coder, here's my opinion:
>>> - Putting it in the include path is a bad idea
>>> - hardcoding the path also
>>> So best of all: figure out the current filepath, put it in a variable
>>> and start from there (don't put this in a config file, it can be
>>> determined automatically), something like "dirname(__FILE__);" or to
>>> have the parent dir "basename(dirname(__FILE__));"
>
> I agree that here, there's absolutely no point in adding the include
> path. That one is to use ... include, not at all for opening files
> like the php-admin would need. It makes no sense in this context.

Have a look at my attached proposed patch. The interface was already
updated since the bug report was filed, but looking for tunables.pl
relative to $templatedir seems senseless to me, so I've added another
variable, $confdir. I've removed hard-coded paths and used paths
relative to __FILE__ instead. Finding config.php in the first place
could still be difficult, but at least the require directive for it is
at the top of each file, so it's easy to find what to change.

What do you think?

Ben.




--------------030808080507050307040908
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="php-admin-paths.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="php-admin-paths.diff"

diff -r ca8ddad585ef contrib/web/php-admin/conf/config.php
--- a/contrib/web/php-admin/conf/config.php	Mon Oct 04 10:18:15 2010 +1100
+++ b/contrib/web/php-admin/conf/config.php	Tue Oct 05 22:06:54 2010 +1100
@@ -1,6 +1,7 @@
 <?php
 
 $topdir = "/var/spool/mlmmj";
-$templatedir = "/home/mlmmj/templates";
+$confdir = dirname(__FILE__);
+$templatedir = dirname(dirname(__FILE__))."/templates";
 
 ?>
diff -r ca8ddad585ef contrib/web/php-admin/htdocs/edit.php
--- a/contrib/web/php-admin/htdocs/edit.php	Mon Oct 04 10:18:15 2010 +1100
+++ b/contrib/web/php-admin/htdocs/edit.php	Tue Oct 05 22:06:54 2010 +1100
@@ -26,8 +26,8 @@
  * IN THE SOFTWARE.
  */
 
-require("../conf/config.php");
-require("class.rFastTemplate.php");
+require(dirname(dirname(__FILE__))."/conf/config.php");
+require(dirname(__FILE__)."/class.rFastTemplate.php");
 
 function mlmmj_boolean($name, $nicename, $text) 
 {
@@ -117,10 +117,7 @@
 
 $tpl->assign(array("LIST" =>htmlentities($list)));
 
-$handle = fopen("$templatedir/../conf/tunables.pl", "r");
-$tunables = fread($handle, filesize("$templatedir/../conf/tunables.pl"));
-fclose($handle);
-
+$tunables = file_get_contents($confdir.'/tunables.pl');
 eval($tunables);
 
 $tpl->parse("MAIN","main");
diff -r ca8ddad585ef contrib/web/php-admin/htdocs/index.php
--- a/contrib/web/php-admin/htdocs/index.php	Mon Oct 04 10:18:15 2010 +1100
+++ b/contrib/web/php-admin/htdocs/index.php	Tue Oct 05 22:06:54 2010 +1100
@@ -26,8 +26,8 @@
  * IN THE SOFTWARE.
  */
 
-require("class.rFastTemplate.php");
-require("../conf/config.php");
+require(dirname(dirname(__FILE__))."/conf/config.php");
+require(dirname(__FILE__)."/class.rFastTemplate.php");
 
 $tpl = new rFastTemplate($templatedir);
 
diff -r ca8ddad585ef contrib/web/php-admin/htdocs/save.php
--- a/contrib/web/php-admin/htdocs/save.php	Mon Oct 04 10:18:15 2010 +1100
+++ b/contrib/web/php-admin/htdocs/save.php	Tue Oct 05 22:06:54 2010 +1100
@@ -26,8 +26,8 @@
  * IN THE SOFTWARE.
  */
 
-require("../conf/config.php");
-require("class.rFastTemplate.php");
+require(dirname(dirname(__FILE__))."/conf/config.php");
+require(dirname(__FILE__)."/class.rFastTemplate.php");
 
 function mlmmj_boolean($name, $nicename, $text)
 {
@@ -93,10 +93,7 @@
 $tpl->define(array("main" => "save.html"));
 $tpl->assign(array("LIST" => htmlentities($list)));
 
-$handle = fopen("$templatedir/../conf/tunables.pl", "r");
-$tunables = fread($handle, filesize("$templatedir/../conf/tunables.pl"));
-fclose($handle);
-
+$tunables = file_get_contents($confdir.'/tunables.pl');
 eval($tunables);
 
 $tpl->parse("MAIN","main");

--------------030808080507050307040908--


