From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 25 Jan 2010 10:35:42 +0000
Subject: PATCH: Tunables documentation and interface
Message-Id: <4B5D73FE.6040907@yahoo.com.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040508080805020005010408"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------040508080805020005010408
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Attached is a patch for consideration for inclusion in mlmmj. It updates the 
TUNABLES file with some previously-missing information, and the tunables.pl file 
for the perl and php web admin interfaces that were likewise missing some info.

Comments?

Could this be included?

Also, are all the relevant maintainers regulars on the list, or should I be CCing 
people individually regarding the web admin interfaces?

Cheers,

Ben.


--------------040508080805020005010408
Content-Type: text/x-patch;
 name="mlmmj-tunables.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="mlmmj-tunables.patch"

diff -ru mlmmj-1.2.17/TUNABLES mlmmj-1.2.17-mod/TUNABLES
--- mlmmj-1.2.17/TUNABLES	2010-01-11 00:40:56.000000000 +1100
+++ mlmmj-1.2.17-mod/TUNABLES	2010-01-25 02:18:43.000000000 +1100
@@ -6,7 +6,8 @@
 the contents of a file does not matter, the mere presence of it, will set the
 variable to "true". If it's a "normal" file, the first line will be used as
 value, leaving line 2 and forward ready for commentary etc. If it's possible
-to specify several entries (one pr. line), it's marked "list".
+to specify several entries (one pr. line), it's marked "list". If the file's
+entire content is used as value, it's marked "text".
 
  ��� listaddress			(list)
 
@@ -73,7 +74,7 @@
    Then all occurences of these headers in incoming list mail will be deleted.
    "From " and "Return-Path:" are deleted no matter what.
 
- ��� access			(list)
+ ��� access			(text)
 
    If this file exists, all headers of a post to the list is matched against
    the rules. The first rule to match wins. See README.access for syntax and
@@ -209,5 +210,10 @@
    If this file is present, then mlmmj in case of moderation checks the
    envelope from, to see if the sender is a moderator, and in that case
    only send the moderation mails to that address. In practice this means that
-   a moderator sending mail to the list wont bother all the other moderators
+   a moderator sending mail to the list won't bother all the other moderators
    with his mail.
+
+ ��� footer			(text)
+
+   The content of this file is appended to mail sent to the list.
+
diff -ru mlmmj-1.2.17/contrib/web/perl-admin/conf/tunables.pl mlmmj-1.2.17-mod/contrib/web/perl-admin/conf/tunables.pl
--- mlmmj-1.2.17/contrib/web/perl-admin/conf/tunables.pl	2008-11-03 07:42:57.000000000 +1100
+++ mlmmj-1.2.17-mod/contrib/web/perl-admin/conf/tunables.pl	2010-01-25 02:18:43.000000000 +1100
@@ -1,3 +1,9 @@
+mlmmj_list("listaddress",
+			  "List address",
+			  "This option contains all addresses which mlmmj sees as listaddresses (see ".
+			  "tocc below). The first one is the one used as the primary one, when mlmmj ".
+			  "sends out mail.");
+
 mlmmj_boolean("closedlist",
 			  "Closed list",
 			  "If the list is open or closed. If it's closed subscription ".
@@ -85,6 +91,11 @@
 			 "SMTP port",
 			 "In this file a port other than port 25 for connecting to the relayhost can be specified.");
 
+mlmmj_string("delimiter",
+			  "Delimiter",
+			  "This specifies what to use as recipient delimiter for the list.".
+			  "Default is \"+\".");
+
 mlmmj_boolean("notifysub",
 			  "Notify subscribers",
 			  "If this option is set, the owner(s) will get a mail with the address of someone sub/unsubscribing to a mailinglist.");
@@ -120,6 +131,16 @@
 			  "Subscribers only get",
 			  "If this option is set, retrieving old posts with +get-N is only possible for subscribers.");
 
