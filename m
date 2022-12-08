From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Thu, 08 Dec 2022 01:13:26 +0000
Subject: [mlmmj] mlmmj patches from distributions: Gentoo
Message-Id: <robbat2-20221208T005748-436219077Z@orbis-terrarum.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="SHKmlYlMYyef/536"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--SHKmlYlMYyef/536
Content-Type: multipart/mixed; boundary="WyNvStzeiXhol8Xl"
Content-Disposition: inline


--WyNvStzeiXhol8Xl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

It's great to see more active development again.
Gentoo Linux still runs mlmmj for all our lists, and we've got some
patches that would be great to land upstream.

mlmmj-1.3.0-gcc-10.patch - GCC 10 fix

mlmmj-1.2.19.0-listcontrol-customheaders.patch
Include the customheaders file content in list control messages.

mlmmj-1.3.0-logging.patch - this is a brand new patch, not tested yet.
When dropping messages from non-subscribers, we wanted a better trail
about it. Ideally we'd=20
1) log the message-id
2) give a per-message SMTP-time rejection (need postfix filter stuff)

There's one scaling discussion we need to have, but the handling needs
to include how to incrementally get there:

How to have millions of mails in /archive/!

Our most active list is now approaching 1.5M emails in that directory,
and it worries me.

--=20
Robin Hugh Johnson
Gentoo Linux: Dev, Infra Lead, Foundation Treasurer
E-Mail   : robbat2@gentoo.org
GnuPG FP : 11ACBA4F 4778E3F6 E4EDF38E B27B944E 34884E85
GnuPG FP : 7D0B3CEB E9B85B1F 825BCECF EE05E6F6 A48F6136

--WyNvStzeiXhol8Xl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mlmmj-1.3.0-logging.patch"
Content-Transfer-Encoding: quoted-printable

On a high-mail system, it's hard to link errors back to specific mails.
Log the list address, poster address and envelope to aid that.

Better work here would be capturing the message-id and logging that, but it=
's
not presently captured, so that is a more invasive change.

Signed-off-by: Robin H. Johnson <robbat2@gentoo.org>

--- mlmmj-1.3.0.orig/src/mlmmj-process.c	2022-11-24 16:09:30.839848253 -0800
+++ mlmmj-1.3.0/src/mlmmj-process.c	2022-11-24 16:52:32.311365699 -0800
@@ -193,7 +193,8 @@ static void newmoderated(const char *lis
 	if (notifymod) {
 		childpid =3D fork();
 		if(childpid < 0)
-			log_error(LOG_ARGS, "Could not fork; poster not notified");
+			log_error(LOG_ARGS, "Could not fork; poster not notified"
+ 					"; list=3D%s poster=3D%s envelope=3D%s", listaddr, posteraddr, efrom=
sender);
 	} else
 		childpid =3D -1;
=20
@@ -919,8 +920,10 @@ int main(int argc, char **argv)
 			log_error(LOG_ARGS, "Discarding %s because list"
 					" address was not in To: or Cc:,"
 					" and From: was the list or"
-					" notoccdenymails was set",
-					mailfile);
+					" notoccdenymails was set"
+ 					"; list=3D%s poster=3D%s envelope=3D%s",
+					mailfile,
+					listaddr, posteraddr, efrom);
 			myfree(listaddr);
 			unlink(donemailname);
 			myfree(donemailname);
@@ -971,8 +974,10 @@ int main(int argc, char **argv)
 					" it was denied by an access"
 					" rule, and From: was the list"
 					" address or noaccessdenymails"
-					" was set",
-					mailfile);
+					" was set"
+ 					"; list=3D%s poster=3D%s envelope=3D%s",
+					mailfile,
+					listaddr, posteraddr, efrom);
 				myfree(listaddr);
 				unlink(donemailname);
 				myfree(donemailname);
@@ -1046,8 +1051,10 @@ int main(int argc, char **argv)
 		if (strcasecmp(listaddr, posteraddr) =3D=3D 0) {
 			log_error(LOG_ARGS, "Discarding %s because"
 					" there are sender restrictions but"
-					" From: was the list address",
-					mailfile);
+					" From: was the list address"
+ 					"; list=3D%s poster=3D%s envelope=3D%s",
+					mailfile,
+					listaddr, posteraddr, efrom);
 			myfree(listaddr);
 			unlink(donemailname);
 			myfree(donemailname);
@@ -1072,8 +1079,10 @@ int main(int argc, char **argv)
 				    (modonlypost &&
 				    statctrl(listdir, "nomodonlydenymails"))) {
 				log_error(LOG_ARGS, "Discarding %s because"
-					" no{sub|mod}onlydenymails was set",
-					mailfile);
+					" no{sub|mod}onlydenymails was set"
+ 					"; list=3D%s poster=3D%s envelope=3D%s",
+					mailfile,
+					listaddr, posteraddr, efrom);
 				myfree(listaddr);
 				unlink(donemailname);
 				myfree(donemailname);

