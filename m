From: Joel Aelwyn <joel@lightbearer.com>
Date: Mon, 11 Sep 2006 13:25:11 +0000
Subject: Re: [PATCH] chomp to remove '\r' as well
Message-Id: <200609110725.12703.joel@lightbearer.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nextPart2389543.Ol28zLYak5"
List-Id: <mlmmj.mlmmj.org>
References: <20060911123559.GK1815@mmj.dk>
In-Reply-To: <20060911123559.GK1815@mmj.dk>
To: mlmmj@mlmmj.org

--nextPart2389543.Ol28zLYak5
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon September 11 2006 07:18, Mads Martin Joergensen Mads Martin=20
Joergensen <mmj@mmj.dk> wrote:
> * Joel Aelwyn <joel@lightbearer.com> [Sep 11. 2006 15:12]:
> > > Anyone object to this behaviour? Just heard on irc someone got
> > > bitten by this:
> > >
> > > --- chomp.c     20 Feb 2006 05:00:09 -0000      1.4
> > > +++ chomp.c     11 Sep 2006 12:34:28 -0000
> > > @@ -38,7 +38,7 @@
> > >
> > >         i =3D strlen(str) - 1;
> > >
> > > -       while(str[i] =3D=3D '\n') {
> > > +       while(str[i] =3D=3D '\n' || str[i] =3D=3D '\r') {
> > >                 str[i] =3D 0;
> > >                 i--;
> > >         }
> >
> > As far as I recall, getting anything with \r\n as an EOL pretty
> > much grossly violates the SMTP RFCs, so I'll make two suggestions
> > about this:
> >
> > 1) Limit it *strictly* to a single \r\n, not any random combination
> > of the two characters. You'll drastically reduce your chances of
> > subtle and nasty misbehaviours being introduced when (not if) some
> > software comes along and relies on things obeying the RFCs.
> >
> > 2) Make it a configurable option. Call it 'broken-CRLF-support' or
> > somesuch, because it most assuredly is.
> >
> > Outlook is one of the primary offenders in this arena, for what
> > it's worth; DJB had -- probably has -- a rant up about it and why
> > qmail does/did not support a similar feature (it's been years since
> > I used qmail, but the combination of the two provided no end of
> > headaches back when I had to deal with them both at my workplace...
> > and, to a one, they were caused by Outlook blatantly violating the
> > protocol specifications.
>
> Ah, this has nothing to do with the smtp layer. SMTP always have to
> have \r\n, and that's handled in send.
>
> Problem is that when I for instance read a subscriber from a
> subscribers file with the old behaviour and match
>
> "mmj@mmj.dk" with "mmj@mmj.dk^M", they're different.
>
> Same thing when reading control files.

Ah, ick. But, in that case, being fancy is probably not warranted...=20
anyone who would get bitten by the broader behaviour is already doing=20
something they need to be smacked for. Comments withdrawn, or at least=20
deferred into the 'nice idea, maybe, but then again maybe not'=20
bucket. :)
=2D-=20
Joel Aelwyn <joel@lightbearer.com>

--nextPart2389543.Ol28zLYak5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBFBWO4lZCPwGNtWe4RArOhAJ9niALZmmN+h0lZXraKEjiNlhXb/ACdG1/1
xr+BkryYVQJ9rMovpf++c34=
=H0aJ
-----END PGP SIGNATURE-----

--nextPart2389543.Ol28zLYak5--
