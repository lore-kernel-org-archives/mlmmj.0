Return-Path: <mlmmj+bounces-3093-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32385F3D60A
	for <mlmmj@archiver.kernel.org>; Sun, 29 Mar 2026 14:17:50 +0000 (UTC)
Received: from localhost ([127.0.0.1]:40836 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3093-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1w6q9F-00AyI6-2I
	for mlmmj@archiver.kernel.org;
	Sun, 29 Mar 2026 13:25:49 +0000
Received: from mail.independend.ch ([88.99.26.173]:33550)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <Jona.Mueller@independend.ch>)
	id 1w6q98-00AyHP-2H
	for mlmmj@mlmmj.org;
	Sun, 29 Mar 2026 13:25:42 +0000
Authentication-Results: OpenDMARC; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: mail.independend.ch;
	dkim=pass (2048-bit key; secure) header.d=independend.ch header.i=@independend.ch header.a=rsa-sha256 header.s=dkim header.b=oW7cQDCn;
	dkim-atps=neutral
Received: from mail.independend.ch (mail.independend.ch [127.0.0.1])
	by mail.independend.ch (Postfix) with ESMTP id 4fkFg93M1lz1c4nR
	for <mlmmj@mlmmj.org>; Sun, 29 Mar 2026 15:32:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=independend.ch;
	 h=in-reply-to:content-disposition:content-type:mime-version
	:references:message-id:subject:to:from:date; s=dkim; t=
	1774791157; x=1777383158; bh=sy4YutAxBELASedlquohh2jwSmAJRyGJ3Nr
	m3Ab1YdI=; b=oW7cQDCnSnmXHeIlKt9ICa1x0tPEHUDxje5xmN+OwNBj3aq237t
	vp6G7gNk9pulDay2Jr+P/GAKYihdjbzH2W6hIJ/By2Sjv4yXb0nYS357RMEiFmdt
	UqUtq1K0sAjEfrro3uRXKucY6DfmJSRPMK/LSIoPAtSjc9K4cJK0jhQlf8REDpnP
	YiYRuXef4cZHeepdubPDJwrCjadPjmgdWbNXPqACR3zobWniNc+wYIJ3Mvi8Vu7d
	qPJIMeMdxsAz4ZvxwA26nHt6LI2I1H7psNf5OigQI/9rFWbAgDjSINFdu5db+7Z9
	F93oV7j8ndHXR1OMccvcWTleJ4h/gUWEU5A==
