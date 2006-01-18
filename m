From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Wed, 18 Jan 2006 23:37:06 +0000
Subject: Re: mlmmj-recieve silently discarding messages (Re: Is anyone
Message-Id: <20060119003706.v074j1ahw44cs048@mail.n0rd.dk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=_6an89im6imo8"
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
To: mlmmj@mlmmj.org

This message is in MIME format.

--=_6an89im6imo8
Content-Type: text/plain;
	charset=ISO-8859-1;
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Quoting Charlie Brady <charlieb@budge.apana.org.au>:
> Without any log file information at all, and with a "success"
> status, it's difficult to know what is wrong.

True.

> IMO this silent (non-)success is a significant design flaw.

I don't think it is a *significant* design flaw, but what do I know.

The attached patch adds log messages at all points where a mail is 
discarded. Could you please try it, and see if it helps you?

Morten

--=_6an89im6imo8
Content-Type: text/plain;
	charset=ISO-8859-1;
	name="discard-logmsg.diff"
Content-Disposition: attachment;
	filename="discard-logmsg.diff"
Content-Transfer-Encoding: 7bit

diff -u -r1.73 mlmmj-process.c
--- mlmmj-process.c	17 Jan 2006 12:07:51 -0000	1.73
+++ mlmmj-process.c	18 Jan 2006 23:32:21 -0000
@@ -609,6 +609,9 @@
 		discardname = concatstr(3, listdir,
 				"/queue/discarded/",
 				randomstr);
+		log_error(LOG_ARGS, "Discarding %s due to invalid envelope"
+				" from email count (was %d, must be 1)",
+				mailfile, efromemails.emailcount);
 		rename(mailfile, discardname);
 		unlink(donemailname);
 		myfree(donemailname);
@@ -654,6 +657,11 @@
 		 */
 		if ((strcasecmp(listaddr, fromemails.emaillist[0]) == 0) ||
 				notoccdenymails) {
+			log_error(LOG_ARGS, "Discarding %s because list"
+					" address was not in To: or Cc:,"
+					" and From: was the list or"
+					" notoccdenymails was set",
+					mailfile);
 			myfree(listaddr);
 			unlink(donemailname);
 			myfree(donemailname);
@@ -691,6 +699,10 @@
 		/* Don't send a mail about denial to the list, but silently
 		 * discard and exit. */
 		if (strcasecmp(listaddr, fromemails.emaillist[0]) == 0) {
+			log_error(LOG_ARGS, "Discarding %s because"
+					" subonlypost was set and From: was"
+					" the list address",
+					mailfile);
 			myfree(listaddr);
 			unlink(donemailname);
 			myfree(donemailname);
@@ -698,6 +710,10 @@
 		}
 		if(is_subbed(listdir, fromemails.emaillist[0]) != 0) {
 			if(nosubonlydenymails) {
+				log_error(LOG_ARGS, "Discarding %s because"
+						" subonlypost and"
+						" nosubonlydenymails was set",
+						mailfile);
 				myfree(listaddr);
 				unlink(donemailname);
 				myfree(donemailname);
@@ -741,6 +757,12 @@
 		if (accret == DENY) {
 			if ((strcasecmp(listaddr, fromemails.emaillist[0]) ==
 						0) || noaccessdenymails) {
+				log_error(LOG_ARGS, "Discarding %s because"
+						" it was denied by an access"
+						" rule, and From: was the list"
+						" address or noaccessdenymails"
+						" was set",
+						mailfile);
 				myfree(listaddr);
 				unlink(donemailname);
 				myfree(donemailname);

--=_6an89im6imo8--
