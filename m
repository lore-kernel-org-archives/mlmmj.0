From: Kurt Lieber <klieber@gentoo.org>
Date: Fri, 05 Nov 2004 11:35:49 +0000
Subject: Re: feature request: DIR/mimereject
Message-Id: <20041105113549.GR10927@mail.lieber.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="9TwJQ2hupUiGMOvM"
List-Id: <mlmmj.mlmmj.org>
References: <20041104170533.GK10927@mail.lieber.org>
In-Reply-To: <20041104170533.GK10927@mail.lieber.org>
To: mlmmj@mlmmj.org


--9TwJQ2hupUiGMOvM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 05, 2004 at 10:17:04AM +0100 or thereabouts, Morten K. Poulsen =
wrote:
> I don't think that's what Kurt want. Our access check only checks the mai=
l's
> headers. He probably wants to check the headers of each MIME part in the =
mail
> body. That would require parsing the body, and checking the headers of ea=
ch
> part - not an easy task. And definitely not an easy thing to do correctly.

Correct.  This request comes from the all the worms that exist out there
which spoof both the From: and the To: address.  We've had a number of
occasions where a virus got through to the list because it appeared to come
=66rom a valid subscriber.

An argument can certainly be made that the MTA should handle this instead
of the ML manager and, if you make that argument, I'll accept it. :)
However, it is a feature of ezmlm(-idx) so I figured I'd at least ask for
it.

--kurt

--9TwJQ2hupUiGMOvM
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFBi2WVJPpRNiftIEYRAi4QAJ0cGwuASLT8oYdqxKBKw/Fo/63OfwCdGgE1
RZBfhFAUKATYdg+Pi4IDpU0=
=jpnV
-----END PGP SIGNATURE-----

--9TwJQ2hupUiGMOvM--
