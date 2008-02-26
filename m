From: Thomas Jarosch <thomas.jarosch@intra2net.com>
Date: Tue, 26 Feb 2008 20:29:13 +0000
Subject: Re: [patch] Static bounce address
Message-Id: <20080226212913.of14a2quiktcksc0@intranator.m.i2n>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=_42p71k63oqdc"
List-Id: <mlmmj.mlmmj.org>
References: <20080223021959.85x4a8e6sick48gk@intranator.m.i2n>
In-Reply-To: <20080223021959.85x4a8e6sick48gk@intranator.m.i2n>
To: mlmmj@mlmmj.org

This message is in MIME format.

--=_42p71k63oqdc
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Hi mmj :-)

Quoting Mads Martin Joergensen <mmj@mmj.dk>:
> In strgen.h you'll see:
>
>  char *genlistname(const char *listaddr);
>  char *genlistfqdn(const char *listaddr);

Thanks for pointing this out. I took a closer look at the functions,
what do you think of the attached patch to protect
them against funny business?

Thomas

PS: Hope I won't double post again this time
as it happens sometimes when I'm using webmail...


--=_42p71k63oqdc
Content-Type: text/x-diff;
	charset=ISO-8859-1;
	name="mlmmj-protect-against-funny-business.patch"
Content-Disposition: attachment;
	filename="mlmmj-protect-against-funny-business.patch"
Content-Transfer-Encoding: quoted-printable

diff -u -r -p mlmmj-1.2.15/src/mlmmj-bounce.c mlmmj.bounceaddr/src/mlmmj-bou=
nce.c
--- mlmmj-1.2.15/src/mlmmj-bounce.c=09Sun Aug  6 10:36:47 2006
+++ mlmmj.bounceaddr/src/mlmmj-bounce.c=09Tue Feb 26 21:11:34 2008
@@ -86,6 +86,7 @@ char *fetchindexes(const char *bouncefil
 =09 =09=09continue;
=20
 =09=09colon =3D strchr(line, ':');
+=09=09MY_ASSERT(colon);
 =09=09*colon =3D '\0';
 =09=09s =3D indexstr;
 =09=09indexstr =3D concatstr(4, s, "        ", line, "\n");
@@ -314,6 +315,7 @@ int main(int argc, char **argv)
 =09=09=09exit(EXIT_SUCCESS);
=20
 =09=09a =3D strrchr(address, '@');
+=09=09MY_ASSERT(a);
 =09=09*a =3D '=3D';
 =09}
=20
diff -u -r -p mlmmj-1.2.15/src/mlmmj-maintd.c mlmmj.bounceaddr/src/mlmmj-mai=
ntd.c
--- mlmmj-1.2.15/src/mlmmj-maintd.c=09Wed Dec  6 14:19:09 2006
+++ mlmmj.bounceaddr/src/mlmmj-maintd.c=09Tue Feb 26 21:12:10 2008
@@ -244,6 +244,7 @@ int resend_queue(const char *listdir, co
=20
 =09=09if(strchr(dp->d_name, '.')) {
 =09=09=09ch =3D strrchr(mailname, '.');
+=09=09=09MY_ASSERT(ch);
 =09=09=09*ch =3D '\0';
 =09=09=09if(stat(mailname, &st) < 0) {
 =09=09=09=09if(errno =3D=3D ENOENT) {
diff -u -r -p mlmmj-1.2.15/src/mlmmj-send.c mlmmj.bounceaddr/src/mlmmj-send.=
c
--- mlmmj-1.2.15/src/mlmmj-send.c=09Mon Feb 25 19:21:09 2008
+++ mlmmj.bounceaddr/src/mlmmj-send.c=09Tue Feb 26 21:09:08 2008
 =09}
 =09*c =3D '\0';
 =09num =3D strrchr(myfrom, '-');
+=09MY_ASSERT(num);
 =09num++;
 =09c =3D strstr(myfrom, listdelim);
+=09MY_ASSERT(c);
 =09myfrom =3D strchr(c, '-');
+=09MY_ASSERT(myfrom);
 =09myfrom++;
 =09len =3D num - myfrom - 1;
 =09addr =3D mymalloc(len + 1);
@@ -1080,6 +1078,7 @@ int main(int argc, char **argv)
 =09=09=09/* error, so remove the probefile */
 =09=09=09tmpstr =3D mystrdup(to_addr);
 =09=09=09a =3D strchr(tmpstr, '@');
+=09=09=09MY_ASSERT(a);
 =09=09=09*a =3D '=3D';
 =09=09=09probefile =3D concatstr(4, listdir, "/bounce/", tmpstr,
 =09=09=09=09=09"-probe");
diff -u -r -p mlmmj-1.2.15/src/strgen.c mlmmj.bounceaddr/src/strgen.c
--- mlmmj-1.2.15/src/strgen.c=09Sun Jun 10 20:05:02 2007
+++ mlmmj.bounceaddr/src/strgen.c=09Tue Feb 26 21:20:39 2008
@@ -32,9 +32,11 @@
 #include <ctype.h>
 #include <errno.h>
=20
+#include "mlmmj.h"
 #include "strgen.h"
 #include "wrappers.h"
 #include "memory.h"
+#include "log_error.h"
=20
 char *random_str()
 {
@@ -57,6 +59,8 @@ char *random_plus_addr(const char *addr)
 =09snprintf(tmpstr, len, "%s", addr);
=20
 =09atsign =3D strchr(tmpstr, '@');
+=09MY_ASSERT(atsign);
+
 =09*atsign =3D '=3D';
=20
 =09snprintf(dest, len, "%x%x-%s", random_int(), random_int(), tmpstr);
@@ -82,6 +86,8 @@ char *genlistname(const char *listaddr)
 =09char *dest, *atsign;
=20
 =09atsign =3D strchr(listaddr, '@');
+=09MY_ASSERT(atsign);
+
 =09len =3D atsign - listaddr + 1;
 =09dest =3D mymalloc(len);
 =09
@@ -96,6 +102,8 @@ char *genlistfqdn(const char *listaddr)
 =09char *dest, *atsign;
=20
 =09atsign =3D strchr(listaddr, '@');
+=09MY_ASSERT(atsign);
+
 =09len =3D strlen(listaddr) - (atsign - listaddr);
 =09dest =3D mymalloc(len);
 =09snprintf(dest, len, "%s", atsign + 1);
@@ -143,9 +151,9 @@ char *hostnamestr()
=20
 =09for (;;) {
 =09=09len *=3D 2;
-=09=09free(hostname);
+=09=09myfree(hostname);
=20
-=09=09hostname =3D malloc(len);
+=09=09hostname =3D mymalloc(len);
 =09=09hostname[len-1] =3D '\0';
=20
 =09=09/* gethostname() is allowed to:
@@ -278,7 +286,7 @@ char *gendatestr()
 =09const char *weekday =3D NULL, *month =3D NULL;
=20
 =09/* 6 + 26 + ' ' + timezone which is 5 + '\n\0' =3D=3D 40 */
-=09timestr =3D (char *)malloc(40);
+=09timestr =3D (char *)mymalloc(40);
 =09t =3D time(NULL);
=20
 =09localtime_r(&t, &lttm);

--=_42p71k63oqdc--
