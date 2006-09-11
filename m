From: Joel Aelwyn <joel@lightbearer.com>
Date: Mon, 11 Sep 2006 13:11:54 +0000
Subject: Re: [PATCH] chomp to remove '\r' as well
Message-Id: <200609110712.02483.joel@lightbearer.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nextPart1311911.odiNXR9dUA"
List-Id: <mlmmj.mlmmj.org>
References: <20060911123559.GK1815@mmj.dk>
In-Reply-To: <20060911123559.GK1815@mmj.dk>
To: mlmmj@mlmmj.org

--nextPart1311911.odiNXR9dUA
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon September 11 2006 06:35, Mads Martin Joergensen Mads Martin=20
Joergensen <mmj@mmj.dk> wrote:
> Hey together,
>
> Anyone object to this behaviour? Just heard on irc someone got bitten
> by this:
>
> --- chomp.c     20 Feb 2006 05:00:09 -0000      1.4
> +++ chomp.c     11 Sep 2006 12:34:28 -0000
> @@ -38,7 +38,7 @@
>
>         i =3D strlen(str) - 1;
>
> -       while(str[i] =3D=3D '\n') {
> +       while(str[i] =3D=3D '\n' || str[i] =3D=3D '\r') {
>                 str[i] =3D 0;
>                 i--;
>         }

As far as I recall, getting anything with \r\n as an EOL pretty much=20
grossly violates the SMTP RFCs, so I'll make two suggestions about=20
this:

1) Limit it *strictly* to a single \r\n, not any random combination of=20
the two characters. You'll drastically reduce your chances of subtle=20
and nasty misbehaviours being introduced when (not if) some software=20
comes along and relies on things obeying the RFCs.

2) Make it a configurable option. Call it 'broken-CRLF-support' or=20
somesuch, because it most assuredly is.

Outlook is one of the primary offenders in this arena, for what it's=20
worth; DJB had -- probably has -- a rant up about it and why qmail=20
does/did not support a similar feature (it's been years since I used=20
qmail, but the combination of the two provided no end of headaches back=20
when I had to deal with them both at my workplace... and, to a one,=20
they were caused by Outlook blatantly violating the protocol=20
specifications.

=2D-=20
Joel Aelwyn <joel@lightbearer.com>

--nextPart1311911.odiNXR9dUA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBFBWCilZCPwGNtWe4RAganAJ0UawOy0GVOXSVhcqJVigtGEc660wCfcwwt
ZvTpwOMgBlyQPBwjV5m1IcE=
=1lo8
-----END PGP SIGNATURE-----

--nextPart1311911.odiNXR9dUA--