--WyNvStzeiXhol8Xl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mlmmj-1.3.0-gcc-10.patch"
Content-Transfer-Encoding: quoted-printable

--- a/include/mlmmj.h
+++ b/include/mlmmj.h
@@ -81,7 +81,7 @@ enum subtype {
 	SUB_NONE /* For when an address is not subscribed at all */
 };
=20
-char *subtype_strs[7]; /* count matches enum above; defined in subscriberf=
uncs.c */
+extern char *subtype_strs[7]; /* count matches enum above; defined in subs=
criberfuncs.c */
=20
 enum subreason {
 	SUB_REQUEST,
@@ -92,7 +92,7 @@ enum subreason {
 	SUB_SWITCH
 };
=20
-char * subreason_strs[6]; /* count matches enum above; defined in subscrib=
erfuncs.c */
+extern char * subreason_strs[6]; /* count matches enum above; defined in s=
ubscriberfuncs.c */
=20
 void print_version(const char *prg);
=20

--WyNvStzeiXhol8Xl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="mlmmj-1.2.19.0-listcontrol-customheaders.patch"

List control emails do not include customheaders, and can lead to RBL issues
for forged senders.

Signed-off-by: Robin H. Johnson <robbat2@gentoo.org>

diff -Nuar --exclude '*~' mlmmj-1.2.19.0.orig/src/mlmmj-process.c mlmmj-1.2.19.0/src/mlmmj-process.c
--- mlmmj-1.2.19.0.orig/src/mlmmj-process.c	2014-03-23 17:57:24.000000000 -0700
+++ mlmmj-1.2.19.0/src/mlmmj-process.c	2016-05-04 13:50:26.034174788 -0700
@@ -702,8 +702,19 @@
 						    "output mail file");
 				exit(EXIT_FAILURE);
 			}
-			if(do_all_the_voodoo_here(rawmailfd, donemailfd, -1,
-					-1, delheaders,
+			/* hdrfd is checked in do_all_the_voodoo_here(), because the
+			 * customheaders file might not exist */
+			headerfilename = concatstr(2, listdir, "/control/customheaders");
+			hdrfd = open(headerfilename, O_RDONLY);
+			myfree(headerfilename);
+
+			/* footfd is checked in do_all_the_voodoo_here(), see above */
+			footerfilename = concatstr(2, listdir, "/control/footer");
+			footfd = open(footerfilename, O_RDONLY);
+			myfree(footerfilename);
+
+			if(do_all_the_voodoo_here(rawmailfd, donemailfd, hdrfd,
+					footfd, delheaders,
 					NULL, &allheaders, NULL) < 0) {
 				log_error(LOG_ARGS, "do_all_the_voodoo_here");
 				exit(EXIT_FAILURE);

--WyNvStzeiXhol8Xl--

--SHKmlYlMYyef/536
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Robbat2 @ Orbis-Terrarum Networks - The text below is a digital signature. If it doesn't make any sense to you, ignore it.

iQKTBAABCgB9FiEEveu2pS8Vb98xaNkRGTlfI8WIJsQFAmOROjRfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEJE
RUJCNkE1MkYxNTZGREYzMTY4RDkxMTE5Mzk1RjIzQzU4ODI2QzQACgkQGTlfI8WI
JsSn6A/5AeA8ZuVS7d85ZE4oR4e6XADSpkTOSnfGt6gU4DPlFsEGlwgmnN+QSPrt
DCtUpVVzk/YKaS+r1ymnI0VE5baAFBz3JpHiWk3HC7ql3MCocGe3Auis73bVCHdx
PXDGx2lzT2Yxr4cVLuys1161Rfq2LVY8EKIJFScK+YFPt1PC59jXgXyL4O9h50ae
TwOcSFcSnP8FuHI0Jdhr5R+nw7KxjJVm+UrKiq4VLVxxiTWjG26vDPZ3hbPtdCPh
VhJqGCQGqNs76eNe+aNoE8f67fu8hBZJDLthLZNVG6NqsvDrzH01FIHYtrLkzq/m
CCDUNpxeXJ0/+FLDQSNBPjRqTAkUUIHQvhjpdQKdf1fKqbymeqMciUoZhUe161a5
TyODyY7pN2xa5KKap+eVfqsmvy4mpR85oy3al8STHkXk6H3rDm06QnRNDYyzIPJZ
FDyzA571H8O72RQ39cSrnjwgiqnHjchJwVoFuOM7AN8KE5ev10Be4Jo/+8txzll9
v7FKHM6mmeFyQY6/ECwhYu7tdE/0SFYgpYKVZVqyyb8EGE2xPagPooBmZzxkMybp
fs4v4EiUaLc3S2Fnl1O0H9ESe/HgAQItdM3s8eylqpKkAkAWn26bykEbt0++9a2z
xQgUZQT8xBM7hGHmulQIxAhkYConxvyv2R+snInrueu39U/BPWY=
=z9s3
-----END PGP SIGNATURE-----

--SHKmlYlMYyef/536--