X-Virus-Scanned: Debian amavis at mail.independend.ch
Received: from mail.independend.ch ([127.0.0.1])
 by mail.independend.ch (mail.independend.ch [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 77osVm9y5tWI for <mlmmj@mlmmj.org>;
 Sun, 29 Mar 2026 15:32:37 +0200 (CEST)
Authentication-Results: OpenDMARC; arc=none smtp.remote-ip=217.250.0.25
Received: from radeon (pd9fa0019.dip0.t-ipconnect.de [217.250.0.25])
	by mail.independend.ch (Postfix) with ESMTPSA id 4fkFg85yKGz1c4mf;
	Sun, 29 Mar 2026 15:32:36 +0200 (CEST)
Date: Sun, 29 Mar 2026 15:32:36 +0200
From: Jona =?iso-8859-1?Q?M=FCller?= <Jona.Mueller@independend.ch>
To: Baptiste Daroussin <bapt@nours.eu>
Cc: mlmmj@mlmmj.org
Subject: Re: [PATCH] Support display name substitution in customheaders
Message-ID: <ackp9MFJ2kfoNzao@radeon>
References: <83Su95j/WN8QKsJA6dPhlkwgNx6bkcF5@etherlight.link>
 <362a66a2c2eb55ecd94e6cc97bcf36ae035867d5@nours.eu>
 <C402F21C-4A69-43F2-BEB4-AFB9CD3E500F@nours.eu>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qdrw4o4n223Z4PZh"
Content-Disposition: inline
In-Reply-To: <C402F21C-4A69-43F2-BEB4-AFB9CD3E500F@nours.eu>


--qdrw4o4n223Z4PZh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I would also +1 RFC2047 as we have many people with non-ascii names (Myself
included). From experience, this can be quite a pain to support correctly as
around the world people still use a lot of encodings other than UTF-8. The =
most
common in my experience are:

	ISO-8859-1 (Western europe latin1)
	ISO-2022-JP (non-UTF-8 Japanese)

A quick hack would be to throw out any encoded words (=3D?UTF-8?...) and ju=
st use
the local part (address) in that case.=20

The options to do it correctly would be in my opinion:=20

	1. Do it by hand and suffer
	2. Introduce some large dependency that handles it

I'm against 2, and I think having few dependencies is one of mlmmj's streng=
ths.

Tests would be very nice, I agree.=20

Cheers,
-jm
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Independend GmbH

Jona.Mueller@independend.ch
+49 6832 265556

http://ind.me


On Sun, Mar 29, 2026 at 02:33:28PM +0200, Baptiste Daroussin wrote:
> after a quick read of the match, the extracted display name is not saniti=
zed, it should probably be.
>=20
> the parser at quick glance seems fragile, what happen if the display name=
 is "Doe, John"
>=20
> Would be nice to get a bunch of tests to make sure everything works as ex=
pected.
>=20
> also I don t think rfc 2047 is handled.
>=20
> Best regards,
> bapt
>=20
>=20
> Le 29 mars 2026 10:13:54 GMT+02:00, Baptiste Daroussin <bapt@nours.eu> a =
=E9crit=A0:
> >Thank you, I will have a look at it asap, and see integrate it if possib=
le in 2.0.0 which I intend to release soon
> >
> >Best regards,
> >Bapt
> >
> >
> >March 27, 2026 at 7:14 PM, "Lumin Etherlight" <lumin+mlmmj@etherlight.li=
nk mailto:lumin+mlmmj@etherlight.link?to=3D%22Lumin%20Etherlight%22%20%3Clu=
min%2Bmlmmj%40etherlight.link%3E > wrote:
> >
> >
> >>=20
> >> Allow substitution of the variable $postername$ for
> >> the display name of the user. The display name is
> >> extracted from the sender's From: header. If a name
> >> is not found, then this variable is substituted for
> >> user's address, i.e. the same value as $posteraddr$.
> >> Proper handling of comments, and quoted strings, in
> >> the From: address is also included.
> >>=20
> >> This allows the following `customheaders' use-case:
> >>=20
> >>  From: $postername$ via Project-List <project-list@example.com>
> >>=20
> >> Which would render, for example, as:
> >>=20
> >>  From: John Doe via Project-List <project-list@example.com>
> >>=20
> >> For the user:
> >>=20
> >>  John Doe <john@example.com>.
> >> ---
> >>  AUTHORS | 1 +
> >>  include/find_email_adr.h | 1 +
> >>  include/wrappers.h | 2 +-
> >>  src/do_all_the_voodoo_here.c | 22 ++++++++++++---
> >>  src/dumpfd2fd.c | 14 +++++++++-
> >>  src/find_email_adr.c | 52 ++++++++++++++++++++++++++++++++++++
> >>  6 files changed, 86 insertions(+), 6 deletions(-)
> >>=20
> >> diff --git a/AUTHORS b/AUTHORS
> >> index be21ced..9d9b7df 100644
> >> --- a/AUTHORS
> >> +++ b/AUTHORS
> >> @@ -1,3 +1,4 @@
> >>  Mads Martin Joergensen <mmj@mmj.dk>
> >>  Morten K. Poulsen <morten@afdelingp.dk>
> >>  Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
> >> +Lumin Etherlight <lumin+mlmmj@etherlight.link>
> >> diff --git a/include/find_email_adr.h b/include/find_email_adr.h
> >> index e5da89b..707fdd6 100644
> >> --- a/include/find_email_adr.h
> >> +++ b/include/find_email_adr.h
> >> @@ -27,5 +27,6 @@
> >>  #include <stddef.h>
> >> =20
> >>  strlist *find_email_adr(const char *str, strlist *retval);
> >> +char *find_display_name(char *name);
> >> =20
> >>  #endif /* FIND_EMAIL_ADR_H */
> >> diff --git a/include/wrappers.h b/include/wrappers.h
> >> index 2953bd2..5a2c144 100644
> >> --- a/include/wrappers.h
> >> +++ b/include/wrappers.h
> >> @@ -31,6 +31,6 @@ ssize_t readn(int fd, void *vptr, size_t n);
> >>  int random_int(void);
> >>  int dumpfd2fd(int infd, int outfd);
> >>  int copy_file(int infd, int outfd, size_t bufsiz);
> >> -int process_headers(int infd, FILE *outf, const char *from);
> >> +int process_headers(int infd, FILE *outf, const char *from, const cha=
r *name);
> >> =20
> >>  #endif /* WRAPPERS_H */
> >> diff --git a/src/do_all_the_voodoo_here.c b/src/do_all_the_voodoo_here=
=2Ec
> >> index 13aeb74..14214a8 100644
> >> --- a/src/do_all_the_voodoo_here.c
> >> +++ b/src/do_all_the_voodoo_here.c
> >> @@ -80,6 +80,7 @@ int do_all_the_voodoo_here(int infd, int outfd, int =
hdrfd, int footfd,
> >>  char *hdrline, *unfolded, *unqp;
> >>  strlist allunfoldeds =3D tll_init();
> >>  char *posteraddr =3D NULL;
> >> + char *postername =3D NULL;
> >>  bool hdrsadded =3D false;
> >>  bool subject_present =3D false;
> >>  int dupfd =3D dup(infd);
> >> @@ -111,9 +112,16 @@ int do_all_the_voodoo_here(int infd, int outfd, i=
nt hdrfd, int footfd,
> >>  if(hdrfd >=3D 0) {
> >>  strlist fromemails =3D tll_init();
> >>  if ( readhdrs[0].valuecount =3D=3D 1 ) {
> >> - find_email_adr(readhdrs[0].values[0], &fromemails);
> >> - if (tll_length(fromemails) > 0)
> >> + find_email_adr(readhdrs[0].values[0], &fromemails);
> >> + if (tll_length(fromemails) > 0) {
> >>  posteraddr =3D xstrdup(tll_front(fromemails));
> >> + postername =3D find_display_name(readhdrs[0].values[0]);
> >> + if (!postername) {
> >> + postername =3D posteraddr ?
> >> + xstrdup(posteraddr) :
> >> + xcalloc(1, 1);
> >> + }
> >> + }
> >>  }
> >>  tll_free_and_free(fromemails, free);
> >>  }
> >> @@ -129,12 +137,13 @@ int do_all_the_voodoo_here(int infd, int outfd, =
int hdrfd, int footfd,
> >>  if(!hdrsadded &&
> >>  ( strncasecmp(hdrline, "mime", 4) =3D=3D 0)) {
> >>  if(hdrfd >=3D 0) {
> >> - if(process_headers(hdrfd,outf,posteraddr ? posteraddr : "") < 0) {
> >> + if(process_headers(hdrfd,outf,posteraddr ? posteraddr : "", posterna=
me ) < 0) {
> >>  log_error(LOG_ARGS, "Could not "
> >>  "add extra headers");
> >>  free(unfolded);
> >>  tll_free_and_free(allunfoldeds, free);
> >>  free(posteraddr);
> >> + free(postername);
> >>  fclose(outf);
> >>  fclose(f);
> >>  return -1;
> >> @@ -174,11 +183,12 @@ int do_all_the_voodoo_here(int infd, int outfd, =
int hdrfd, int footfd,
> >> =20
> >>  if(!hdrsadded ) {
> >>  if(hdrfd >=3D 0) {
> >> - if(process_headers(hdrfd,outf,posteraddr ? posteraddr : "") < 0) {
> >> + if(process_headers(hdrfd,outf,posteraddr ? posteraddr : "", posterna=
me) < 0) {
> >>  log_error(LOG_ARGS, "Could not "
> >>  "add extra headers");
> >>  tll_free_and_free(allunfoldeds, free);
> >>  free(posteraddr);
> >> + free(postername);
> >>  fclose(outf);
> >>  fclose(f);
> >>  return -1;
> >> @@ -195,6 +205,7 @@ int do_all_the_voodoo_here(int infd, int outfd, in=
t hdrfd, int footfd,
> >>  tll_free_and_free(allunfoldeds, free);
> >>  log_error(LOG_ARGS, "Error writing hdrs.");
> >>  free(posteraddr);
> >> + free(postername);
> >>  fclose(outf);
> >>  fclose(f);
> >>  return -1;
> >> @@ -209,6 +220,7 @@ int do_all_the_voodoo_here(int infd, int outfd, in=
t hdrfd, int footfd,
> >>  if(dumpfd2fd(infd, outfd) < 0) {
> >>  log_error(LOG_ARGS, "Error when dumping rest of mail");
> >>  free(posteraddr);
> >> + free(postername);
> >>  fclose(f);
> >>  return -1;
> >>  }
> >> @@ -219,11 +231,13 @@ int do_all_the_voodoo_here(int infd, int outfd, =
int hdrfd, int footfd,
> >>  if(dumpfd2fd(footfd, outfd) < 0) {
> >>  log_error(LOG_ARGS, "Error when adding footer");
> >>  free(posteraddr);
> >> + free(postername);
> >>  return -1;
> >>  }
> >> =20
> >>  fsync(outfd);
> >> =20
> >>  free(posteraddr);
> >> + free(postername);
> >>  return 0;
> >>  }
> >> diff --git a/src/dumpfd2fd.c b/src/dumpfd2fd.c
> >> index 674e2b0..431bac2 100644
> >> --- a/src/dumpfd2fd.c
> >> +++ b/src/dumpfd2fd.c
> >> @@ -84,7 +84,7 @@ int dumpfd2fd(int from, int to)
> >>  return (r);
> >>  }
> >> =20
> >> -int process_headers(int infd, FILE *outf, const char *from)
> >> +int process_headers(int infd, FILE *outf, const char *from, const cha=
r *name)
> >>  {
> >>  char *line =3D NULL, *p, *to_be_subst, *new_line;
> >>  size_t linecap =3D 0;
> >> @@ -120,6 +120,18 @@ int process_headers(int infd, FILE *outf, const c=
har *from)
> >>  return -1;
> >>  }
> >>  free(new_line);
> >> + } else if ((to_be_subst =3D strstr(p, "$postername$")) !=3D NULL) {
> >> + *to_be_subst =3D '\0';
> >> + to_be_subst +=3D 12;
> >> + xasprintf(&new_line, "%s%s%s", p, name, to_be_subst);
> >> + if (fprintf(outf, "%s", new_line) < 0) {
> >> + log_error(LOG_ARGS, "Could not write headers");
> >> + free(new_line);
> >> + free(line);
> >> + fclose(f);
> >> + return -1;
> >> + }
> >> + free(new_line);
> >>  } else {
> >>  if (fprintf(outf, "%s", p) < 0) {
> >>  log_error(LOG_ARGS, "Could not write headers");
> >> diff --git a/src/find_email_adr.c b/src/find_email_adr.c
> >> index 0830098..77b7cef 100644
> >> --- a/src/find_email_adr.c
> >> +++ b/src/find_email_adr.c
> >> @@ -239,3 +239,55 @@ oncemore:
> >> =20
> >>  return retstruct;
> >>  }
> >> +
> >> +/* ------------------------------------------------------------------=
---------*\
> >> + * Extract the display name of the first user,
> >> + * removing comments, for example:
> >> + *
> >> + * for the input string:
> >> + * "John (Amazing) Smith" <john.smith@example.com>,
> >> + * "Jane Doe" <jane.doe@example.com
> >> + *
> >> + * returns: "John Smith"
> >> +\* ------------------------------------------------------------------=
---------*/
> >> +char *
> >> +find_display_name (char *name)
> >> +{
> >> + char *p, *nbuf, c;
> >> + int nbuf_len, saw_angled_brackets;
> >> +
> >> + if (!name) return NULL;
> >> + nbuf =3D xmalloc(strlen(name));
> >> + saw_angled_brackets =3D 0;
> >> + nbuf_len =3D 0;
> >> +
> >> + for (p =3D name; (c =3D *p) !=3D '\0' && isspace(c); p++);
> >> + while ((c =3D *p++) !=3D '\0') {
> >> + switch (c) {
> >> + case '(':
> >> + p =3D skip_comment(p);
> >> + /* -------------------------------*\
> >> + * Copy at most one space in place
> >> + * of the comment. Don't copy any
> >> + * whitespace if we are still at
> >> + * the beginning of the string.
> >> + */
> >> + if (nbuf_len > 0 && isspace(*p) &&
> >> + !isspace(nbuf[nbuf_len-1])) {
> >> + nbuf[nbuf_len++] =3D *p++;
> >> + }
> >> + while(isspace(*p)) p++;
> >> + /* -------------------------------*/
> >> + break;
> >> + case '<': saw_angled_brackets =3D 1; goto finished;
> >> + case ',': goto finished;
> >> + default: nbuf[nbuf_len++] =3D c; break;
> >> + }
> >> + }
> >> +
> >> + finished:
> >> + if (!saw_angled_brackets || nbuf_len =3D=3D 0) { free(nbuf); return =
NULL; }
> >> + for (p--, p--; (c =3D *p) && isspace(c); p--, nbuf_len--);
> >> + nbuf[nbuf_len++] =3D '\0';
> >> + return nbuf;
> >> +}
> >> --=20
> >> 2.46.4
> >>
>=20
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Independend GmbH

Jona.Mueller@independend.ch
+49 6832 265556

http://ind.me


--qdrw4o4n223Z4PZh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEM0qOw5hydnArKgH2jALoLo7pDpwFAmnJKfQACgkQjALoLo7p
DpzeKQ/9FcbMOlqMi/gdidud5Cqk4hKoBU3OBTrwBs8MKx8FpYjfofOHijnUxsoe
vOH0jufeyhBwgVtsq9+rmMzkg1KFQm+UGjyrZqGpN6+USpVdQdTJrPLYHKOX3X+2
lkuEZFF5W4qQNyTv2eBZuZlsYo9heZ0blqniw0mG/LOMI+Px9wDXRrZL6ZHij4Sf
AfvBwbvZufCedbuny9Hfr0viYP1faLcX4OILglXYiUolTJDJYfmXIW2eALDNCxuw
/GbMuO0oQcw52fYFYy4ldojZODCHH4BtZvB5cUfLa1F2nSMxVHVCDgeNyX+y+gI7
c2IMrkYNsVvQRb8IVZmeMiLBAQKogLF0Dq+8pttSSTmEsbbpqepuknZjCfkSwcKQ
2SU9FVbIKhdPr5hD1BJXw0+j4ZZyMjy76tcSNt37KmefCeSgjAuh2WpvW9poV20D
gW4/tfnk7PWh/bvOp63liFz+a4u7jUbyCXAdvsKPu6vHiyL1PSJIoJqOehDlR6r2
bwhreYn3h1gn/N9aKK5fHMdmHMcxCtOqdWbVPgbSydWRJPIRkmbTptPbVcIHkNoY
8OY3crry3Fi+8n+7xhQRvVqJtPCzflUbB32LAh8mftOxiX0JatJtAnUIXVe5g7dz
m/r2o6YOUBy9QvNEx3rXZGUa7fkygSKJ/geClnxKGnCQn2keKnA=
=OtV5
-----END PGP SIGNATURE-----

--qdrw4o4n223Z4PZh--


