From: Thomas Jarosch <thomas.jarosch@intra2net.com>
Date: Tue, 26 Feb 2008 21:47:14 +0000
Subject: Re: [patch] Static bounce address
Message-Id: <20080226224714.fquucio0y1s2sw8o@intranator.m.i2n>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=_8hi5jkvgtls"
List-Id: <mlmmj.mlmmj.org>
References: <20080223021959.85x4a8e6sick48gk@intranator.m.i2n>
In-Reply-To: <20080223021959.85x4a8e6sick48gk@intranator.m.i2n>
To: mlmmj@mlmmj.org

This message is in MIME format.

--=_8hi5jkvgtls
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Hi Morten,

> I think it would be better to keep the bounce information, and have the
> bounce mail go to
>
> something+1464-morten=afdelingp.dk@example.com
>
> That way you can both control where bounces are sent, and see who is
> bouncing. Could I convince you to make the patch so?

Please have a look at the new version of the patch.
I also did some cleanup in bounce_from_adr()
while I was extending the code.

Thomas


--=_8hi5jkvgtls
Content-Type: text/x-diff;
	charset=ISO-8859-1;
	name="mlmmj-staticbounceaddr-v2.patch"
Content-Disposition: attachment;
	filename="mlmmj-staticbounceaddr-v2.patch"
Content-Transfer-Encoding: quoted-printable

--- mlmmj-1.2.15/src/mlmmj-send.c=09Wed Dec  6 14:19:10 2006
+++ mlmmj.bounceaddr/src/mlmmj-send.c=09Tue Feb 26 22:30:58 2008
@@ -102,10 +102,13 @@ char *get_index_from_filename(const char
 }
