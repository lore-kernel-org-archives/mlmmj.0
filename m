From: Thomas Goirand <thomas@goirand.fr>
Date: Sun, 22 Jan 2012 09:08:52 +0000
Subject: [mlmmj] [patch] man page fixes
Message-Id: <4F1BD224.40908@goirand.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090305070700060701010702"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------090305070700060701010702
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Please also apply these man page fixes. I'm currently adding this patch
in the Debian packaging to reduce lintian warnings which are quite
annoying me when working on MLMMJ: too many warnings, and I wont see
anything... By the way, hyphen-as-minus use are breaking groff
indentation, so it's a good thing to fix them.

Cheers,

Thomas Goirand (zigo)

--------------090305070700060701010702
Content-Type: text/x-diff;
 name="10_fix_manpages_syntax.diff"
Content-Disposition: attachment;
 filename="10_fix_manpages_syntax.diff"
Content-Transfer-Encoding: quoted-printable

From: Thomas Goirand <zigo@debian.org>
Subject: Fixes some of the manpages syntax
Description: Switched some UTF-8 chars and fixes some hyphen-used-as-minu=
s-sign
Forwarded: yes
diff -u -r -N a/man/mlmmj-bounce.1 b/man/mlmmj-bounce.1
--- a/man/mlmmj-bounce.1	2012-01-22 16:58:26.000000000 +0800
+++ b/man/mlmmj-bounce.1	2012-01-22 16:59:32.000000000 +0800
@@ -3,7 +3,7 @@
 mlmmj-bounce \- bounce handling utility for mlmmj
 .SH SYNOPSIS
 .B mlmmj-bounce
-\fI-L /path/to/list \fR[\fI-a john=3Ddoe.org | -d\fR]\fI \fR[\fI-n num |=
 -p\fR]
+\fI\-L /path/to/list \fR[\fI\-a john=3Ddoe.org | \-d\fR]\fI \fR[\fI\-n n=
um | \-p\fR]
 .HP
 \fB\-a\fR: Address string that bounces
 .HP
@@ -37,6 +37,6 @@
 .SH AUTHORS
 This manual page was written by the following persons:
 .HP
-S=F8ren Boll Overgaard <boll@debian.org> (based on html2man output)
+S=C3=B8ren Boll Overgaard <boll@debian.org> (based on html2man output)
 .HP
-Mads Martin J=F8rgensen <mmj@mmj.dk>
+Mads Martin J=C3=B8rgensen <mmj@mmj.dk>
diff -u -r -N a/man/mlmmj-maintd.1 b/man/mlmmj-maintd.1
--- a/man/mlmmj-maintd.1	2012-01-22 16:58:26.000000000 +0800
+++ b/man/mlmmj-maintd.1	2012-01-22 16:59:54.000000000 +0800
@@ -3,7 +3,7 @@
 mlmmj-maintd \- maintenance for mlmmj maintained lists
 .SH SYNOPSIS
 .B mlmmj-maintd
-[\fI-F\fR] \fI[-d\fR | \fI-L\fR] /path/to/dir
+[\fI\-F\fR] \fI[\-d\fR | \fI\-L\fR] /path/to/dir
 .HP
 \fB\-d\fR: Full path to directory with lists
 .HP
@@ -30,10 +30,10 @@
 crontab entry:
=20
 .LP
-0 */2 * * * /usr/bin/mlmmj-maintd -F -L /path/to/list
+0 */2 * * * /usr/bin/mlmmj\-maintd \-F \-L /path/to/list
 .SH AUTHORS
 This manual page was written by the following persons:
 .HP
-S=F8ren Boll Overgaard <boll@debian.org> (based on html2man output)
+S=C3=B8ren Boll Overgaard <boll@debian.org> (based on html2man output)
 .HP
-Mads Martin J=F8rgensen <mmj@mmj.dk>
+Mads Martin J=C3=B8rgensen <mmj@mmj.dk>
diff -u -r -N a/man/mlmmj-process.1 b/man/mlmmj-process.1
--- a/man/mlmmj-process.1	2012-01-22 16:58:26.000000000 +0800
+++ b/man/mlmmj-process.1	2012-01-22 16:58:57.000000000 +0800
@@ -3,7 +3,7 @@
 mlmmj-process \- process mail for an mlmmj managed mailinglist
 .SH SYNOPSIS
 .B mlmmj-process
-\fI-L /path/to/list -m /path/to/mail \fR[\fI-h\fR] [\fI-P\fR] [\fI-V\fR]
+\fI\-L /path/to/list \-m /path/to/mail \fR[\fI-h\fR] [\fI-P\fR] [\fI-V\f=
R]
 .HP
 \fB\-h\fR: This help
 .HP
@@ -61,6 +61,6 @@
 .SH AUTHORS
 This manual page was written by the following persons:
 .HP
-S=F8ren Boll Overgaard <boll@debian.org> (based on html2man output)
+S=C3=B8ren Boll Overgaard <boll@debian.org> (based on html2man output)
 .HP
