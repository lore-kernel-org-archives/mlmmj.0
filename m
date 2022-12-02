From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Fri, 02 Dec 2022 16:45:48 +0000
Subject: Re: [mlmmj] Candidate for an 1.4.0.a1
Message-Id: <42aadece6df105d7609ea265ec05ac56529112ab.camel@telenet.be>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-nT3OQT6uwLVw6o8+hi9u"
List-Id: <mlmmj.mlmmj.org>
References: <20221202145108.m3vw6f73ppyhvygm@aniel.nours.eu>
In-Reply-To: <20221202145108.m3vw6f73ppyhvygm@aniel.nours.eu>
To: mlmmj@mlmmj.org

--=-nT3OQT6uwLVw6o8+hi9u
Content-Type: multipart/alternative; boundary="=-85EKZw+jCgGqvtg4r2MT"

--=-85EKZw+jCgGqvtg4r2MT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

while you want to remove the php-part, I've updated it (made it work
with php 8), improved it (added some minor features to it, as view the
log and config the text-files and allow split-user management of
subscribers and config).
If you're willing to keep including the php-part, I'm willing to upload
my changes :-)=C2=A0While I'm at it: I also did some stuff concerning a
html-archive (no bling-bling, but it works). And I also did some work
on the mlmmj script to create a new mailing list.
Concerning the munge-from: some mailing lists are created so that the
original poster's info is not visibile by default. While I do
understand it changes possible signatures, so does the existing
"footer" option (which is not very usefull anyway, since it doesn't
work for html-mails, which most people tend to send nowadays).

Franky

On Fri, 2022-12-02 at 15:51 +0100, Baptiste Daroussin wrote:
> Hello everyone,
>=20
> A 1.5 years ago, I migrated FreeBSD's mailing list to mlmmj. So far
> so good we
> are very happy with it.
>=20
> Since that date I have been working on modernizing mlmmj codebase,
> integrate our
> patches etc. While the work is clearly not done, I think it is
> advanced enough
> for it to be shared.
>=20
> Disclaimer: this is a very early alpha, mostly tested under FreeBSD!
> While I tried
> (and intend) to keep using only portable things, their maybe issues,
> the main goal
> is to open the gate to contributors, testers and open discussions.
>=20
> https://codeberg.org/mlmmj/mlmmj/releases
>=20
> The working has been ongoing here: https://codeberg.org/mlmmj/mlmmj
>=20
> The changelog is the following:
> =C2=A0* Add a test suite
> =C2=A0* Modernize code (dprintf, posix_spawn, asprintf, getline, daemon,
> ...)
> =C2=A0* Supporting passing email to a mta over ipv6
> =C2=A0* Fix relaying in IPV6-only systems
> =C2=A0* Fix decode quoted printable subject
> =C2=A0* Fix parsing RFC1891
> =C2=A0* Fix a crash if no owner has been defined
> =C2=A0* Validate ranges of all integers conversion
> =C2=A0* New 'nobounceprobe' tunable for debugging purpose
> =C2=A0* New 'send' tunable to allow email passthrough
> =C2=A0* Add support for 'X-Original-From'
> =C2=A0* Reduce subscription confirmation address length to fit RFC 5321
> =C2=A0* Use arc4random is available
> =C2=A0* Reduce memory manipulation
> =C2=A0* When unsubscribing bouncers, keep the bounce file if something
> went
> =C2=A0* wrong and report in syslog what went wrong
> =C2=A0* Remove the -b option from mlmmj-unsub, it is not used anymore
> =C2=A0* simplify the locking mechanism
>=20
> My plans before a full 1.4.0:
> =C2=A0* Remove the php part
> =C2=A0* Merge interesting parts of mlmmj-receive-strip into mlmmj-receive
>=20
> Note that one thing I didn't do is merge the mungefrom patches. So
> far I consider
> mailing list should not be altering parts of the email that are part
> of the dkim
> signatures aka:
> - Should not modify the subject
> - Should not strip any part of the emial
> - Should not add a footer
>=20
> If so, emails going through a mailing list respects dkim/dmarc
> expectations.
> Note that I don't have strong feelings about this, so I can be
> convince to merge
> those patches.
>=20
> Open question:
> - should this still be mlmmj? (aka the continuation of the project?)
> if most do
> =C2=A0 not like the approach, I will of course fork and rename, otherwise
> I will be
> =C2=A0 happy to make it a continuation of the project.
>=20
> Best regards,
> Bapt
>=20
>=20

