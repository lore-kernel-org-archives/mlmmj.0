From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Wed, 04 May 2016 20:59:38 +0000
Subject: [mlmmj] Adding customheaders & footer to mlmmj list-control mails message
Message-Id: <robbat2-20160504T203222-118504689Z@orbis-terrarum.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Do4IU1xF/9sod/r6"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--Do4IU1xF/9sod/r6
Content-Type: multipart/mixed; boundary="IR1Y5IvQhrKgS4e6"
Content-Disposition: inline


--IR1Y5IvQhrKgS4e6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

We recently ran into a not-nice RBL situation with SORBS, where a
spamtrap address was forged as the source for an initial confirmation
message, as well as several help requests.

There was no way to know that the spamtrap address was forged, as it
came from a domain without any SPF, DKIM or DMARC, and the source IP
wasn't on any RBLs, nor was it a dialup/broadband system.

None of the list-control messages include the customheaders, so the
outgoing mail did not include the RFC2369 headers. The spamtrap was set
up to ignore mails containing such headers, but since they were missing,
our listserver got blacklisted :-(.

The source of the problem seems to be the second call to
do_all_the_voodoo_here in src/mlmmj-process.c, where both hdrfd and
footfd are passed as -1.

Attached is a quick patch that includes customheaders and footer in list
control messages.

The list control messages also don't respect the delheaders file, but
that's not an issue for our list usage, so I'm leaving that for somebody
else to fix.

--=20
Robin Hugh Johnson
Gentoo Linux: Developer, Infrastructure Lead, Foundation Trustee
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11ACBA4F 4778E3F6 E4EDF38E B27B944E 34884E85

--IR1Y5IvQhrKgS4e6
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="mlmmj-1.2.19.0-listcontrol-customheaders.patch"

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

--IR1Y5IvQhrKgS4e6--

--Do4IU1xF/9sod/r6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.1
Comment: Robbat2 @ Orbis-Terrarum Networks - The text below is a digital signature. If it doesn't make any sense to you, ignore it.

iKYEARECAGYFAlcqYrlfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3Bl
bnBncC5maWZ0aGhvcnNlbWFuLm5ldDc1OTQwNEJFQkQ0MUY3MTIzODIzODZFRjNF
OTIyQzIyMzIzM0MyMkMACgkQPpIsIjIzwixJywCgnciWxjkhu7ANZQx0xzWo1eAT
D5gAni/yJ9ajMdu2SAGZpSyuqQq9X8Hq
=WT3x
-----END PGP SIGNATURE-----

--Do4IU1xF/9sod/r6--

