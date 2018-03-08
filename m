From: Per Jessen <per@opensuse.org>
Date: Thu, 08 Mar 2018 09:27:26 +0000
Subject: [mlmmj] bug in mlmmj-sub.c
Message-Id: <p7qvlv$7dp$1@saturn.local.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nextPart3036252.qZY5IRJjNx"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--nextPart3036252.qZY5IRJjNx
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

In mlmmj version 1.2.19 and 1.3.0.=20


--=20
Per Jessen, Z=C3=BCrich (5.5=C2=B0C)
Member, openSUSE Heroes

--nextPart3036252.qZY5IRJjNx
Content-Type: text/x-diff; name="mlmmj-sub.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="mlmmj-sub.diff"

--- mlmmj-sub.c=092012-03-27 04:08:44.000000000 +0200
+++ mlmmj-sub.c.pj=092018-03-08 10:23:26.634614784 +0100
@@ -92,7 +92,7 @@
 =09=09=09=09continue;
 =09=09=09}
 =09=09=09log_error(LOG_ARGS, "could not create %s"
-=09=09=09=09=09"ignoring request: %s", str);
+=09=09=09=09=09"ignoring request: %s", modfilename, str);
 =09=09=09exit(EXIT_FAILURE);
 =09=09}
 =09=09break;
@@ -100,7 +100,7 @@
=20
 =09if(writen(fd, str, strlen(str)) < 0) {
 =09=09log_error(LOG_ARGS, "could not write to %s"
-=09=09=09=09"ignoring request: %s", str);
+=09=09=09=09"ignoring request: %s", modfilename, str);
 =09=09exit(EXIT_FAILURE);
 =09}
 =09


--nextPart3036252.qZY5IRJjNx--


