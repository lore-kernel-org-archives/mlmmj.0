From: Morten Kirkegaard Poulsen <mopo@fabletech.com>
Date: Wed, 16 Dec 2009 06:21:00 +0000
Subject: Re: [PATCH] Re: requeued mail files going missing from archive/
Message-Id: <1260944460.25648.8.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20091216T025726-844574632Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20091216T025726-844574632Z@orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Wed, 2009-12-16 at 07:07 +0100, Mads Martin J=C3=B8rgensen wrote:
> > If the maintd visited more than one mail in the /requeue/ directory, an=
d the
> > FIRST one set the fromrequeuedir flag to unlink the mail file, the flag=
 was NOT
> > cleared and caused mail in the real archive to be erronously removed.
...
> Yikes,

Oh yes.

> good catch.

Indeed. Thanks Robin.

> Looks like Morten will grant the mailing world a 1.2.17 christmas
> present :)

This definitely calls for a new release.

Does anybody else have patches which should be included in 1.2.17?

Morten

--=20
Morten Kirkegaard Poulsen <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/



