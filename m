Return-Path: <mlmmj+bounces-3090-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36192F3D5F6
	for <mlmmj@archiver.kernel.org>; Sun, 29 Mar 2026 08:20:40 +0000 (UTC)
Received: from localhost ([127.0.0.1]:38488 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3090-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1w6lAq-00Awmi-3A
	for mlmmj@archiver.kernel.org;
	Sun, 29 Mar 2026 08:07:09 +0000
Received: from b.nours.eu ([54.38.177.57]:52277)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <bapt@nours.eu>)
	id 1w6lAj-00Awm0-2r
	for mlmmj@mlmmj.org;
	Sun, 29 Mar 2026 08:07:01 +0000
Received: from mail.nours.eu (b.nours.eu [54.38.177.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by b.nours.eu (Postfix) with ESMTPSA id 58C12EEF60
	for <mlmmj@mlmmj.org>; Sun, 29 Mar 2026 10:13:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1774772035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pjzoYcEAd561rwx3haju5ALGpFEIBBSYMHl6rUW03Vc=;
	b=Fon1oJj8vuE1S/eoSabYVA44tttcktrFE122VgJo/Sr9dqHbo5o6d8vvnMsG5IwQ5RVDp4
	P9rIoMldAdNE7D3PGHthWHG2nrtF51FYtWs4JIXXBf5ytwmdxXyVNAqSBLeRoIt/g40JH1
	zOhX/dJh1l+2/2aSZaZBXM8EKDZwmKykoVdTccAE5dLttnc+ai+zo0JzOsL26SiH/J36Qf
	kYNWeQ296FvG9dfhMuUCpyqiK0/Cjak/QOBuM6Kl/nc7df0JIm9MCxsQpLXVJ48BzHRQCQ
	o+LEEG8zTQ18YDgtTn+npuw2Ei/m7qRl/P0cCdMZiJJQhyakikY6PON5ERu0wg==
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Date: Sun, 29 Mar 2026 08:13:54 +0000
Content-Type: multipart/alternative;
 boundary="8d20f052-76de-444a-a329-17c7f60535ad-1"
From: "Baptiste Daroussin" <bapt@nours.eu>
Message-ID: <362a66a2c2eb55ecd94e6cc97bcf36ae035867d5@nours.eu>
TLS-Required: No
Subject: Re: [PATCH] Support display name substitution in customheaders
To: mlmmj@mlmmj.org
In-Reply-To: <83Su95j/WN8QKsJA6dPhlkwgNx6bkcF5@etherlight.link>
References: <83Su95j/WN8QKsJA6dPhlkwgNx6bkcF5@etherlight.link>

--8d20f052-76de-444a-a329-17c7f60535ad-1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thank you, I will have a look at it asap, and see integrate it if possibl=
e in 2.0.0 which I intend to release soon

Best regards,
Bapt


March 27, 2026 at 7:14 PM, "Lumin Etherlight" <lumin+mlmmj@etherlight.lin=
k mailto:lumin+mlmmj@etherlight.link?to=3D%22Lumin%20Etherlight%22%20%3Cl=
umin%2Bmlmmj%40etherlight.link%3E > wrote:


>=20
>=20Allow substitution of the variable $postername$ for
> the display name of the user. The display name is
> extracted from the sender's From: header. If a name
> is not found, then this variable is substituted for
> user's address, i.e. the same value as $posteraddr$.
> Proper handling of comments, and quoted strings, in
> the From: address is also included.
>=20
>=20This allows the following `customheaders' use-case:
>=20
>=20 From: $postername$ via Project-List <project-list@example.com>
>=20
>=20Which would render, for example, as:
>=20
>=20 From: John Doe via Project-List <project-list@example.com>
>=20
>=20For the user:
>=20
>=20 John Doe <john@example.com>.
> ---
>  AUTHORS | 1 +
>  include/find_email_adr.h | 1 +
>  include/wrappers.h | 2 +-
>  src/do_all_the_voodoo_here.c | 22 ++++++++++++---
>  src/dumpfd2fd.c | 14 +++++++++-
>  src/find_email_adr.c | 52 ++++++++++++++++++++++++++++++++++++
>  6 files changed, 86 insertions(+), 6 deletions(-)
>=20
>=20diff --git a/AUTHORS b/AUTHORS
> index be21ced..9d9b7df 100644
> --- a/AUTHORS
> +++ b/AUTHORS
> @@ -1,3 +1,4 @@
>  Mads Martin Joergensen <mmj@mmj.dk>
>  Morten K. Poulsen <morten@afdelingp.dk>
>  Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
> +Lumin Etherlight <lumin+mlmmj@etherlight.link>
> diff --git a/include/find_email_adr.h b/include/find_email_adr.h
> index e5da89b..707fdd6 100644
> --- a/include/find_email_adr.h
> +++ b/include/find_email_adr.h
> @@ -27,5 +27,6 @@
>  #include <stddef.h>
>=20=20
>=20 strlist *find_email_adr(const char *str, strlist *retval);
> +char *find_display_name(char *name);
>=20=20
>=20 #endif /* FIND_EMAIL_ADR_H */
> diff --git a/include/wrappers.h b/include/wrappers.h
> index 2953bd2..5a2c144 100644
> --- a/include/wrappers.h
> +++ b/include/wrappers.h
> @@ -31,6 +31,6 @@ ssize_t readn(int fd, void *vptr, size_t n);
>  int random_int(void);
>  int dumpfd2fd(int infd, int outfd);
>  int copy_file(int infd, int outfd, size_t bufsiz);
> -int process_headers(int infd, FILE *outf, const char *from);
> +int process_headers(int infd, FILE *outf, const char *from, const char=
 *name);
>=20=20
>=20 #endif /* WRAPPERS_H */
> diff --git a/src/do_all_the_voodoo_here.c b/src/do_all_the_voodoo_here.=
c
> index 13aeb74..14214a8 100644
> --- a/src/do_all_the_voodoo_here.c
> +++ b/src/do_all_the_voodoo_here.c
> @@ -80,6 +80,7 @@ int do_all_the_voodoo_here(int infd, int outfd, int h=
drfd, int footfd,
>  char *hdrline, *unfolded, *unqp;
>  strlist allunfoldeds =3D tll_init();
>  char *posteraddr =3D NULL;
> + char *postername =3D NULL;
>  bool hdrsadded =3D false;
>  bool subject_present =3D false;
>  int dupfd =3D dup(infd);
> @@ -111,9 +112,16 @@ int do_all_the_voodoo_here(int infd, int outfd, in=
t hdrfd, int footfd,
>  if(hdrfd >=3D 0) {
>  strlist fromemails =3D tll_init();
>  if ( readhdrs[0].valuecount =3D=3D 1 ) {
> - find_email_adr(readhdrs[0].values[0], &fromemails);
> - if (tll_length(fromemails) > 0)
> + find_email_adr(readhdrs[0].values[0], &fromemails);
> + if (tll_length(fromemails) > 0) {
>  posteraddr =3D xstrdup(tll_front(fromemails));
> + postername =3D find_display_name(readhdrs[0].values[0]);
> + if (!postername) {
> + postername =3D posteraddr ?
> + xstrdup(posteraddr) :
> + xcalloc(1, 1);
> + }
> + }
>  }
>  tll_free_and_free(fromemails, free);
>  }
> @@ -129,12 +137,13 @@ int do_all_the_voodoo_here(int infd, int outfd, i=
nt hdrfd, int footfd,
>  if(!hdrsadded &&
>  ( strncasecmp(hdrline, "mime", 4) =3D=3D 0)) {
>  if(hdrfd >=3D 0) {
> - if(process_headers(hdrfd,outf,posteraddr ? posteraddr : "") < 0) {
> + if(process_headers(hdrfd,outf,posteraddr ? posteraddr : "", posternam=
e ) < 0) {
>  log_error(LOG_ARGS, "Could not "
>  "add extra headers");
>  free(unfolded);
>  tll_free_and_free(allunfoldeds, free);
>  free(posteraddr);
> + free(postername);
>  fclose(outf);
>  fclose(f);
>  return -1;
> @@ -174,11 +183,12 @@ int do_all_the_voodoo_here(int infd, int outfd, i=
nt hdrfd, int footfd,
>=20=20
>=20 if(!hdrsadded ) {
>  if(hdrfd >=3D 0) {
> - if(process_headers(hdrfd,outf,posteraddr ? posteraddr : "") < 0) {
> + if(process_headers(hdrfd,outf,posteraddr ? posteraddr : "", posternam=
e) < 0) {
>  log_error(LOG_ARGS, "Could not "
>  "add extra headers");
>  tll_free_and_free(allunfoldeds, free);
>  free(posteraddr);
> + free(postername);
>  fclose(outf);
>  fclose(f);
>  return -1;
> @@ -195,6 +205,7 @@ int do_all_the_voodoo_here(int infd, int outfd, int=
 hdrfd, int footfd,
>  tll_free_and_free(allunfoldeds, free);
>  log_error(LOG_ARGS, "Error writing hdrs.");
>  free(posteraddr);
> + free(postername);
>  fclose(outf);
>  fclose(f);
>  return -1;
> @@ -209,6 +220,7 @@ int do_all_the_voodoo_here(int infd, int outfd, int=
 hdrfd, int footfd,
>  if(dumpfd2fd(infd, outfd) < 0) {
>  log_error(LOG_ARGS, "Error when dumping rest of mail");
>  free(posteraddr);
> + free(postername);
>  fclose(f);
>  return -1;
>  }
> @@ -219,11 +231,13 @@ int do_all_the_voodoo_here(int infd, int outfd, i=
nt hdrfd, int footfd,
>  if(dumpfd2fd(footfd, outfd) < 0) {
>  log_error(LOG_ARGS, "Error when adding footer");
>  free(posteraddr);
> + free(postername);
>  return -1;
>  }
>=20=20
>=20 fsync(outfd);
>=20=20
>=20 free(posteraddr);
> + free(postername);
>  return 0;
>  }
> diff --git a/src/dumpfd2fd.c b/src/dumpfd2fd.c
> index 674e2b0..431bac2 100644
> --- a/src/dumpfd2fd.c
> +++ b/src/dumpfd2fd.c
> @@ -84,7 +84,7 @@ int dumpfd2fd(int from, int to)
>  return (r);
>  }
>=20=20
>=20-int process_headers(int infd, FILE *outf, const char *from)
> +int process_headers(int infd, FILE *outf, const char *from, const char=
 *name)
>  {
>  char *line =3D NULL, *p, *to_be_subst, *new_line;
>  size_t linecap =3D 0;
> @@ -120,6 +120,18 @@ int process_headers(int infd, FILE *outf, const ch=
ar *from)
>  return -1;
>  }
>  free(new_line);
> + } else if ((to_be_subst =3D strstr(p, "$postername$")) !=3D NULL) {
> + *to_be_subst =3D '\0';
> + to_be_subst +=3D 12;
> + xasprintf(&new_line, "%s%s%s", p, name, to_be_subst);
> + if (fprintf(outf, "%s", new_line) < 0) {
> + log_error(LOG_ARGS, "Could not write headers");
> + free(new_line);
> + free(line);
> + fclose(f);
> + return -1;
> + }
> + free(new_line);
>  } else {
>  if (fprintf(outf, "%s", p) < 0) {
>  log_error(LOG_ARGS, "Could not write headers");
> diff --git a/src/find_email_adr.c b/src/find_email_adr.c
> index 0830098..77b7cef 100644
> --- a/src/find_email_adr.c
> +++ b/src/find_email_adr.c
> @@ -239,3 +239,55 @@ oncemore:
>=20=20
>=20 return retstruct;
>  }
> +
> +/* -------------------------------------------------------------------=
--------*\
> + * Extract the display name of the first user,
> + * removing comments, for example:
> + *
> + * for the input string:
> + * "John (Amazing) Smith" <john.smith@example.com>,
> + * "Jane Doe" <jane.doe@example.com
> + *
> + * returns: "John Smith"
> +\* -------------------------------------------------------------------=
--------*/
> +char *
> +find_display_name (char *name)
> +{
> + char *p, *nbuf, c;
> + int nbuf_len, saw_angled_brackets;
> +
> + if (!name) return NULL;
> + nbuf =3D xmalloc(strlen(name));
> + saw_angled_brackets =3D 0;
> + nbuf_len =3D 0;
> +
> + for (p =3D name; (c =3D *p) !=3D '\0' && isspace(c); p++);
> + while ((c =3D *p++) !=3D '\0') {
> + switch (c) {
> + case '(':
> + p =3D skip_comment(p);
> + /* -------------------------------*\
> + * Copy at most one space in place
> + * of the comment. Don't copy any
> + * whitespace if we are still at
> + * the beginning of the string.
> + */
> + if (nbuf_len > 0 && isspace(*p) &&
> + !isspace(nbuf[nbuf_len-1])) {
> + nbuf[nbuf_len++] =3D *p++;
> + }
> + while(isspace(*p)) p++;
> + /* -------------------------------*/
> + break;
> + case '<': saw_angled_brackets =3D 1; goto finished;
> + case ',': goto finished;
> + default: nbuf[nbuf_len++] =3D c; break;
> + }
> + }
> +
> + finished:
> + if (!saw_angled_brackets || nbuf_len =3D=3D 0) { free(nbuf); return N=
ULL; }
> + for (p--, p--; (c =3D *p) && isspace(c); p--, nbuf_len--);
> + nbuf[nbuf_len++] =3D '\0';
> + return nbuf;
> +}
> --=20
>=202.46.4
>
--8d20f052-76de-444a-a329-17c7f60535ad-1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><meta http-equiv=3D"Content-Type" content=3D"t=
ext/html; charset=3Dutf-8"></head><body><div>Thank you, I will have a loo=
k at it asap, and see integrate it if possible in 2.0.0 which I intend to=
 release soon</div><div><br></div><div>Best regards,</div><div>Bapt<br><b=
r></div><p>March 27, 2026 at 7:14 PM, "Lumin Etherlight" &lt;<a href=3D"m=
ailto:lumin+mlmmj@etherlight.link?to=3D%22Lumin%20Etherlight%22%20%3Clumi=
n%2Bmlmmj%40etherlight.link%3E" target=3D"_blank" tabindex=3D"-1">lumin+m=
lmmj@etherlight.link</a>&gt; wrote:</p><blockquote>Allow substitution of =
 the variable $postername$ for<br>the display name  of the user.  The  di=
splay name is<br>extracted from the sender's From: header.  If a name<br>=
is not found, then  this variable is substituted for<br>user's address, i=
.e. the same value as $posteraddr$.<br>Proper handling of comments,  and =
quoted strings, in<br>the From: address is also included.<br><br>This all=
ows the following `customheaders' use-case:<br><br>    From: $postername$=
 via Project-List &lt;project-list@example.com&gt;<br><br>Which would ren=
der, for example, as:<br><br>    From: John Doe via Project-List &lt;proj=
ect-list@example.com&gt;<br><br>For the user:<br><br>    John Doe &lt;joh=
n@example.com&gt;.<br>---<br> AUTHORS                      |  1 +<br> inc=
lude/find_email_adr.h     |  1 +<br> include/wrappers.h           |  2 +-=
<br> src/do_all_the_voodoo_here.c | 22 ++++++++++++---<br> src/dumpfd2fd.=
c              | 14 +++++++++-<br> src/find_email_adr.c         | 52 ++++=
++++++++++++++++++++++++++++++++<br> 6 files changed, 86 insertions(+), 6=
 deletions(-)<br><br>diff --git a/AUTHORS b/AUTHORS<br>index be21ced..9d9=
b7df 100644<br>--- a/AUTHORS<br>+++ b/AUTHORS<br>@@ -1,3 +1,4 @@<br> Mads=
 Martin Joergensen &lt;mmj@mmj.dk&gt;<br> Morten K. Poulsen &lt;morten@af=
delingp.dk&gt;<br> Ben Schmidt &lt;mail_ben_schmidt@yahoo.com.au&gt;<br>+=
Lumin Etherlight &lt;lumin+mlmmj@etherlight.link&gt;<br>diff --git a/incl=
ude/find_email_adr.h b/include/find_email_adr.h<br>index e5da89b..707fdd6=
 100644<br>--- a/include/find_email_adr.h<br>+++ b/include/find_email_adr=
.h<br>@@ -27,5 +27,6 @@<br> #include &lt;stddef.h&gt;<br> <br> strlist *f=
ind_email_adr(const char *str, strlist *retval);<br>+char    *find_displa=
y_name(char *name);<br> <br> #endif /* FIND_EMAIL_ADR_H */<br>diff --git =
a/include/wrappers.h b/include/wrappers.h<br>index 2953bd2..5a2c144 10064=
4<br>--- a/include/wrappers.h<br>+++ b/include/wrappers.h<br>@@ -31,6 +31=
,6 @@ ssize_t readn(int fd, void *vptr, size_t n);<br> int random_int(voi=
d);<br> int dumpfd2fd(int infd, int outfd);<br> int copy_file(int infd, i=
nt outfd, size_t bufsiz);<br>-int process_headers(int infd, FILE *outf, c=
onst char *from);<br>+int process_headers(int infd, FILE *outf, const cha=
r *from, const char *name);<br> <br> #endif /* WRAPPERS_H */<br>diff --gi=
t a/src/do_all_the_voodoo_here.c b/src/do_all_the_voodoo_here.c<br>index =
13aeb74..14214a8 100644<br>--- a/src/do_all_the_voodoo_here.c<br>+++ b/sr=
c/do_all_the_voodoo_here.c<br>@@ -80,6 +80,7 @@ int do_all_the_voodoo_her=
e(int infd, int outfd, int hdrfd, int footfd,<br> 	char *hdrline, *unfold=
ed, *unqp;<br> 	strlist allunfoldeds =3D tll_init();<br> 	char *posteradd=
r =3D NULL;<br>+	char *postername =3D NULL;<br> 	bool hdrsadded =3D false=
;<br> 	bool subject_present =3D false;<br> 	int dupfd =3D dup(infd);<br>@=
@ -111,9 +112,16 @@ int do_all_the_voodoo_here(int infd, int outfd, int h=
drfd, int footfd,<br> 	if(hdrfd &gt;=3D 0) {<br> 		strlist fromemails =3D=
 tll_init();<br> 		if ( readhdrs[0].valuecount =3D=3D 1 ) {<br>-		       =
 find_email_adr(readhdrs[0].values[0], &amp;fromemails);<br>-			if (tll_l=
ength(fromemails) &gt; 0)<br>+			find_email_adr(readhdrs[0].values[0], &a=
mp;fromemails);<br>+			if (tll_length(fromemails) &gt; 0) {<br> 				poste=
raddr =3D xstrdup(tll_front(fromemails));<br>+				postername =3D find_dis=
play_name(readhdrs[0].values[0]);<br>+				if (!postername) {<br>+					pos=
tername =3D posteraddr ?<br>+						xstrdup(posteraddr) :<br>+						xcallo=
c(1, 1);<br>+				}<br>+			}<br> 		}<br> 		tll_free_and_free(fromemails, f=
ree);<br> 	}<br>@@ -129,12 +137,13 @@ int do_all_the_voodoo_here(int infd=
, int outfd, int hdrfd, int footfd,<br> 		if(!hdrsadded &amp;&amp;<br> 		=
    ( strncasecmp(hdrline, "mime", 4) =3D=3D 0)) {<br> 			if(hdrfd &gt;=
=3D 0) {<br>-			        if(process_headers(hdrfd,outf,posteraddr ? poster=
addr : "") &lt; 0) {<br>+				if(process_headers(hdrfd,outf,posteraddr ? p=
osteraddr : "", postername ) &lt; 0) {<br> 					log_error(LOG_ARGS, "Coul=
d not "<br> 						"add extra headers");<br> 					free(unfolded);<br> 				=
	tll_free_and_free(allunfoldeds, free);<br> 					free(posteraddr);<br>+		=
			free(postername);<br> 					fclose(outf);<br> 					fclose(f);<br> 					=
return -1;<br>@@ -174,11 +183,12 @@ int do_all_the_voodoo_here(int infd, =
int outfd, int hdrfd, int footfd,<br> <br> 	if(!hdrsadded ) {<br> 		if(hd=
rfd &gt;=3D 0) {<br>-		  if(process_headers(hdrfd,outf,posteraddr ? poste=
raddr : "") &lt; 0) {<br>+		  if(process_headers(hdrfd,outf,posteraddr ? =
posteraddr : "", postername) &lt; 0) {<br> 				log_error(LOG_ARGS, "Could=
 not "<br> 					"add extra headers");<br> 				tll_free_and_free(allunfold=
eds, free);<br> 				free(posteraddr);<br>+				free(postername);<br> 				f=
close(outf);<br> 				fclose(f);<br> 				return -1;<br>@@ -195,6 +205,7 @@=
 int do_all_the_voodoo_here(int infd, int outfd, int hdrfd, int footfd,<b=
r> 	        tll_free_and_free(allunfoldeds, free);<br> 		log_error(LOG_AR=
GS, "Error writing hdrs.");<br> 		free(posteraddr);<br>+		free(postername=
);<br> 		fclose(outf);<br> 		fclose(f);<br> 		return -1;<br>@@ -209,6 +22=
0,7 @@ int do_all_the_voodoo_here(int infd, int outfd, int hdrfd, int foo=
tfd,<br> 	if(dumpfd2fd(infd, outfd) &lt; 0) {<br> 		log_error(LOG_ARGS, "=
Error when dumping rest of mail");<br> 		free(posteraddr);<br>+		free(pos=
tername);<br> 		fclose(f);<br> 		return -1;<br> 	}<br>@@ -219,11 +231,13 =
@@ int do_all_the_voodoo_here(int infd, int outfd, int hdrfd, int footfd,=
<br> 		if(dumpfd2fd(footfd, outfd) &lt; 0) {<br> 			log_error(LOG_ARGS, "=
Error when adding footer");<br> 			free(posteraddr);<br>+			free(posterna=
me);<br> 			return -1;<br> 		}<br> <br> 	fsync(outfd);<br> <br> 	free(pos=
teraddr);<br>+	free(postername);<br> 	return 0;<br> }<br>diff --git a/src=
/dumpfd2fd.c b/src/dumpfd2fd.c<br>index 674e2b0..431bac2 100644<br>--- a/=
src/dumpfd2fd.c<br>+++ b/src/dumpfd2fd.c<br>@@ -84,7 +84,7 @@ int dumpfd2=
fd(int from, int to)<br> 	return (r);<br> }<br> <br>-int process_headers(=
int infd, FILE *outf, const char *from)<br>+int process_headers(int infd,=
 FILE *outf, const char *from, const char *name)<br> {<br> 	char *line =
=3D NULL, *p, *to_be_subst, *new_line;<br> 	size_t linecap =3D 0;<br>@@ -=
120,6 +120,18 @@ int process_headers(int infd, FILE *outf, const char *fr=
om)<br> 				return -1;<br> 			}<br> 			free(new_line);<br>+		} else if ((=
to_be_subst =3D strstr(p, "$postername$")) !=3D NULL) {<br>+			*to_be_sub=
st =3D '\0';<br>+			to_be_subst +=3D 12;<br>+			xasprintf(&amp;new_line, =
"%s%s%s", p, name, to_be_subst);<br>+			if (fprintf(outf, "%s", new_line)=
 &lt; 0) {<br>+				log_error(LOG_ARGS, "Could not write headers");<br>+		=
		free(new_line);<br>+				free(line);<br>+				fclose(f);<br>+				return -=
1;<br>+			}<br>+			free(new_line);<br> 		} else {<br> 			if (fprintf(outf=
, "%s", p) &lt; 0) {<br> 				log_error(LOG_ARGS, "Could not write headers=
");<br>diff --git a/src/find_email_adr.c b/src/find_email_adr.c<br>index =
0830098..77b7cef 100644<br>--- a/src/find_email_adr.c<br>+++ b/src/find_e=
mail_adr.c<br>@@ -239,3 +239,55 @@ oncemore:<br> <br> 	return retstruct;<=
br> }<br>+<br>+/* -------------------------------------------------------=
--------------------*\<br>+ * Extract the display name of the first user,=
<br>+ * removing comments, for example:<br>+ *<br>+ * for the input strin=
g:<br>+ *	"John (Amazing) Smith" &lt;john.smith@example.com&gt;,<br>+ *	 =
 "Jane Doe" &lt;jane.doe@example.com<br>+ *<br>+ * returns: "John Smith"<=
br>+\* ------------------------------------------------------------------=
---------*/<br>+char *<br>+find_display_name (char *name)<br>+{<br>+	char=
 *p, *nbuf, c;<br>+	int nbuf_len, saw_angled_brackets;<br>+<br>+	if (!nam=
e) return NULL;<br>+	nbuf =3D xmalloc(strlen(name));<br>+	saw_angled_brac=
kets =3D 0;<br>+	nbuf_len =3D 0;<br>+<br>+	for (p =3D name; (c =3D *p) !=
=3D '\0' &amp;&amp; isspace(c); p++);<br>+	while ((c =3D *p++) !=3D '\0')=
 {<br>+		switch (c) {<br>+		case '(':<br>+			p =3D skip_comment(p);<br>+	=
		/* -------------------------------*\<br>+			 * Copy at most one space i=
n place<br>+			 * of the comment.  Don't copy any<br>+			 * whitespace if=
 we are still at<br>+			 * the beginning of the string.<br>+			 */<br>+		=
	if (nbuf_len &gt; 0 &amp;&amp; isspace(*p) &amp;&amp;<br>+			    !isspac=
e(nbuf[nbuf_len-1])) {<br>+				nbuf[nbuf_len++] =3D *p++;<br>+			}<br>+		=
	while(isspace(*p)) p++;<br>+			/* -------------------------------*/<br>+=
			break;<br>+		case '&lt;': saw_angled_brackets =3D 1; goto finished;<br=
>+		case ',':			   goto finished;<br>+		default:  nbuf[nbuf_len++] =3D c;=
	   break;<br>+		}<br>+	}<br>+<br>+ finished:<br>+	if (!saw_angled_bracke=
ts || nbuf_len =3D=3D 0) { free(nbuf); return NULL; }<br>+	for (p--, p--;=
 (c =3D *p) &amp;&amp; isspace(c); p--, nbuf_len--);<br>+	nbuf[nbuf_len++=
] =3D '\0';<br>+	return nbuf;<br>+}<br>-- <br>2.46.4</blockquote><div><br=
></div></body></html>
--8d20f052-76de-444a-a329-17c7f60535ad-1--


