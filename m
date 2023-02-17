From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Fri, 17 Feb 2023 16:00:43 +0000
Subject: Re: [mlmmj] Candidate for an 1.4.0.a1, glad for the work
Message-Id: <79ffa73bdb0f2a283ff074de851bc8f48f3e1a24.camel@telenet.be>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-6rErEYs2STEx55kGaLWJ"
List-Id: <mlmmj.mlmmj.org>
References: <572dfe82-87b0-f959-f174-0944c5658199@coredump.us>
In-Reply-To: <572dfe82-87b0-f959-f174-0944c5658199@coredump.us>
To: mlmmj@mlmmj.org

--=-6rErEYs2STEx55kGaLWJ
Content-Type: multipart/alternative; boundary="=-SMr/6e9vIbUNLr28rbf3"

--=-SMr/6e9vIbUNLr28rbf3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I created a PR for the php-web interface. Although it should be tested
by others, I had to change a "ROOT" in the rtemplate class before it
actually worked :-)
The archiving is for later on, in fact if anybody has a good one I'm
more than willing to switch to that ... the archiving tool I use works
ok, but I feel it is a mess in code

F.

On Wed, 2023-02-08 at 12:20 +0100, Baptiste Daroussin wrote:
> Can you open a merge request so I can merge it in the repo?
>=20
> Bapt
>=20
> Le 8 f=C3=A9vrier 2023 12:03:32 GMT+01:00, Franky Van Liedekerke <liedeke=
f@telenet.be> a =C3=A9crit=C2=A0:
> > For those interested: I updated the php interface to work with 8.*
> > , and added small extra functionality:
> > - edit the text files
> > - see the log
> > - use 2 extra configs to limit the people who can access the php
> > admin itf and/or who can manage the subscribers
> >=20
> > I also did my interpretation of an archiver, simple but it works
> > (on linux) using mhonarc and php (control file 'webarchive' to
> > activate archiving per list), and 'webarchiveprotected' to limit
> > who can access the archive. A small
> > demo:=C2=A0https://lists.belnet.be/archive/
> >=20
> > Franky
> >=20
> > On Wed, 2023-02-08 at 07:44 +0000, Chris Knadle wrote:
> > > Greetings.
> > >=20
> > > I want to give anyone working on the 1.4.0.a1 mlmmj candidate my
> > > thanks, it's=20
> > > good to see that this work is going on, and I'm looking forward
> > > to packaging it=20
> > > and other pieces for it for Debian when it's in a semi-
> > > stable/usable state.
> > >=20
> > > I'm personally interested in an mlmmj-archiver web indexing
> > > program, because=20
> > > I've had difficulties with other mailing list archivers. Lurker
> > > works but seemed=20
> > > relatively inflexible, and Mhonarc required a fair bit of
> > > configuration and I=20
> > > never did figure out its configuration language. Debian mailing
> > > lists are=20
> > > archived in Mhonarc but I don't currently have access to the
> > > configuration used=20
> > > for those.
> > >=20
> > > Re: using the mlmmj name, my only thought is perhaps a minor
> > > addition to the=20
> > > name to distinguish the fork, such as mlmmj-ng (next-generation)
> > > or mlmmj2. It's=20
> > > not a requirement, it's just mentioning what I typically see
> > > other projects do.=20
> > > I think the idea is to cover the possibility of upstream picking
> > > up their old=20
> > > project again and/or avoiding old/new naming clashes. If the
> > > old/same name is=20
> > > stuck with I don't have any objection.
> > >=20
> > > Just in case I don't check the mailing list often enough: when
> > > you think the=20
> > > program is in a buildable/usable enough state for being packaged
> > > and uploaded to=20
> > > Debian, please ping me via email.
> > >=20
> > > Thanks
> > > =C2=A0=C2=A0=C2=A0 -- Chris
> > >=20
> > > --=20
> > > Chris Knadle
> > > Chris.Knadle@coredump.us
> > >=20
> > > Baptiste Daroussin:
> > > > Hello everyone,
> > > >=20
> > > > A 1.5 years ago, I migrated FreeBSD's mailing list to mlmmj. So
> > > > far so good we
> > > > are very happy with it.
> > > >=20
> > > > Since that date I have been working on modernizing mlmmj
> > > > codebase, integrate our
> > > > patches etc. While the work is clearly not done, I think it is
> > > > advanced enough
> > > > for it to be shared.
> > >=20
> > >=20
> > >=20

