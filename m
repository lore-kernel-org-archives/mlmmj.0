From: Bertrand Jacquin <beber@meleeweb.net>
Date: Thu, 03 Oct 2013 21:51:41 +0000
Subject: Re: [mlmmj] Duplicates emails
Message-Id: <20131003215141.GN21048@lemonhead.scabb>
List-Id: <mlmmj.mlmmj.org>
References: <20130926225642.GF21048@lemonhead.scabb>
In-Reply-To: <20130926225642.GF21048@lemonhead.scabb>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-9"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hi,

D'ar yaou 03 a viz Here 2013 e 23 eur 46, =AB Ben Schmidt =BB he deus skriv=
et :
> It's possible you've managed to subscribe twice.

In this case I should receive all mails twice. This is not the case, I
get only some twice.

But, after checking .. I was in fact subscribe twice. How can I only receiv=
e some emails twice
?

> The currently released version of Mlmmj has a bug that makes this possibl=
e:
>=20
> http://mlmmj.org/bugs/bug.php?idC
>=20
> The bug will be fixed in the next release.
>=20
> To see if this is what is affecting you, have a look in $listdir/subscrib=
ers.d/b=20
> and see if your address appears twice (not necessarily together).
>=20
> If not, something else may be going on and we will have to investigate fu=
rther.
>=20
> Ben.
>=20
>=20
>=20
> On 27/09/13 8:56 AM, Bertrand Jacquin wrote:
> > Hi,
> >
> > I'm using mlmmj since a long time and didn't get duplicate issue for
> > now. I'm using mlmmj 1.2.18.0 with exim 4.80.1 and see that I get twice
> > a mail with the same Message-ID :
> >
> > #1
> >
> > Return-path: <git+bounces-1000151-beber=3Dmeleeweb.net@lists.enlightenm=
ent.org>
> > Envelope-to: beber@meleeweb.net
> > Delivery-date: Tue, 24 Sep 2013 16:23:28 +0200
> > Received: from e5v1.enlightenment.org ([140.211.167.135]:46087 helo=3Ds=
mtp.enlightenment.org)
> > 	by toothrot.meleeweb.net with esmtps (TLSv1.2:DHE-RSA-AES256-GCM-SHA38=
4:256)
> > 	id 1VOTWS-0003Ha-E2
> > 	for beber@meleeweb.net; Tue, 24 Sep 2013 16:23:28 +0200
> > Message-Id: <E1VOTW9-0002Bz-NM@e5-phabricator1.enlightenment.org>
> > Date: Tue, 24 Sep 2013 07:23:09 -0700
> >
> > #2
> >
> > Return-path: <git+bounces-1000151-beber=3Dmeleeweb.net@lists.enlightenm=
ent.org>
> > Envelope-to: beber@meleeweb.net
> > Delivery-date: Tue, 24 Sep 2013 16:23:34 +0200
> > Received: from e5v1.enlightenment.org ([140.211.167.135]:46240 helo=3Ds=
mtp.enlightenment.org)
> > 	by toothrot.meleeweb.net with esmtps (TLSv1.2:DHE-RSA-AES256-GCM-SHA38=
4:256)
> > 	id 1VOTWX-0003Hl-Vu
> > 	for beber@meleeweb.net; Tue, 24 Sep 2013 16:23:34 +0200
> > Message-Id: <E1VOTW9-0002Bz-NM@e5-phabricator1.enlightenment.org>
> > Date: Tue, 24 Sep 2013 07:23:09 -0700
> >
> > What you see from thoses two mail is that Date, Message-Id, Envelope-to
> > and Return-path are the very same, except Delivery-date which is added
> > by my MTA.
> >
> > Looking on logs from the source, what I can see is that mlmmj send 10
> > bunch of mails from git+bounces-1000151@lists.enlightenment.org so to
> > the every subscriber.
> >
> > Now queue ID :
> >
> > $ zfgrep 'git+bounces-1000151@lists.enlightenment.org' mail.log-2013092=
5.gz \
> >      | grep -Fw '<=3D' | awk '{print $6,$7,$8}'
> > 2013-09-24 07:23:10 1VOTWA-00042u-28
> > 2013-09-24 07:23:10 1VOTWA-000438-56
> > 2013-09-24 07:23:10 1VOTWA-00043J-8E
> > 2013-09-24 07:23:10 1VOTWA-00043S-B3
> > 2013-09-24 07:23:10 1VOTWA-00043f-Et
> > 2013-09-24 07:23:10 1VOTWA-00043r-Kf
> > 2013-09-24 07:23:10 1VOTWA-000445-PC
> > 2013-09-24 07:23:11 1VOTWA-00044I-W1
> > 2013-09-24 07:23:11 1VOTWB-00044S-54
> > 2013-09-24 07:23:11 1VOTWB-00044d-Au
> >
> > Then, I can see in relevant logs that my address is used as a destinati=
on
> > twice :
> >
> > $ zfgrep 'git+bounces-1000151@lists.enlightenment.org' mail.log-2013092=
5.gz \
> >      | grep -Fw '<=3D' | awk '{print $8}' \
> >      | xargs -I {} -- zfgrep "{}" mail.log-20130925.gz \
> >      | grep -Fw beber@meleeweb.net
> > Sep 24 07:23:33 e5-mail1 exim[15614]: 2013-09-24 07:23:33 1VOTWA-00043f=
-Et =3D> beber@meleeweb.net R=3Dverp T=3Dverp_smtp SA80 H=3Dmx1.meleeweb.ne=
t [88.190.23.70]:25 X=3DTLSv1.2:DHE-RSA-AES256-GCM-SHA384:256 CV=3Dyes DN=
=3D"/CN=3Dssl.as29.net" C=3D"250 OK id=3D1VOTWX-0003Hl-Vu" QT#s DT=11s
> > Sep 24 07:23:28 e5-mail1 exim[15628]: 2013-09-24 07:23:28 1VOTWA-00043r=
-Kf =3D> beber@meleeweb.net R=3Dverp T=3Dverp_smtp SA80 H=3Dmx1.meleeweb.ne=
t [88.190.23.70]:25 X=3DTLSv1.2:DHE-RSA-AES256-GCM-SHA384:256 CV=3Dyes DN=
=3D"/CN=3Dssl.as29.net" C=3D"250 OK id=3D1VOTWS-0003Ha-E2" QT=18s DT=12s
> >
> > I can found that the queue ID given by remote MTA (1VOTWX-0003Hl-Vu,
> > 1VOTWS-0003Ha-E2) match the queue ID show above in Received.
> >
> > How can this append ?
> >
> > control/maxverprecips is defined to '10' so may this impact for mlmmj ?
> >
> > In advance, thanks
> >

--=20
Beber