--=-85EKZw+jCgGqvtg4r2MT
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>Hi,</div><div><br></div><div>while you want t=
o remove the php-part, I've updated it (made it work with php 8), improved =
it (added some minor features to it, as view the log and config the text-fi=
les and allow split-user management of subscribers and config).</div><div>I=
f you're willing to keep including the php-part, I'm willing to upload my c=
hanges <img src=3D"cid:df27f66b91325eefabd322095700a9f2d72e29ff.camel@telen=
et.be-0" alt=3D":-)" width=3D"16px" height=3D"16px">&nbsp;While I'm at it: =
I also did some stuff concerning a html-archive (no bling-bling, but it wor=
ks). And I also did some work on the mlmmj script to create a new mailing l=
ist.</div><div>Concerning the munge-from: some mailing lists are created so=
 that the original poster's info is not visibile by default. While I do und=
erstand it changes possible signatures, so does the existing "footer" optio=
n (which is not very usefull anyway, since it doesn't work for html-mails, =
which most people tend to send nowadays).</div><div><br></div><div>Franky</=
div><div><span></span></div><div><br></div><div>On Fri, 2022-12-02 at 15:51=
 +0100, Baptiste Daroussin wrote:</div><blockquote type=3D"cite" style=3D"m=
argin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div>Hell=
o everyone,<br></div><div><br></div><div>A 1.5 years ago, I migrated FreeBS=
D's mailing list to mlmmj. So far so good we<br></div><div>are very happy w=
ith it.<br></div><div><br></div><div>Since that date I have been working on=
 modernizing mlmmj codebase, integrate our<br></div><div>patches etc. While=
 the work is clearly not done, I think it is advanced enough<br></div><div>=
for it to be shared.<br></div><div><br></div><div>Disclaimer: this is a ver=
y early alpha, mostly tested under FreeBSD! While I tried<br></div><div>(an=
d intend) to keep using only portable things, their maybe issues, the main =
goal<br></div><div>is to open the gate to contributors, testers and open di=
scussions.<br></div><div><br></div><div><a href=3D"https://codeberg.org/mlm=
mj/mlmmj/releases">https://codeberg.org/mlmmj/mlmmj/releases</a><br></div><=
div><br></div><div>The working has been ongoing here: <a href=3D"https://co=
deberg.org/mlmmj/mlmmj">https://codeberg.org/mlmmj/mlmmj</a><br></div><div>=
<br></div><div>The changelog is the following:<br></div><div>&nbsp;* Add a =
test suite<br></div><div>&nbsp;* Modernize code (dprintf, posix_spawn, aspr=
intf, getline, daemon, ...)<br></div><div>&nbsp;* Supporting passing email =
to a mta over ipv6<br></div><div>&nbsp;* Fix relaying in IPV6-only systems<=
br></div><div>&nbsp;* Fix decode quoted printable subject<br></div><div>&nb=
sp;* Fix parsing RFC1891<br></div><div>&nbsp;* Fix a crash if no owner has =
been defined<br></div><div>&nbsp;* Validate ranges of all integers conversi=
on<br></div><div>&nbsp;* New 'nobounceprobe' tunable for debugging purpose<=
br></div><div>&nbsp;* New 'send' tunable to allow email passthrough<br></di=
v><div>&nbsp;* Add support for 'X-Original-From'<br></div><div>&nbsp;* Redu=
ce subscription confirmation address length to fit RFC 5321<br></div><div>&=
nbsp;* Use arc4random is available<br></div><div>&nbsp;* Reduce memory mani=
pulation<br></div><div>&nbsp;* When unsubscribing bouncers, keep the bounce=
 file if something went<br></div><div>&nbsp;* wrong and report in syslog wh=
at went wrong<br></div><div>&nbsp;* Remove the -b option from mlmmj-unsub, =
it is not used anymore<br></div><div>&nbsp;* simplify the locking mechanism=
<br></div><div><br></div><div>My plans before a full 1.4.0:<br></div><div>&=
nbsp;* Remove the php part<br></div><div>&nbsp;* Merge interesting parts of=
 mlmmj-receive-strip into mlmmj-receive<br></div><div><br></div><div>Note t=