+mlmmj_string("verp",
+			  "VERP",
+			  "Enable VERP support. Anything added in this variable will be appended the ".
+			  "MAIL FROM: line. If \"postfix\" is put in the file, it'll make postfix use ".
+			  "VERP by adding XVERP=-= to the MAIL FROM: line.");
+
+mlmmj_string("maxverprecips",
+			  "Maximum VERP recipients",
+			  "How many recipients pr. mail delivered to the smtp server. Defaults to 100.");
+
 mlmmj_boolean("notoccdenymails",
 			  "No To: Cc: deny mails",
 			  "This switch turns off whether mlmmj sends out notification about postings ".
@@ -171,3 +192,16 @@
 			 "If this is set to something\@example.org, the bounce address (Return-Path:) ".
 			 "will be fixed to something+listname-bounces-and-so-on\@example.org ".
 			 "in case you need to disable automatic bounce handling.");
+
+mlmmj_boolean("ifmodsendonlymodmoderate",
+			  "If moderator send only moderator moderate",
+			  "If this is set, then mlmmj in case of moderation checks the ".
+			  "envelope from, to see if the sender is a moderator, and in that case ".
+			  "only send the moderation mails to that address. In practice this means that ".
+			  "a moderator sending mail to the list won't bother all the other moderators ".
+			  "with his mail.");
+
+mlmmj_list("footer",
+			  "Footer",
+			  "The content of this option is appended to mail sent to the list.");
+
diff -ru mlmmj-1.2.17/contrib/web/php-admin/conf/tunables.pl mlmmj-1.2.17-mod/contrib/web/php-admin/conf/tunables.pl
--- mlmmj-1.2.17/contrib/web/php-admin/conf/tunables.pl	2008-11-03 07:42:57.000000000 +1100
+++ mlmmj-1.2.17-mod/contrib/web/php-admin/conf/tunables.pl	2010-01-25 02:18:43.000000000 +1100
@@ -1,3 +1,9 @@
+mlmmj_list("listaddress",
+			  "List address",
+			  "This option contains all addresses which mlmmj sees as listaddresses (see ".
+			  "tocc below). The first one is the one used as the primary one, when mlmmj ".
+			  "sends out mail.");
+
 mlmmj_boolean("closedlist",
 			  "Closed list",
 			  "If the list is open or closed. If it's closed subscription ".
@@ -85,6 +91,11 @@
 			 "SMTP port",
 			 "In this file a port other than port 25 for connecting to the relayhost can be specified.");
 
+mlmmj_string("delimiter",
+			  "Delimiter",
+			  "This specifies what to use as recipient delimiter for the list.".
+			  "Default is '+'.");
+
 mlmmj_boolean("notifysub",
 			  "Notify subscribers",
 			  "If this option is set, the owner(s) will get a mail with the address of someone sub/unsubscribing to a mailinglist.");
@@ -120,6 +131,16 @@
 			  "Subscribers only get",
 			  "If this option is set, retrieving old posts with +get-N is only possible for subscribers.");
 
+mlmmj_string("verp",
+			  "VERP",
+			  "Enable VERP support. Anything added in this variable will be appended the ".
+			  "MAIL FROM: line. If 'postfix' is put in the file, it'll make postfix use ".
+			  "VERP by adding XVERP=-= to the MAIL FROM: line.");
+
+mlmmj_string("maxverprecips",
+			  "Maximum VERP recipients",
+			  "How many recipients pr. mail delivered to the smtp server. Defaults to 100.");
+
 mlmmj_boolean("notoccdenymails",
 			  "No To: Cc: deny mails",
 			  "This switch turns off whether mlmmj sends out notification about postings ".
@@ -171,3 +192,16 @@
 			 "If this is set to something\@example.org, the bounce address (Return-Path:) ".
 			 "will be fixed to something+listname-bounces-and-so-on\@example.org ".
 			 "in case you need to disable automatic bounce handling.");
+
+mlmmj_boolean("ifmodsendonlymodmoderate",
+			  "If moderator send only moderator moderate",
+			  "If this is set, then mlmmj in case of moderation checks the ".
+			  "envelope from, to see if the sender is a moderator, and in that case ".
+			  "only send the moderation mails to that address. In practice this means that ".
+			  "a moderator sending mail to the list won't bother all the other moderators ".
+			  "with his mail.");
+
+mlmmj_list("footer",
+			  "Footer",
+			  "The content of this option is appended to mail sent to the list.");
+

--------------040508080805020005010408--


