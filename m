From: "Devin Ceartas" <nacredata@gmail.com>
Date: Wed, 23 Jan 2008 03:02:32 +0000
Subject: Thanks! & web diff
Message-Id: <2d58d31e0801221902o15485dc3j5264a109389fde2@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_Part_17634_29774804.1201057352250"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

------=_Part_17634_29774804.1201057352250
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thanks so much for mlmmj. Exactly what I was looking for, I look forward to
exploring it!
-- devin

-- 
Devin M. Ceartas, owner NacreData L.L.C.
nacredata@gmail.com
info@nacredata.com
(919) 975-5211
AIM: nacredata
skype IM: nacredata


--- /Users/devin/Desktop/mlmmj -- mailing list managing made joyful
copy.html 2008-01-22 21:45:56.000000000 -0500
+++ /Users/devin/Desktop/mlmmj -- mailing list managing made
joyful.html 2008-01-22
21:48:27.000000000 -0500
@@ -38,7 +38,7 @@

  $B-t(B Archive
  $B-t(B Custom headers / footer
- $B-t(B Fully automated bouncehandling (similar to ezmlm)
+ $B-t(B Fully automated bounce handling (similar to ezmlm)
  $B-t(B Complete requeueing functionality
  $B-t(B Moderation functionality
  $B-t(B Subject prefix
@@ -81,11 +81,11 @@

     http://faqs.org/faqs/mail/addressing/

-    The mmj TUNABLE "delimiter" configures this on a per list basis
+    The mmj TUNABLE "delimiter" configures this on a per list basis.

  2) Create the mailinglist.  There's a script, mlmmj-make-ml.sh, that will
make
-    a mailinglist for mlmmj. It is highly recommended to use this script to
make
-    the lists! What is does is described here:
+    a mailinglist for mlmmj. The use of this script is the recommended way
to
+    create lists. What is does is described here:

     In the case of a list called mlmmj-test below /var/spool/mlmmj it makes
the
     following directories:
@@ -117,8 +117,8 @@

     NOTE: Don't forget newaliases.

- 4) Start mlmmj-maintd (remember full path when starting it!) or add it to
-    crontab with -F switch. The recommended way for now is to run it via
cron:
+ 4) Start mlmmj-maintd (remember to use the full path when starting it!) or
add
+     it to crontab with -F switch. The recommended way for now is to run it
via cron:

     "0 */2 * * *  /usr/bin/mlmmj-maintd -F -L /var/spool/mlmmj/mlmmj-test"

@@ -154,7 +154,7 @@
     Subject: [mlmmj-test] how are we doing?
     Simply do 'echo "[mlmmj-test]" > control/prefix

- 9) For having a moderated list, simply create a file called 'moderated' in
the
+ 9) To create a moderated list, simply create a file called 'moderated' in
the
     control/ directory. Moderators are added to a file called 'moderators'
in
     the control/ dir as well.

------=_Part_17634_29774804.1201057352250
Content-Type: text/html; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thanks so much for mlmmj. Exactly what I was looking for, I look forward to exploring it!<div><br class="webkit-block-placeholder"></div><div>-- devin<br clear="all"><br>-- <br>Devin M. Ceartas, owner NacreData L.L.C.<br><a href="mailto:nacredata@gmail.com">
nacredata@gmail.com</a><br><a href="mailto:info@nacredata.com">info@nacredata.com</a><br>(919) 975-5211 <br>AIM: nacredata<br>skype IM: nacredata
</div><div><br class="webkit-block-placeholder"></div><div><br class="webkit-block-placeholder"></div><div><div>--- /Users/devin/Desktop/mlmmj -- mailing list managing made joyful copy.html<span class="Apple-tab-span" style="white-space:pre">
	</span>2008-01-22 21:45:56.000000000 -0500</div><div>+++ /Users/devin/Desktop/mlmmj -- mailing list managing made joyful.html<span class="Apple-tab-span" style="white-space:pre">	</span>2008-01-22 21:48:27.000000000 -0500
</div><div>@@ -38,7 +38,7 @@</div><div>&nbsp;</div><div>&nbsp;&nbsp;$B-t(B Archive</div><div>&nbsp;&nbsp;$B-t(B Custom headers / footer</div><div>- $B-t(B Fully automated bouncehandling (similar to ezmlm)</div><div>+ $B-t(B Fully automated bounce handling (similar to ezmlm)
</div><div>&nbsp;&nbsp;$B-t(B Complete requeueing functionality</div><div>&nbsp;&nbsp;$B-t(B Moderation functionality</div><div>&nbsp;&nbsp;$B-t(B Subject prefix</div><div>@@ -81,11 +81,11 @@</div><div>&nbsp;</div><div>&nbsp;&nbsp; &nbsp; <a href="http://faqs.org/faqs/mail/addressing/">
http://faqs.org/faqs/mail/addressing/</a></div><div>&nbsp;</div><div>- &nbsp; &nbsp;The mmj TUNABLE &quot;delimiter&quot; configures this on a per list basis</div><div>+ &nbsp; &nbsp;The mmj TUNABLE &quot;delimiter&quot; configures this on a per list basis.
</div><div>&nbsp;</div><div>&nbsp;&nbsp;2) Create the mailinglist. &nbsp;There&#39;s a script, mlmmj-make-ml.sh, that will make</div><div>- &nbsp; &nbsp;a mailinglist for mlmmj. It is highly recommended to use this script to make</div><div>- &nbsp; &nbsp;the lists! What is does is described here:
</div><div>+ &nbsp; &nbsp;a mailinglist for mlmmj. The use of this script is the recommended way to</div><div>+ &nbsp; &nbsp;create lists. What is does is described here:</div><div>&nbsp;</div><div>&nbsp;&nbsp; &nbsp; In the case of a list called mlmmj-test below /var/spool/mlmmj it makes the
</div><div>&nbsp;&nbsp; &nbsp; following directories:</div><div>@@ -117,8 +117,8 @@</div><div>&nbsp;</div><div>&nbsp;&nbsp; &nbsp; NOTE: Don&#39;t forget newaliases.</div><div>&nbsp;</div><div>- 4) Start mlmmj-maintd (remember full path when starting it!) or add it to
</div><div>- &nbsp; &nbsp;crontab with -F switch. The recommended way for now is to run it via cron:</div><div>+ 4) Start mlmmj-maintd (remember to use the full path when starting it!) or add</div><div>+ &nbsp; &nbsp; it to crontab with -F switch. The recommended way for now is to run it via cron:
</div><div>&nbsp;</div><div>&nbsp;&nbsp; &nbsp; &quot;0 */2 * * * &nbsp;/usr/bin/mlmmj-maintd -F -L /var/spool/mlmmj/mlmmj-test&quot;</div><div>&nbsp;</div><div>@@ -154,7 +154,7 @@</div><div>&nbsp;&nbsp; &nbsp; Subject: [mlmmj-test] how are we doing?</div><div>&nbsp;&nbsp; &nbsp; Simply do &#39;echo &quot;[mlmmj-test]&quot; &gt; control/prefix
</div><div>&nbsp;</div><div>- 9) For having a moderated list, simply create a file called &#39;moderated&#39; in the</div><div>+ 9) To create a moderated list, simply create a file called &#39;moderated&#39; in the</div><div>&nbsp;&nbsp; &nbsp; control/ directory. Moderators are added to a file called &#39;moderators&#39; in
</div><div>&nbsp;&nbsp; &nbsp; the control/ dir as well.</div><div>&nbsp;</div><div><br class="webkit-block-placeholder"></div></div>

------=_Part_17634_29774804.1201057352250--
