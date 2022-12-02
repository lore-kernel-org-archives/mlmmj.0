From: Michele Roncaglione Tet <michele@10100.to>
Date: Fri, 02 Dec 2022 16:06:04 +0000
Subject: Re: [mlmmj] Candidate for an 1.4.0.a1
Message-Id: <4455471.LvFx2qVVIh@yoko>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nextPart2273796.ElGaqSPkdT"
List-Id: <mlmmj.mlmmj.org>
References: <20221202145108.m3vw6f73ppyhvygm@aniel.nours.eu>
In-Reply-To: <20221202145108.m3vw6f73ppyhvygm@aniel.nours.eu>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.

--nextPart2273796.ElGaqSPkdT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Great! Thank you for your effort and for sharing it!
Nowadays there isn't real ML system efficient and effective like mlmmj. Unf=
ortunately seems the developments are  at an impasse and contributions like=
 yours are very important! Thank you very much!

=2D-=20
=E2=9A=82 =E2=9A=83 =E2=9A=80 =E2=9A=81 =E2=9A=80 =E2=9A=80=20

In data venerd=C3=AC 2 dicembre 2022 15:51:08 CET, Baptiste Daroussin ha sc=
ritto:
> Hello everyone,
>=20
> A 1.5 years ago, I migrated FreeBSD's mailing list to mlmmj. So far so go=
od we
> are very happy with it.
>=20
> Since that date I have been working on modernizing mlmmj codebase, integr=
ate our
> patches etc. While the work is clearly not done, I think it is advanced e=
nough
> for it to be shared.
>=20
> Disclaimer: this is a very early alpha, mostly tested under FreeBSD! Whil=
e I tried
> (and intend) to keep using only portable things, their maybe issues, the =
main goal
> is to open the gate to contributors, testers and open discussions.
>=20
> https://codeberg.org/mlmmj/mlmmj/releases
>=20
> The working has been ongoing here: https://codeberg.org/mlmmj/mlmmj
>=20
> The changelog is the following:
>  * Add a test suite
>  * Modernize code (dprintf, posix_spawn, asprintf, getline, daemon, ...)
>  * Supporting passing email to a mta over ipv6
>  * Fix relaying in IPV6-only systems
>  * Fix decode quoted printable subject
>  * Fix parsing RFC1891
>  * Fix a crash if no owner has been defined
>  * Validate ranges of all integers conversion
>  * New 'nobounceprobe' tunable for debugging purpose
>  * New 'send' tunable to allow email passthrough
>  * Add support for 'X-Original-From'
>  * Reduce subscription confirmation address length to fit RFC 5321
>  * Use arc4random is available
>  * Reduce memory manipulation
>  * When unsubscribing bouncers, keep the bounce file if something went
>  * wrong and report in syslog what went wrong
>  * Remove the -b option from mlmmj-unsub, it is not used anymore
>  * simplify the locking mechanism
>=20
> My plans before a full 1.4.0:
>  * Remove the php part
>  * Merge interesting parts of mlmmj-receive-strip into mlmmj-receive
>=20
> Note that one thing I didn't do is merge the mungefrom patches. So far I =
consider
> mailing list should not be altering parts of the email that are part of t=
he dkim
> signatures aka:
> - Should not modify the subject
> - Should not strip any part of the emial
> - Should not add a footer
>=20
> If so, emails going through a mailing list respects dkim/dmarc expectatio=
ns.
> Note that I don't have strong feelings about this, so I can be convince t=
o merge
> those patches.
>=20
> Open question:
> - should this still be mlmmj? (aka the continuation of the project?) if m=
ost do
>   not like the approach, I will of course fork and rename, otherwise I wi=
ll be
>   happy to make it a continuation of the project.
>=20
> Best regards,
> Bapt
>=20
>=20
>=20



--nextPart2273796.ElGaqSPkdT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"

<html>
<head>
<meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF-8">
</head>
<body><p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0=
;">Great! Thank you for your effort and for sharing it!</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Now=
adays there isn't real ML system efficient and effective like mlmmj. Unfort=
unately seems the developments are&nbsp; at an impasse and contributions li=
ke yours are very important! Thank you very much!</p>
<br /><p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0=
;">-- </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">=E2=
=9A=82 =E2=9A=83 =E2=9A=80 =E2=9A=81 =E2=9A=80 =E2=9A=80 </p>
<br /><p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0=
;">In data venerd=C3=AC 2 dicembre 2022 15:51:08 CET, Baptiste Daroussin ha=
 scritto:</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Hello everyone,</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; A 1.5 years ago, I migrated FreeBSD's mailing list to mlmmj. So far so go=
od we</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; are very happy with it.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Since that date I have been working on modernizing mlmmj codebase, integr=
ate our</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; patches etc. While the work is clearly not done, I think it is advanced e=
nough</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; for it to be shared.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Disclaimer: this is a very early alpha, mostly tested under FreeBSD! Whil=
e I tried</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; (and intend) to keep using only portable things, their maybe issues, the =
main goal</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; is to open the gate to contributors, testers and open discussions.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; https://codeberg.org/mlmmj/mlmmj/releases</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; The working has been ongoing here: https://codeberg.org/mlmmj/mlmmj</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; The changelog is the following:</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;&nbsp; * Add a test suite</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;&nbsp; * Modernize code (dprintf, posix_spawn, asprintf, getline, daemon, =
=2E..)</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;&nbsp; * Supporting passing email to a mta over ipv6</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;&nbsp; * Fix relaying in IPV6-only systems</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;&nbsp; * Fix decode quoted printable subject</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;&nbsp; * Fix parsing RFC1891</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;&nbsp; * Fix a crash if no owner has been defined</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;&nbsp; * Validate ranges of all integers conversion</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;&nbsp; * New 'nobounceprobe' tunable for debugging purpose</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;&nbsp; * New 'send' tunable to allow email passthrough</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;&nbsp; * Add support for 'X-Original-From'</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;&nbsp; * Reduce subscription confirmation address length to fit RFC 5321</=
p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;&nbsp; * Use arc4random is available</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;&nbsp; * Reduce memory manipulation</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;&nbsp; * When unsubscribing bouncers, keep the bounce file if something we=
nt</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;&nbsp; * wrong and report in syslog what went wrong</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;&nbsp; * Remove the -b option from mlmmj-unsub, it is not used anymore</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;&nbsp; * simplify the locking mechanism</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; My plans before a full 1.4.0:</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;&nbsp; * Remove the php part</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;&nbsp; * Merge interesting parts of mlmmj-receive-strip into mlmmj-receive=
</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Note that one thing I didn't do is merge the mungefrom patches. So far I =
consider</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; mailing list should not be altering parts of the email that are part of t=
he dkim</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; signatures aka:</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; - Should not modify the subject</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; - Should not strip any part of the emial</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; - Should not add a footer</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; If so, emails going through a mailing list respects dkim/dmarc expectatio=
ns.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Note that I don't have strong feelings about this, so I can be convince t=
o merge</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; those patches.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Open question:</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; - should this still be mlmmj? (aka the continuation of the project?) if m=
ost do</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;&nbsp;&nbsp; not like the approach, I will of course fork and rename, othe=
rwise I will be</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;&nbsp;&nbsp; happy to make it a continuation of the project.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Best regards,</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Bapt</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<br /><br /></body>
</html>
--nextPart2273796.ElGaqSPkdT--