hat one thing I didn't do is merge the mungefrom patches. So far I consider=
<br></div><div>mailing list should not be altering parts of the email that =
are part of the dkim<br></div><div>signatures aka:<br></div><div>- Should n=
ot modify the subject<br></div><div>- Should not strip any part of the emia=
l<br></div><div>- Should not add a footer<br></div><div><br></div><div>If s=
o, emails going through a mailing list respects dkim/dmarc expectations.<br=
></div><div>Note that I don't have strong feelings about this, so I can be =
convince to merge<br></div><div>those patches.<br></div><div><br></div><div=
>Open question:<br></div><div>- should this still be mlmmj? (aka the contin=
uation of the project?) if most do<br></div><div>&nbsp; not like the approa=
ch, I will of course fork and rename, otherwise I will be<br></div><div>&nb=
sp; happy to make it a continuation of the project.<br></div><div><br></div=
><div>Best regards,<br></div><div>Bapt<br></div><div><br></div><div><br></d=
iv></blockquote></body></html>

--=-85EKZw+jCgGqvtg4r2MT--

--=-nT3OQT6uwLVw6o8+hi9u
Content-ID: <df27f66b91325eefabd322095700a9f2d72e29ff.camel@telenet.be-0>
Content-Disposition: inline; filename="face-smile.png"
Content-Type: image/png; name="face-smile.png"
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABHNCSVQICAgIfAhkiAAAAAlwSFlz
AAAN1wAADdcBQiibeAAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAAXdEVY
dEF1dGhvcgBMYXBvIENhbGFtYW5kcmVp35EaKgAAACl0RVh0RGVzY3JpcHRpb24AQmFzZWQgb2Yg
SmFrdWIgU3RlaW5lciBkZXNpZ26ghAVzAAADRklEQVQ4jWWTXWiVdQCHn//7ec4+zmrbcZ+usT4w
y23iljK3cmIRIl10GYGgVCMovOjjMsSrwGEFSXohMchCKBBUWEFqrQ10yTbHNh2bp03nvrdztvN+
/t/330U3C3/XD8/FDx6hlGLrLnzeXq0L/R1bVwfQxB4AYvW3H4kbkYouHvuyb24rL7YKej7rOJYs
Kv7m5Vf22eW1VUZheRqUIr+8yNLsYzk00O/nNzc/fu9M/4UnBD982nat9oXdnS0HX08I/w7CWgRL
Agp8E8JKIrOJvt6rXmZ8+HrXt7cPA2gA33/S3lXz3K7O1vb9iWj6PFd+vcaVgQxaugyRLoMSxenv
fuTu72d47eChRE3Diwe632/pAtDOn+io061k9562NxLe3XPE0QK3J/LcHllH2UmwCxAFRfw1kmPo
3gze6FlePXQkqZt298mjLXVaKMPjzc177XjmOnHuAQJI2BoJWwcVI5QCFZOwDCxLIHMZePgH+/d1
2FEkjxuRDDrLKrbrwUQvQsTg+xxpT6OltyG83H9PbWZ59616GlPrCG+N4NEtKp49qkcy6DQCpTcW
PVXB+uI0q2jUFHrsrHLRyx3ihVkEArWxwZsvScIFH5mTLMxPUbwjRSC1RiOUwvCyC+ihz9OFNlf7
16mtlWyvd6moKsQ0BMr1eTiT5d5Ejrl5l+ZSRaWlEUTKMFzXGc3cH9pba5RgyU0O7ypnaDnBz79l
Wd2YoyChIaRCKEFjXQmdO1OkYsnU2C183xs1vIib45P3W9OFBZrlriCyKzSlK9nd2AZFNfjuBpZd
jB75+JkB5KNxfLue4fHx2JPcNGSkekamFj+qbtCTOyIF+KhonnC1F19LEGOioggt2MCWEt2PeSBN
+kcyfiC1Hn1gbHHpcs/X1j8rbmupuW6mlESPFFocEwcBkesifAc7DFFOQMaBS2Oak3Pj0z/dmL6k
AVTkq09lA3Py8ly1M7hmMJ8L8bMu5qZDgeti5F3WciF3VjUuTpY6yw6TS/rMqf+18EFLi5lPrZxU
Sp14piiXqEn6ojLpA/DYsZh1bDWVLfIU4qtyb9sX5wYHwydqBHi7o6FJI/xQINqjWDwPoGtqUqH6
Ysyzv/w5PbyV/xd0ZaEGG/mx/wAAAABJRU5ErkJggg==


--=-nT3OQT6uwLVw6o8+hi9u--

