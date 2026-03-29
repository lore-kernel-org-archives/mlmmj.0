Return-Path: <mlmmj+bounces-3094-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB1EF3D60E
	for <mlmmj@archiver.kernel.org>; Sun, 29 Mar 2026 14:20:37 +0000 (UTC)
Received: from localhost ([127.0.0.1]:34564 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3094-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1w6qmt-00AySO-18
	for mlmmj@archiver.kernel.org;
	Sun, 29 Mar 2026 14:06:47 +0000
Received: from b.nours.eu ([54.38.177.57]:65248)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <bapt@nours.eu>)
	id 1w6qmm-00AyRh-0X
	for mlmmj@mlmmj.org;
	Sun, 29 Mar 2026 14:06:40 +0000
Received: from ehlo.thunderbird.net (unknown [IPv6:2a01:e0a:274:cc70:51c:b9c0:5e90:6598])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by b.nours.eu (Postfix) with ESMTPSA id 0AE05EF5A6;
	Sun, 29 Mar 2026 16:13:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1774793614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+V9lM/pxge1kpdrYmiZCSDgecogaw/6OX7UDQDxDgnA=;
	b=ja9uIzY+EuawHLavqGac4u7JI6j2s3CHxuw+SjjXHxkO5g+n3D1fFK5XophBXlsH/HVFN6
	dx4z54SxG/BTPxmofZ4iGOoVJJL+u2ibtGOMzwR5KIAU0Aks7IheYzOsauHxWcrX61SfiP
	b5QNIsjhY4QGIS/jwu3S7QozTN6J0wDi5+6z9k6MWpoaxbMNKJE63t8F1GVLKf3ZpN8Kax
	hiu4OUT6MuLf+JpscdHJS6cUOrZQ85GRR4pUu106uJ1iGAIQMnjyWI5oe4rnQft1j4CFvh
	QKHWAgYTy6Y+CvF18nyujI0KdEBAsvinKnMZypMHmobX9ZTlnjHhmQgP0phEGA==
Date: Sun, 29 Mar 2026 16:13:32 +0200
From: Baptiste Daroussin <bapt@nours.eu>
To: =?ISO-8859-1?Q?Jona_M=FCller?= <Jona.Mueller@independend.ch>
CC: mlmmj@mlmmj.org
Subject: Re: [PATCH] Support display name substitution in customheaders
User-Agent: Thunderbird for Android
In-Reply-To: <ackp9MFJ2kfoNzao@radeon>
References: <83Su95j/WN8QKsJA6dPhlkwgNx6bkcF5@etherlight.link> <362a66a2c2eb55ecd94e6cc97bcf36ae035867d5@nours.eu> <C402F21C-4A69-43F2-BEB4-AFB9CD3E500F@nours.eu> <ackp9MFJ2kfoNzao@radeon>
Message-ID: <64E005BC-B493-4788-A4E0-3F2DF4ABF23E@nours.eu>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

I have the code for rfc2047 decoding in my mlmmj archiver, I can reuse it (=
it only depends on iconv) but it makes it a more complicated task, so will =
be for 2=2E1

Best regards,
Bapt