--=-SMr/6e9vIbUNLr28rbf3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>I created a PR for the php-web interface. Alt=
hough it should be tested by others, I had to change a "ROOT" in the rtempl=
ate class before it actually worked <img src=3D"cid:ff91a62f041c3ec7c0ab7ad=
7fd351f7531540f27.camel@telenet.be-0" alt=3D":-)" width=3D"16px" height=3D"=
16px"></div><div>The archiving is for later on, in fact if anybody has a go=
od one I'm more than willing to switch to that ... the archiving tool I use=
 works ok, but I feel it is a mess in code</div><div><br></div><div>F.</div=
><div><span></span></div><div><br></div><div>On Wed, 2023-02-08 at 12:20 +0=
100, Baptiste Daroussin wrote:</div><blockquote type=3D"cite" style=3D"marg=
in:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div>Can you=
 open a merge request so I can merge it in the repo?<br><br>Bapt<br><br></d=
iv><div class=3D"gmail_quote">Le 8 f=C3=A9vrier 2023 12:03:32 GMT+01:00, Fr=
anky Van Liedekerke &lt;liedekef@telenet.be&gt; a =C3=A9crit&nbsp;:<br><blo=
ckquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf s=
olid;padding-left:1ex"><div>For those interested: I updated the php interfa=
ce to work with 8.* , and added small extra functionality:</div><div>- edit=
 the text files</div><div>- see the log</div><div>- use 2 extra configs to =
limit the people who can access the php admin itf and/or who can manage the=
 subscribers</div><div><br></div><div>I also did my interpretation of an ar=
chiver, simple but it works (on linux) using mhonarc and php (control file =
'webarchive' to activate archiving per list), and 'webarchiveprotected' to =
limit who can access the archive. A small demo:&nbsp;<a href=3D"https://lis=
ts.belnet.be/archive/">https://lists.belnet.be/archive/</a></div><div><span=
></span></div><div><br></div><div>Franky</div><div><br></div><div>On Wed, 2=
023-02-08 at 07:44 +0000, Chris Knadle wrote:</div><blockquote type=3D"cite=
" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1e=
x"><div>Greetings.<br></div><div><br></div><div>I want to give anyone worki=
ng on the 1.4.0.a1 mlmmj candidate my thanks, it's <br></div><div>good to s=
ee that this work is going on, and I'm looking forward to packaging it <br>=
</div><div>and other pieces for it for Debian when it's in a semi-stable/us=
able state.<br></div><div><br></div><div>I'm personally interested in an ml=
mmj-archiver web indexing program, because <br></div><div>I've had difficul=
ties with other mailing list archivers. Lurker works but seemed <br></div><=
div>relatively inflexible, and Mhonarc required a fair bit of configuration=
 and I <br></div><div>never did figure out its configuration language. Debi=
an mailing lists are <br></div><div>archived in Mhonarc but I don't current=
ly have access to the configuration used <br></div><div>for those.<br></div=
><div><br></div><div>Re: using the mlmmj name, my only thought is perhaps a=
 minor addition to the <br></div><div>name to distinguish the fork, such as=
 mlmmj-ng (next-generation) or mlmmj2. It's <br></div><div>not a requiremen=
t, it's just mentioning what I typically see other projects do. <br></div><=
div>I think the idea is to cover the possibility of upstream picking up the=
ir old <br></div><div>project again and/or avoiding old/new naming clashes.=
 If the old/same name is <br></div><div>stuck with I don't have any objecti=
on.<br></div><div><br></div><div>Just in case I don't check the mailing lis=
t often enough: when you think the <br></div><div>program is in a buildable=
/usable enough state for being packaged and uploaded to <br></div><div>Debi=
an, please ping me via email.<br></div><div><br></div><div>Thanks<br></div>=
<div>&nbsp;&nbsp;&nbsp; -- Chris<br></div><div><br></div><div>-- <br></div>=
<div>Chris Knadle<br></div><div><a href=3D"mailto:Chris.Knadle@coredump.us"=
>Chris.Knadle@coredump.us</a><br></div><div><br></div><div>Baptiste Darouss=
in:<br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-l=
eft:2px #729fcf solid;padding-left:1ex"><div>Hello everyone,<br></div><div>=
<br></div><div>A 1.5 years ago, I migrated FreeBSD's mailing list to mlmmj.=
 So far so good we<br></div><div>are very happy with it.<br></div><div><br>=
</div><div>Since that date I have been working on modernizing mlmmj codebas=
e, integrate our<br></div><div>patches etc. While the work is clearly not d=
one, I think it is advanced enough<br></div><div>for it to be shared.<br></=
div></blockquote><div><br></div><div><br></div><div><br></div></blockquote>=
</blockquote></div></blockquote></body></html>

--=-SMr/6e9vIbUNLr28rbf3--

--=-6rErEYs2STEx55kGaLWJ
Content-ID: <ff91a62f041c3ec7c0ab7ad7fd351f7531540f27.camel@telenet.be-0>
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


--=-6rErEYs2STEx55kGaLWJ--

