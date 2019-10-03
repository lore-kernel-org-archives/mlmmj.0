From: Martin Brampton <martin@black-sheep-research.com>
Date: Thu, 03 Oct 2019 20:29:01 +0000
Subject: Fwd: Munge from (was Re: [mlmmj] List server DKIM)
Message-Id: <etPan.5d965bce.238e1f29.58b5@black-sheep-research.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="5d965bce_46e87ccd_58b5"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

--5d965bce_46e87ccd_58b5
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Sorry, my mail client doesn=E2=80=99t like adding replies below quotes.

Seems to me Jon =46airbairn is on the right lines (below). =20

Just dropping DKIM headers creates a problem, SP=46 is broken too, and if=
 sender has a DMARC policy of reject, the message will get thrown away. =20

Removing and then adding is OK provided =E2=80=9Cfrom=E2=80=9D is changed=
 to the list. The server running the list can only add DKIM for domains i=
t manages. =20

Changing =E2=80=9Cfrom=E2=80=9D fixes SP=46 and DKIM. =20

Is that right=3F =20

-- =20
Martin Brampton =20

On October 3, 2019 at 6:38:31 PM, J=C3=B3n =46airbairn (jf-mlmmj=40bookof=
sand.co.uk(mailto:jf-mlmmj=40bookofsand.co.uk)) wrote:

> On Thu, 3 Oct 2019 18:04:48 +0100 you wrote:
> > My list server is sending out mail, and I have configured to
> > add a footer, a prefix and mailing list headers.
> > =20
> > I don't know if it is those additions, but the messages
> > received by list subscribers are failing DKIM checks with
> > wrong body hash.
> =20
> Yes, those additions will cause that.
> =20
> > Is there a way to fix this please=3F
> =20
> One way is not to make those additions, but that isn=E2=80=99t what you=

> want :-/
> =20
> I have implemented =22munge from=22, which replaces the from field
> with the address of the list and adds a comment to it containing
> the name and email address of the sender, so that you can remove
> the DKIM signature and solve this problem (and add you own if
> you want). I was waiting to see if there was any activity on the
> list before posting about it.
> =20
> So my general question is, is this something that people want,
> and if so, where should I send the patch=3F I=E2=80=99m not familiar wi=
th
> Mercurial, and I=E2=80=99m not really a C programmer (I think I last
> wrote C in anger in about 1987), so it would be best if someone
> who is were to review it.
> =20
> =E2=80=94 J=C3=B3n

--5d965bce_46e87ccd_58b5
Content-Type: text/html; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>Sorry,=20my=20mail=20client=20doesn=E2=80=99t=
=20like=20adding=20replies=20below=20quotes.</div><div><br></div><div>Seems=
=20to=20me=20Jon=20Fairbairn=20is=20on=20the=20right=20lines=20(below).</di=
v><div><br></div><div>Just=20dropping=20DKIM=20headers=20creates=20a=20prob=
lem,=20SPF=20is=20broken=20too,=20and=20if=20sender=20has=20a=20DMARC=20pol=
icy=20of=20reject,=20the=20message=20will=20get=20thrown=20away.</div><div>=
<br></div><div>Removing=20and=20then=20adding=20is=20OK=20provided=20=E2=80=
=9Cfrom=E2=80=9D=20is=20changed=20to=20the=20list.=20The=20server=20running=
=20the=20list=20can=20only=20add=20DKIM=20for=20domains=20it=20manages.</di=
v><div><br></div>Changing=20=E2=80=9Cfrom=E2=80=9D=20fixes=20SPF=20and=20DK=
IM.<div><br></div><div>Is=20that=20right?&nbsp;</div><div><br><div=20=20cla=
ss=3D"gmail_signature"><div>--&nbsp;<br>Martin=20Brampton</div>
</div>=20<p=20class=3D"gmail_quote"=20style=3D"color:#000;">On=20October=20=
3,=202019=20at=206:38:31=20PM,=20J=C3=B3n=20Fairbairn=20(<a=20href=3D"mailt=
o:jf-mlmmj@bookofsand.co.uk">jf-mlmmj@bookofsand.co.uk</a>)=20wrote:</p>=20=
<blockquote=20type=3D"cite"=20class=3D"gmail_quote"><span><div><div></div><=
div>On=20Thu,=203=20Oct=202019=2018:04:48=20+0100=20you=20wrote:
<br><blockquote=20type=3D"cite">My=20list=20server=20is=20sending=20out=20m=
ail,=20and=20I=20have=20configured=20to
<br>add=20a=20footer,=20a=20prefix=20and=20mailing=20list=20headers.
<br>
<br>I=20don't=20know=20if=20it=20is=20those=20additions,=20but=20the=20mess=
ages
<br>received=20by=20list=20subscribers=20are=20failing=20DKIM=20checks=20wi=
th
<br>wrong=20body=20hash.
<br></blockquote>
<br>Yes,=20those=20additions=20will=20cause=20that.
<br>
<br><blockquote=20type=3D"cite">Is=20there=20a=20way=20to=20fix=20this=20pl=
ease?
<br></blockquote>
<br>One=20way=20is=20not=20to=20make=20those=20additions,=20but=20that=20is=
n=E2=80=99t=20what=20you
<br>want=20:-/
<br>
<br>I=20have=20implemented=20"munge=20from",=20which=20replaces=20the=20fro=
m=20field
<br>with=20the=20address=20of=20the=20list=20and=20adds=20a=20comment=20to=
=20it=20containing
<br>the=20name=20and=20email=20address=20of=20the=20sender,=20so=20that=20y=
ou=20can=20remove
<br>the=20DKIM=20signature=20and=20solve=20this=20problem=20(and=20add=20yo=
u=20own=20if
<br>you=20want).=20I=20was=20waiting=20to=20see=20if=20there=20was=20any=20=
activity=20on=20the
<br>list=20before=20posting=20about=20it.
<br>
<br>So=20my=20general=20question=20is,=20is=20this=20something=20that=20peo=
ple=20want,
<br>and=20if=20so,=20where=20should=20I=20send=20the=20patch?=20I=E2=80=99m=
=20not=20familiar=20with
<br>Mercurial,=20and=20I=E2=80=99m=20not=20really=20a=20C=20programmer=20(I=
=20think=20I=20last
<br>wrote=20C=20in=20anger=20in=20about=201987),=20so=20it=20would=20be=20b=
est=20if=20someone
<br>who=20is=20were=20to=20review=20it.
<br>
<br>=20=20=E2=80=94=20J=C3=B3n
<br></div></div></span></blockquote>

</div><div=20style=3D"visibility:hidden;"><img=20alt=3D""=20src=3D"http://t=
rack.smtp2go.net/open/1iG7pyr_ZUTim-._IvTHlzdO/1.gif"=20/></div></body></ht=
ml>
--5d965bce_46e87ccd_58b5--