-Mads Martin J=F8rgensen <mmj@mmj.dk>
+Mads Martin J=C3=B8rgensen <mmj@mmj.dk>
diff -u -r -N a/man/mlmmj-recieve.1 b/man/mlmmj-recieve.1
--- a/man/mlmmj-recieve.1	2012-01-22 16:58:26.000000000 +0800
+++ b/man/mlmmj-recieve.1	2012-01-22 16:58:57.000000000 +0800
@@ -21,7 +21,7 @@
 using mailservers supporting the \fB/etc/aliases\fR file, a line to acti=
vate
 an mlmmj managed mailinglist would look like this:
 .LP
-list: "|/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/list/"
+list: "|/usr/bin/mlmmj\-recieve \-L /var/spool/mlmmj/list/"
=20
 It's very important to specify the full path to the binary, or the maili=
nglist
 will not function.
@@ -36,6 +36,6 @@
 .SH AUTHORS
 This manual page was written by the following persons:
 .HP
-S=F8ren Boll Overgaard <boll@debian.org> (based on html2man output)
+S=C3=B8ren Boll Overgaard <boll@debian.org> (based on html2man output)
 .HP
-Mads Martin J=F8rgensen <mmj@mmj.dk>
+Mads Martin J=C3=B8rgensen <mmj@mmj.dk>
diff -u -r -N a/man/mlmmj-send.1 b/man/mlmmj-send.1
--- a/man/mlmmj-send.1	2012-01-22 16:58:26.000000000 +0800
+++ b/man/mlmmj-send.1	2012-01-22 16:58:57.000000000 +0800
@@ -62,6 +62,6 @@
 .SH AUTHORS
 This manual page was written by the following persons:
 .HP
-S=F8ren Boll Overgaard <boll@debian.org> (based on html2man output)
+S=C3=B8ren Boll Overgaard <boll@debian.org> (based on html2man output)
 .HP
-Mads Martin J=F8rgensen <mmj@mmj.dk>
+Mads Martin J=C3=B8rgensen <mmj@mmj.dk>
diff -u -r -N a/man/mlmmj-sub.1 b/man/mlmmj-sub.1
--- a/man/mlmmj-sub.1	2012-01-22 16:58:26.000000000 +0800
+++ b/man/mlmmj-sub.1	2012-01-22 16:58:57.000000000 +0800
@@ -3,8 +3,8 @@
 mlmmj-sub \- subscribe address to a mailinglist run by mlmmj
 .SH SYNOPSIS
 .B mlmmj-sub
-\fI-L /path/to/list -a john@doe.org \fR[\fI-c\fR | \fI-C\fR] \fR[\fI-d\f=
R | \fI-n\fR]
-[\fI-h\fR] [\fI-U\fR] [\fI-V\fR]
+\fI\-L /path/to/list \-a john@doe.org \fR[\fI\-c\fR | \fI\-C\fR] \fR[\fI=
\-d\fR | \fI\-n\fR]
+[\fI\-h\fR] [\fI\-U\fR] [\fI\-V\fR]
 .HP
 \fB\-a\fR: Email address to subscribe
 .HP
@@ -51,6 +51,6 @@
 .SH AUTHORS
 This manual page was written by the following persons:
 .HP
-S=F8ren Boll Overgaard <boll@debian.org> (based on html2man output)
+S=C3=B8ren Boll Overgaard <boll@debian.org> (based on html2man output)
 .HP
-Mads Martin J=F8rgensen <mmj@mmj.dk>
+Mads Martin J=C3=B8rgensen <mmj@mmj.dk>
diff -u -r -N a/man/mlmmj-unsub.1 b/man/mlmmj-unsub.1
--- a/man/mlmmj-unsub.1	2012-01-22 16:58:26.000000000 +0800
+++ b/man/mlmmj-unsub.1	2012-01-22 16:58:57.000000000 +0800
@@ -1,10 +1,10 @@
 .TH mlmmj-unsub "1" "September 2004" mlmmj-unsub
 .SH NAME
-mlmmj-unsub \- manual page for mlmmj-unsub
+mlmmj-unsub \- unsubscribe someone from a list
 .SH SYNOPSIS
 .B mlmmj-sub
-\fI-L /path/to/list -a john@doe.org \fR[\fI-c\fR | \fI-C\fR] [\fI-h\fR]
-\fR[\fI-d\fR | \fI-n\fR] [\fI-V\fR]
+\fI\-L /path/to/list \-a john@doe.org \fR[\fI\-c\fR | \fI\-C\fR] [\fI\-h=
\fR]
+\fR[\fI\-d\fR | \fI\-n\fR] [\fI\-V\fR]
 .HP
 \fB\-a\fR: Email address to unsubscribe
 .HP
@@ -45,6 +45,6 @@
 .SH AUTHORS
 This manual page was written by the following persons:
 .HP
-S=F8ren Boll Overgaard <boll@debian.org> (based on html2man output)
+S=C3=B8ren Boll Overgaard <boll@debian.org> (based on html2man output)
 .HP
-Mads Martin J=F8rgensen <mmj@mmj.dk>
+Mads Martin J=C3=B8rgensen <mmj@mmj.dk>

--------------090305070700060701010702--

