From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 18 Feb 2010 14:27:55 +0000
Subject: Re: PATCH: Access priority
Message-Id: <4B7D4E6B.4030901@yahoo.com.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050900070705090102010803"
List-Id: <mlmmj.mlmmj.org>
References: <4B5D7A55.4090302@yahoo.com.au>
In-Reply-To: <4B5D7A55.4090302@yahoo.com.au>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------050900070705090102010803
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>> One possible solution - at least to the bypass moderation problem -
>>> might be to add another keyword. We could add "send" to force the mail
>>> past normal moderation procedures.
>>
>> Exactly what I was thinking after reading the issues you raised above.
> ...
>> Shall I put together a new patch?
>
> Yes, that would be nice.

Attached. It applies on top of the ASCII art patch.

Mind you, it changes the ASCII art to something different...I found it
pretty impossible to try to incorporate the 'send' into the existing
picture, and ended up turning the whole thing around. I don't think it's
as good that way around, but at least it fits. Maybe you can do a better
job incorporating it into the old one, Morten.

The patch has not been tested yet, though it builds OK. But definitely
don't commit it until at least someone has tested it. I will try to give
it a whirl early next week.

>> - if the third flow is choosen, don't call the new keyword plain
>>    "send", call it eg. "force-send" or "bypass-mod" or so. People tend
>>    to like descriptive keywords :-)
>
> Why break a tradition of choosing ambiguous keywords? ;-)

I don't think it's too ambiguous, so have stuck with 'send'.

Ben.




--------------050900070705090102010803
Content-Type: text/x-patch;
 name="mlmmj-access-3.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="mlmmj-access-3.patch"

diff -r 490e905b4aca README.access
--- a/README.access	Thu Feb 18 18:28:52 2010 +1100
+++ b/README.access	Thu Feb 18 19:00:24 2010 +1100
@@ -17,7 +17,7 @@
 discard or moderate the post.
 
 The syntax is quite simple: action[ [!]regexp]
-- "Action" can be "allow", "deny", "discard" or "moderate".
+- "Action" can be "allow", "send", "deny", "discard" or "moderate".
 - The optional "!" makes the rule a match, if NO header matches the regular
   expression.
 - "Regexp" is a POSIX.2 extended regular expression. Matching is done case
@@ -27,6 +27,9 @@
 mail may still be held for moderation, if it would have been so without access
 rules.
 
+The action "send" will send the mail unconditionally. It will not be
+moderated.
+
 The action "deny" will not send the mail to the mailing list, but will send a
 rejection mail to the sender.
 
@@ -39,24 +42,27 @@
            function as moderators in listdir/control/moderators
 
 
-The flow out of the access system is like this:
+The flow through the access system is like this:
 
-                      |
-                      v
-+--------+   deny +--------+ discard   +---------+
-| reject |<-------| access |---------->| discard |
-+--------+        +--------+           +---------+
-               allow |  | moderate
-                     |  +-----------+
-                     v              v
-               +------------+    +------+
-               | moderation |--->| hold |
-               +------------+    +------+
-                     |              |
-                     v              |
-                  +------+          |
-                  | send |<---------+
-                  +------+
+               deny       +------+
+       +----------------->| deny |
+       |                  +------+
+       |
+       |       discard    +---------+
+       |  +-------------->| discard |
+       |  |               +---------+
+       |  |                   ^
+       |  |                   | expire
+    +--------+ moderate   +------+           +------+
+--->| access |----------->| hold |---------->| send |--->
+    +--------+            +------+ confirm   +------+
+       |  |                   ^                ^  ^
+       |  |                   | yes            |  |
+       |  |    allow      +------------+ no    |  |
+       |  +-------------->| moderation |-------+  |
+       |                  +------------+          |
+       |       send                               |
+       +------------------------------------------+
 
 
 First a simple example. This rule set will reject any mail that is NOT plain
diff -r 490e905b4aca src/mlmmj-process.c
--- a/src/mlmmj-process.c	Thu Feb 18 18:28:52 2010 +1100
+++ b/src/mlmmj-process.c	Thu Feb 18 19:00:24 2010 +1100
@@ -55,6 +55,7 @@
 
 enum action {
 	ALLOW,
+	SEND,
 	DENY,
 	MODERATE,
 	DISCARD
@@ -173,6 +174,9 @@
 		if (strncmp(rule_ptr, "allow", 5) == 0) {
 			rule_ptr += 5;
 			act = ALLOW;
+		} else if (strncmp(rule_ptr, "send", 4) == 0) {
+			rule_ptr += 4;
+			act = SEND;
 		} else if (strncmp(rule_ptr, "deny", 4) == 0) {
 			rule_ptr += 4;
 			act = DENY;
@@ -852,6 +856,9 @@
 	}
 
 startaccess:
+	if(!moderated)
+		moderated = statctrl(listdir, "moderated");
+
 	noaccessdenymails = statctrl(listdir, "noaccessdenymails");
 
 	access_rules = ctrlvalues(listdir, "access");
@@ -918,13 +925,15 @@
 			myfree(donemailname);
 			myfree(discardname);
                 	exit(EXIT_SUCCESS);
+		} else if (accret == SEND) {
+			moderated = 0;
+		} else if (accret == ALLOW) {
+			/* continue processing as normal */
 		}
 	}
 
 	notmetoo = statctrl(listdir, "notmetoo");
 
-	if(!moderated)
-		moderated = statctrl(listdir, "moderated");
 	if(moderated) {
 		mqueuename = concatstr(3, listdir, "/moderation/",
 				       randomstr);

--------------050900070705090102010803--


