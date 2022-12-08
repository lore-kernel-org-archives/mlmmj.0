From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Thu, 08 Dec 2022 12:49:37 +0000
Subject: Re: [mlmmj] mlmmj patches from distributions: Gentoo
Message-Id: <05aa432d371f4a35f9656476a87a93b61da76200.camel@telenet.be>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-C6Zyismzsp4i+TY7m6ce"
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20221208T005748-436219077Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20221208T005748-436219077Z@orbis-terrarum.net>
To: mlmmj@mlmmj.org

--=-C6Zyismzsp4i+TY7m6ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2022-12-08 at 09:01 +0100, Baptiste Daroussin wrote:
> On Thu, Dec 08, 2022 at 01:13:26AM +0000, Robin H. Johnson wrote:
> > There's one scaling discussion we need to have, but the handling
> > needs
> > to include how to incrementally get there:
> >=20
> > How to have millions of mails in /archive/!
> >=20
> > Our most active list is now approaching 1.5M emails in that
> > directory,
> > and it worries me.
>=20
> Why is it worrying you? a directory can hold way more than that.
>=20
> On FreeBSD, one thing we are doing is when creating the public
> archives via:
> https://fossil.nours.eu/mlmmj-archiver/doc/trunk/README.md=C2=A0(this may
> move to
> codeberg), I append the archives to a mbox, so I can cleanup what
> ever is in the
> archives directory if I need (I did not need up to now).
>=20
> DISCLAIMER: mlmmj-archiver is not portable at all yet, and is not
> even in alpha
> state :D (I am happily accepting portability patches, but this is not
> my focus
> yet).

I can share some stuff I did based on mhonarc to create a public
archive (also based on mlmmj-webarchiver in fact), but in the end:

- mlmmj archives are already in subdirectories archive/1 ... archive/15
- the mhonarc archive (public) is in subdirectories per-month, so I'm
totally not woried

Franky


--=-C6Zyismzsp4i+TY7m6ce
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Thu, 2022-12-08 at 09:01 +0100, Baptiste D=
aroussin wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; =
border-left:2px #729fcf solid;padding-left:1ex"><div>On Thu, Dec 08, 2022 a=
t 01:13:26AM +0000, Robin H. Johnson wrote:<br></div><blockquote type=3D"ci=
te" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:=
1ex"><div>There's one scaling discussion we need to have, but the handling =
needs</div></blockquote><blockquote type=3D"cite" style=3D"margin:0 0 0 .8e=
x; border-left:2px #729fcf solid;padding-left:1ex"><div>to include how to i=
ncrementally get there:<br></div><div><br></div><div>How to have millions o=
f mails in /archive/!<br></div><div><br></div><div>Our most active list is =
now approaching 1.5M emails in that directory,<br></div><div>and it worries=
 me.<br></div></blockquote><div><br></div><div>Why is it worrying you? a di=
rectory can hold way more than that.<br></div><div><br></div><div>On FreeBS=
D, one thing we are doing is when creating the public archives via:<br></di=
v><div><a href=3D"https://fossil.nours.eu/mlmmj-archiver/doc/trunk/README.m=
d">https://fossil.nours.eu/mlmmj-archiver/doc/trunk/README.md</a>&nbsp;(thi=
s may move to<br></div><div>codeberg), I append the archives to a mbox, so =
I can cleanup what ever is in the<br></div><div>archives directory if I nee=
d (I did not need up to now).<br></div><div><br></div><div>DISCLAIMER: mlmm=
j-archiver is not portable at all yet, and is not even in alpha<br></div><d=
iv>state :D (I am happily accepting portability patches, but this is not my=
 focus<br></div><div>yet).</div></blockquote><div><br></div><div style=3D"c=
aret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Sans; font-size=
: 16px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; t=
ext-transform: none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width:=
 0px; text-decoration: none;">I can share some stuff I did based on mhonarc=
 to create a public archive (also based on mlmmj-webarchiver in fact), but =
in the end:</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0); font-family: Sans; font-size: 16px; font-style: normal; font-variant-ca=
ps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; text-a=
lign: start; text-indent: 0px; text-transform: none; white-space: normal; w=
idows: auto; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, =
0.4); -webkit-text-stroke-width: 0px; text-decoration: none;"><br></div><di=
v style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: San=
s; font-size: 16px; font-style: normal; font-variant-caps: normal; font-wei=
ght: 400; letter-spacing: normal; orphans: auto; text-align: start; text-in=
dent: 0px; text-transform: none; white-space: normal; widows: auto; word-sp=
acing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-s=
troke-width: 0px; text-decoration: none;">- mlmmj archives are already in s=
ubdirectories archive/1 ... archive/15</div><div style=3D"caret-color: rgb(=
0, 0, 0); color: rgb(0, 0, 0); font-family: Sans; font-size: 16px; font-sty=
le: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: no=
rmal; orphans: auto; text-align: start; text-indent: 0px; text-transform: n=
one; white-space: normal; widows: auto; word-spacing: 0px; -webkit-tap-high=
light-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decor=
ation: none;">- the mhonarc archive (public) is in subdirectories per-month=
, so I'm totally not woried</div><div style=3D"caret-color: rgb(0, 0, 0); c=
olor: rgb(0, 0, 0); font-family: Sans; font-size: 16px; font-style: normal;=
 font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orpha=
ns: auto; text-align: start; text-indent: 0px; text-transform: none; white-=
space: normal; widows: auto; word-spacing: 0px; -webkit-tap-highlight-color=
: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none=
;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); =
font-family: Sans; font-size: 16px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; text-align=
: start; text-indent: 0px; text-transform: none; white-space: normal; widow=
s: auto; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4)=
; -webkit-text-stroke-width: 0px; text-decoration: none;">Franky</div><bloc=
kquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf so=
lid;padding-left:1ex"></blockquote></body></html>

--=-C6Zyismzsp4i+TY7m6ce--