=20
 char *bounce_from_adr(const char *recipient, const char *listadr,
-=09=09      const char *listdelim, const char *mailfilename)
+=09=09      const char *listdelim, const char *mailfilename,
+=09=09      const char *listdir)
 {
-=09char *bounceaddr, *myrecipient, *mylistadr, *mylistdelim;
+=09char *bounceaddr, *myrecipient, *mylistadr;
 =09char *indexstr, *listdomain, *a =3D NULL, *mymailfilename;
+=09char *staticbounceaddr, *staticbounceaddr_localpart;
+=09char *staticbounceaddr_domain;
 =09size_t len;
=20
 =09mymailfilename =3D mystrdup(mailfilename);
@@ -114,6 +117,10 @@ char *bounce_from_adr(const char *recipi
 =09}
=20
 =09indexstr =3D get_index_from_filename(mymailfilename);
+=09if (!indexstr) {
+=09=09myfree(mymailfilename);
+=09=09return NULL;
+=09}
=20
 =09myrecipient =3D mystrdup(recipient);
 =09if (!myrecipient) {
@@ -131,40 +138,57 @@ char *bounce_from_adr(const char *recipi
 =09=09return NULL;
 =09}
=20
-=09mylistdelim =3D mystrdup(listdelim);
-=09if (!mylistdelim) {
-=09=09myfree(mymailfilename);
-=09=09myfree(myrecipient);
-=09=09myfree(mylistadr);
-=09=09return NULL;
-=09}
-
 =09listdomain =3D strchr(mylistadr, '@');
 =09if (!listdomain) {
 =09=09myfree(mymailfilename);
 =09=09myfree(myrecipient);
 =09=09myfree(mylistadr);
-=09=09myfree(mylistdelim);
 =09=09return NULL;
 =09}
 =09*listdomain++ =3D '\0';
=20
 =09/* 11 =3D "bounces-" + "-" + "@" + NUL */
-=09len =3D strlen(mylistadr) + strlen(mylistdelim) + strlen(myrecipient)
-=09=09 + strlen(indexstr) + strlen(listdomain) + 11;
+=09len =3D strlen(mylistadr) + strlen(listdelim) + strlen(myrecipient)
+=09=09   + strlen(indexstr) + strlen(listdomain) + 11;
+
+=09staticbounceaddr =3D ctrlvalue(listdir, "staticbounceaddr");
+=09if (staticbounceaddr) {
+=09=09staticbounceaddr_localpart =3D genlistname(staticbounceaddr);
+=09=09staticbounceaddr_domain =3D genlistfqdn(staticbounceaddr);
+
+=09=09/* localpart + "-" + domain */
+=09=09len +=3D strlen(staticbounceaddr_localpart) + 1
+=09=09=09=09+ strlen(staticbounceaddr_domain);
+=09} else {
+=09=09staticbounceaddr_localpart =3D NULL;
+=09=09staticbounceaddr_domain =3D NULL;
+=09}
+
 =09bounceaddr =3D mymalloc(len);
 =09if (!bounceaddr) {
+=09=09myfree(staticbounceaddr);
+=09=09myfree(staticbounceaddr_localpart);
+=09=09myfree(staticbounceaddr_domain);
 =09=09myfree(myrecipient);
 =09=09myfree(mylistadr);
-=09=09myfree(mylistdelim);
 =09=09return NULL;
 =09}
-=09snprintf(bounceaddr, len, "%s%sbounces-%s-%s@%s", mylistadr, listdelim,
-=09=09 indexstr, myrecipient, listdomain);
+
+=09if (staticbounceaddr) {
+=09=09snprintf(bounceaddr, len, "%s%s%s-bounces-%s-%s@%s",=20
+=09=09=09staticbounceaddr_localpart, listdelim, mylistadr,
+=09=09=09indexstr, myrecipient, staticbounceaddr_domain);
+
+=09=09myfree(staticbounceaddr);
+=09=09myfree(staticbounceaddr_localpart);
+=09=09myfree(staticbounceaddr_domain);
+=09} else {
+=09=09snprintf(bounceaddr, len, "%s%sbounces-%s-%s@%s", mylistadr, listdeli=
m,
+=09=09=09indexstr, myrecipient, listdomain);
+=09}
=20
 =09myfree(myrecipient);
 =09myfree(mylistadr);
-=09myfree(mylistdelim);
 =09myfree(indexstr);
 =09myfree(mymailfilename);
=20
@@ -629,7 +656,7 @@ int send_mail_many_list(int sockfd, cons
 =09=09=09=09=09    hdrs, hdrslen, body, bodylen);
 =09=09} else {
 =09=09=09bounceaddr =3D bounce_from_adr(addr, listaddr, listdelim,
-=09=09=09=09=09=09     archivefilename);
+=09=09=09=09=09=09     archivefilename, listdir);
 =09=09=09res =3D send_mail(sockfd, bounceaddr, addr, replyto,
 =09=09=09=09  mailmap, mailsize, listdir, mlmmjbounce,
 =09=09=09=09  hdrs, hdrslen, body, bodylen);
@@ -929,7 +956,7 @@ int main(int argc, char **argv)
 =09=09deletewhensent =3D 0;
 =09=09archivefilename =3D mystrdup(mailfilename);
 =09=09bounceaddr =3D bounce_from_adr(to_addr, listaddr, listdelim,
-=09=09=09=09=09=09archivefilename);
+=09=09=09=09=09=09archivefilename, listdir);
 =09=09break;
 =09default: /* normal list mail -- now handled when forking */
 =09=09addtohdr =3D statctrl(listdir, "addtohdr");
--- mlmmj-1.2.15/TUNABLES=09Sat Mar  3 18:21:58 2007
+++ mlmmj.bounceaddr/TUNABLES=09Tue Feb 26 22:34:44 2008
@@ -192,3 +192,9 @@ to specify several entries (one pr. line
=20
    If this is set, no reject notifications caused by violation of maxmailsi=
ze
    will be sent.
+
+ =B7 staticbounceaddr      =09(normal)
+
+   If this is set to something@domain.com, the bounce address (Return-Path:=
)
+   will be fixed to something+listname-bounces-and-so-on@domain.com
+   in case you need to disable automatic bounce handling.

--=_8hi5jkvgtls--
