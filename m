From: Geert Stappers <stappers@stappers.nl>
Date: Sun, 21 Jun 2020 15:58:08 +0000
Subject: Re: [mlmmj] Trying to use moderation, but email server is rejecting moderator's release reply to lis
Message-Id: <20200621155808.r6tduylg7bzpd36j@gpm.stappers.nl>
List-Id: <mlmmj.mlmmj.org>
References: <8cd0e063-4f12-5fed-ee05-d6d1f34640fd@vlsc.org>
In-Reply-To: <8cd0e063-4f12-5fed-ee05-d6d1f34640fd@vlsc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Sun, Jun 21, 2020 at 07:50:18AM -0700, webmaster wrote:
> On 6/21/2020 5:33 AM, Roderick wrote:
> >
> > On Sun, 21 Jun 2020, Geert Stappers wrote:
> >
> >>>>>>> [list name]_release-59d6019902a42d96@vlsc.org
> >
> >> Yes=A0 and time will tell how usefull that is for original poster.
> >
> > I never used moderation, just tested a little mlmmj.
> >
> > As I remember, mlmmj is configured out of the box to use + as separator,
> > and many MTA are out of the box configured to consider + part as
> > extension.
> >
> > Perhaps he misconfigured mlmmj to use _ as separator?
> >
>=20
> Thanks for the nudge, Roderick, that was all I needed - I reset the
> delimiter to "+" and all is well.
>=20
> I overlooked the "delimiter" Tunable while searching the docs yesterday
> (I'm on US PST).
>=20
> Several servers back, my MTA at the time did use "_" as the default, so
> I'd configured my "delimiter" files that way; but as I said, never
> actually implemented moderation. So the "_" delimiter has been silently
> following my lists through several server migrations.
>=20
> A simple comment in the docs somewhere close to the comments about the
> moderation tunables, reminding the reader "the delimiter tunable must
> match the MTA's current setting or moderation won't work" would perhaps
> be helpful to people trying to use the documentation,

Please make that change in the documentation.
Then sent the new version of the file to the mailinglist AKA upstream.


> and might avoid queries like mine from happening.

Please more respect for yourself.
Making queries is much smarter then keep wandering.


Regards
Geert Stappers
--=20
Silence can be a weapon that is self-inflicting