Le 29 mars 2026 15:32:36 GMT+02:00, "Jona M=C3=BCller" <Jona=2EMueller@ind=
ependend=2Ech> a =C3=A9crit=C2=A0:
>I would also +1 RFC2047 as we have many people with non-ascii names (Myse=
lf
>included)=2E From experience, this can be quite a pain to support correct=
ly as
>around the world people still use a lot of encodings other than UTF-8=2E =
The most
>common in my experience are:
>
>	ISO-8859-1 (Western europe latin1)
>	ISO-2022-JP (non-UTF-8 Japanese)
>
>A quick hack would be to throw out any encoded words (=3D?UTF-8?=2E=2E=2E=
) and just use
>the local part (address) in that case=2E=20
>
>The options to do it correctly would be in my opinion:=20
>
>	1=2E Do it by hand and suffer
>	2=2E Introduce some large dependency that handles it
>
>I'm against 2, and I think having few dependencies is one of mlmmj's stre=
ngths=2E
>
>Tests would be very nice, I agree=2E=20
>
>Cheers,
>-jm
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>Independend GmbH
>
>Jona=2EMueller@independend=2Ech
>+49 6832 265556
>
>http://ind=2Eme
>
>
>On Sun, Mar 29, 2026 at 02:33:28PM +0200, Baptiste Daroussin wrote:
>> after a quick read of the match, the extracted display name is not sani=
tized, it should probably be=2E
>>=20
>> the parser at quick glance seems fragile, what happen if the display na=
me is "Doe, John"
>>=20
>> Would be nice to get a bunch of tests to make sure everything works as =
expected=2E
>>=20
>> also I don t think rfc 2047 is handled=2E
>>=20
>> Best regards,
>> bapt
>>=20
>>=20
>> Le 29 mars 2026 10:13:54 GMT+02:00, Baptiste Daroussin <bapt@nours=2Eeu=
> a =C3=A9crit=C2=A0:
>> >Thank you, I will have a look at it asap, and see integrate it if poss=
ible in 2=2E0=2E0 which I intend to release soon
>> >
>> >Best regards,
>> >Bapt
>> >
>> >
>> >March 27, 2026 at 7:14 PM, "Lumin Etherlight" <lumin+mlmmj@etherlight=
=2Elink mailto:lumin+mlmmj@etherlight=2Elink?to=3D%22Lumin%20Etherlight%22%=
20%3Clumin%2Bmlmmj%40etherlight=2Elink%3E > wrote:
>> >
>> >
>> >>=20
>> >> Allow substitution of the variable $postername$ for
>> >> the display name of the user=2E The display name is
>> >> extracted from the sender's From: header=2E If a name
>> >> is not found, then this variable is substituted for
>> >> user's address, i=2Ee=2E the same value as $posteraddr$=2E
>> >> Proper handling of comments, and quoted strings, in
>> >> the From: address is also included=2E
>> >>=20
>> >> This allows the following `customheaders' use-case:
>> >>=20
>> >>  From: $postername$ via Project-List <project-list@example=2Ecom>
>> >>=20
>> >> Which would render, for example, as:
>> >>=20
>> >>  From: John Doe via Project-List <project-list@example=2Ecom>
>> >>=20
>> >> For the user:
>> >>=20
>> >>  John Doe <john@example=2Ecom>=2E
>> >> ---
>> >>  AUTHORS | 1 +
>> >>  include/find_email_adr=2Eh | 1 +
>> >>  include/wrappers=2Eh | 2 +-
>> >>  src/do_all_the_voodoo_here=2Ec | 22 ++++++++++++---
>> >>  src/dumpfd2fd=2Ec | 14 +++++++++-
>> >>  src/find_email_adr=2Ec | 52 ++++++++++++++++++++++++++++++++++++
>> >>  6 files changed, 86 insertions(+), 6 deletions(-)
>> >>=20
>> >> diff --git a/AUTHORS b/AUTHORS
>> >> index be21ced=2E=2E9d9b7df 100644
>> >> --- a/AUTHORS
>> >> +++ b/AUTHORS
>> >> @@ -1,3 +1,4 @@
>> >>  Mads Martin Joergensen <mmj@mmj=2Edk>
>> >>  Morten K=2E Poulsen <morten@afdelingp=2Edk>
>> >>  Ben Schmidt <mail_ben_schmidt@yahoo=2Ecom=2Eau>
>> >> +Lumin Etherlight <lumin+mlmmj@etherlight=2Elink>
>> >> diff --git a/include/find_email_adr=2Eh b/include/find_email_adr=2Eh
>> >> index e5da89b=2E=2E707fdd6 100644
>> >> --- a/include/find_email_adr=2Eh
>> >> +++ b/include/find_email_adr=2Eh
>> >> @@ -27,5 +27,6 @@
>> >>  #include <stddef=2Eh>
>> >> =20
>> >>  strlist *find_email_adr(const char *str, strlist *retval);
>> >> +char *find_display_name(char *name);
>> >> =20
>> >>  #endif /* FIND_EMAIL_ADR_H */
>> >> diff --git a/include/wrappers=2Eh b/include/wrappers=2Eh
>> >> index 2953bd2=2E=2E5a2c144 100644
>> >> --- a/include/wrappers=2Eh
>> >> +++ b/include/wrappers=2Eh
>> >> @@ -31,6 +31,6 @@ ssize_t readn(int fd, void *vptr, size_t n);
>> >>  int random_int(void);
>> >>  int dumpfd2fd(int infd, int outfd);
>> >>  int copy_file(int infd, int outfd, size_t bufsiz);
>> >> -int process_headers(int infd, FILE *outf, const char *from);
>> >> +int process_headers(int infd, FILE *outf, const char *from, const c=
har *name);
>> >> =20
>> >>  #endif /* WRAPPERS_H */
>> >> diff --git a/src/do_all_the_voodoo_here=2Ec b/src/do_all_the_voodoo_=
here=2Ec
>> >> index 13aeb74=2E=2E14214a8 100644
>> >> --- a/src/do_all_the_voodoo_here=2Ec
>> >> +++ b/src/do_all_the_voodoo_here=2Ec
>> >> @@ -80,6 +80,7 @@ int do_all_the_voodoo_here(int infd, int outfd, in=
t hdrfd, int footfd,
>> >>  char *hdrline, *unfolded, *unqp;
>> >>  strlist allunfoldeds =3D tll_init();
>> >>  char *posteraddr =3D NULL;
>> >> + char *postername =3D NULL;
>> >>  bool hdrsadded =3D false;
>> >>  bool subject_present =3D false;
>> >>  int dupfd =3D dup(infd);
>> >> @@ -111,9 +112,16 @@ int do_all_the_voodoo_here(int infd, int outfd,=
 int hdrfd, int footfd,
>> >>  if(hdrfd >=3D 0) {
>> >>  strlist fromemails =3D tll_init();
>> >>  if ( readhdrs[0]=2Evaluecount =3D=3D 1 ) {
>> >> - find_email_adr(readhdrs[0]=2Evalues[0], &fromemails);
>> >> - if (tll_length(fromemails) > 0)
>> >> + find_email_adr(readhdrs[0]=2Evalues[0], &fromemails);
>> >> + if (tll_length(fromemails) > 0) {
>> >>  posteraddr =3D xstrdup(tll_front(fromemails));
>> >> + postername =3D find_display_name(readhdrs[0]=2Evalues[0]);
>> >> + if (!postername) {
>> >> + postername =3D posteraddr ?
>> >> + xstrdup(posteraddr) :
>> >> + xcalloc(1, 1);
>> >> + }
>> >> + }
>> >>  }
>> >>  tll_free_and_free(fromemails, free);
>> >>  }
>> >> @@ -129,12 +137,13 @@ int do_all_the_voodoo_here(int infd, int outfd=
, int hdrfd, int footfd,
>> >>  if(!hdrsadded &&
>> >>  ( strncasecmp(hdrline, "mime", 4) =3D=3D 0)) {
>> >>  if(hdrfd >=3D 0) {
>> >> - if(process_headers(hdrfd,outf,posteraddr ? posteraddr : "") < 0) {
>> >> + if(process_headers(hdrfd,outf,posteraddr ? posteraddr : "", poster=
name ) < 0) {
>> >>  log_error(LOG_ARGS, "Could not "
>> >>  "add extra headers");
>> >>  free(unfolded);
>> >>  tll_free_and_free(allunfoldeds, free);
>> >>  free(posteraddr);
>> >> + free(postername);
>> >>  fclose(outf);
>> >>  fclose(f);
>> >>  return -1;
>> >> @@ -174,11 +183,12 @@ int do_all_the_voodoo_here(int infd, int outfd=
, int hdrfd, int footfd,
>> >> =20
>> >>  if(!hdrsadded ) {
>> >>  if(hdrfd >=3D 0) {
>> >> - if(process_headers(hdrfd,outf,posteraddr ? posteraddr : "") < 0) {
>> >> + if(process_headers(hdrfd,outf,posteraddr ? posteraddr : "", poster=
name) < 0) {
>> >>  log_error(LOG_ARGS, "Could not "
>> >>  "add extra headers");
>> >>  tll_free_and_free(allunfoldeds, free);
>> >>  free(posteraddr);
>> >> + free(postername);
>> >>  fclose(outf);
>> >>  fclose(f);
>> >>  return -1;
>> >> @@ -195,6 +205,7 @@ int do_all_the_voodoo_here(int infd, int outfd, =
int hdrfd, int footfd,
>> >>  tll_free_and_free(allunfoldeds, free);
>> >>  log_error(LOG_ARGS, "Error writing hdrs=2E");
>> >>  free(posteraddr);
>> >> + free(postername);
>> >>  fclose(outf);
>> >>  fclose(f);
>> >>  return -1;
>> >> @@ -209,6 +220,7 @@ int do_all_the_voodoo_here(int infd, int outfd, =
int hdrfd, int footfd,
>> >>  if(dumpfd2fd(infd, outfd) < 0) {
>> >>  log_error(LOG_ARGS, "Error when dumping rest of mail");
>> >>  free(posteraddr);
>> >> + free(postername);
>> >>  fclose(f);
>> >>  return -1;
>> >>  }
>> >> @@ -219,11 +231,13 @@ int do_all_the_voodoo_here(int infd, int outfd=
, int hdrfd, int footfd,
>> >>  if(dumpfd2fd(footfd, outfd) < 0) {
>> >>  log_error(LOG_ARGS, "Error when adding footer");
>> >>  free(posteraddr);
>> >> + free(postername);
>> >>  return -1;
>> >>  }
>> >> =20
>> >>  fsync(outfd);
>> >> =20
>> >>  free(posteraddr);
>> >> + free(postername);
>> >>  return 0;
>> >>  }
>> >> diff --git a/src/dumpfd2fd=2Ec b/src/dumpfd2fd=2Ec
>> >> index 674e2b0=2E=2E431bac2 100644
>> >> --- a/src/dumpfd2fd=2Ec
>> >> +++ b/src/dumpfd2fd=2Ec
>> >> @@ -84,7 +84,7 @@ int dumpfd2fd(int from, int to)
>> >>  return (r);
>> >>  }
>> >> =20
>> >> -int process_headers(int infd, FILE *outf, const char *from)
>> >> +int process_headers(int infd, FILE *outf, const char *from, const c=
har *name)
>> >>  {
>> >>  char *line =3D NULL, *p, *to_be_subst, *new_line;
>> >>  size_t linecap =3D 0;
>> >> @@ -120,6 +120,18 @@ int process_headers(int infd, FILE *outf, const=
 char *from)
>> >>  return -1;
>> >>  }
>> >>  free(new_line);
>> >> + } else if ((to_be_subst =3D strstr(p, "$postername$")) !=3D NULL) =
{
>> >> + *to_be_subst =3D '\0';
>> >> + to_be_subst +=3D 12;
>> >> + xasprintf(&new_line, "%s%s%s", p, name, to_be_subst);
>> >> + if (fprintf(outf, "%s", new_line) < 0) {
>> >> + log_error(LOG_ARGS, "Could not write headers");
>> >> + free(new_line);
>> >> + free(line);
>> >> + fclose(f);
>> >> + return -1;
>> >> + }
>> >> + free(new_line);
>> >>  } else {
>> >>  if (fprintf(outf, "%s", p) < 0) {
>> >>  log_error(LOG_ARGS, "Could not write headers");
>> >> diff --git a/src/find_email_adr=2Ec b/src/find_email_adr=2Ec
>> >> index 0830098=2E=2E77b7cef 100644
>> >> --- a/src/find_email_adr=2Ec
>> >> +++ b/src/find_email_adr=2Ec
>> >> @@ -239,3 +239,55 @@ oncemore:
>> >> =20
>> >>  return retstruct;
>> >>  }
>> >> +
>> >> +/* ----------------------------------------------------------------=
-----------*\
>> >> + * Extract the display name of the first user,
>> >> + * removing comments, for example:
>> >> + *
>> >> + * for the input string:
>> >> + * "John (Amazing) Smith" <john=2Esmith@example=2Ecom>,
>> >> + * "Jane Doe" <jane=2Edoe@example=2Ecom
>> >> + *
>> >> + * returns: "John Smith"
>> >> +\* ----------------------------------------------------------------=
-----------*/
>> >> +char *
>> >> +find_display_name (char *name)
>> >> +{
>> >> + char *p, *nbuf, c;
>> >> + int nbuf_len, saw_angled_brackets;
>> >> +
>> >> + if (!name) return NULL;
>> >> + nbuf =3D xmalloc(strlen(name));
>> >> + saw_angled_brackets =3D 0;
>> >> + nbuf_len =3D 0;
>> >> +
>> >> + for (p =3D name; (c =3D *p) !=3D '\0' && isspace(c); p++);
>> >> + while ((c =3D *p++) !=3D '\0') {
>> >> + switch (c) {
>> >> + case '(':
>> >> + p =3D skip_comment(p);
>> >> + /* -------------------------------*\
>> >> + * Copy at most one space in place
>> >> + * of the comment=2E Don't copy any
>> >> + * whitespace if we are still at
>> >> + * the beginning of the string=2E
>> >> + */
>> >> + if (nbuf_len > 0 && isspace(*p) &&
>> >> + !isspace(nbuf[nbuf_len-1])) {
>> >> + nbuf[nbuf_len++] =3D *p++;
>> >> + }
>> >> + while(isspace(*p)) p++;
>> >> + /* -------------------------------*/
>> >> + break;
>> >> + case '<': saw_angled_brackets =3D 1; goto finished;
>> >> + case ',': goto finished;
>> >> + default: nbuf[nbuf_len++] =3D c; break;
>> >> + }
>> >> + }
>> >> +
>> >> + finished:
>> >> + if (!saw_angled_brackets || nbuf_len =3D=3D 0) { free(nbuf); retur=
n NULL; }
>> >> + for (p--, p--; (c =3D *p) && isspace(c); p--, nbuf_len--);
>> >> + nbuf[nbuf_len++] =3D '\0';
>> >> + return nbuf;
>> >> +}
>> >> --=20
>> >> 2=2E46=2E4
>> >>
>>=20
>>=20
>


