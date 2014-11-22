From: Joe Eaves <joe@right2.org>
Date: Sat, 22 Nov 2014 16:41:11 +0000
Subject: Re: [mlmmj] Help setting up my first mailing list
Message-Id: <2C648E6D-DE49-4BB9-B062-F2C4878B31C6@right2.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail=_DAB85B00-2F14-4441-BD40-1658544A36E5"
List-Id: <mlmmj.mlmmj.org>
References: <9EC4CE90-6B36-4C12-B02D-1E9328EBBD77@right2.org>
In-Reply-To: <9EC4CE90-6B36-4C12-B02D-1E9328EBBD77@right2.org>
To: mlmmj@mlmmj.org


--Apple-Mail=_DAB85B00-2F14-4441-BD40-1658544A36E5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252

On 21 Nov 2014, at 21:26, Ben Schmidt <mail_ben_schmidt@yahoo.com.au> =
wrote:

> I do think it's the ^M.
>=20
> Suspect Haraka doesn't convert the CRLF line endings in SMTP to unix =
LF-only line endings before piping to external programs as other MTAs =
do. Looks like some parts of Mlmmj cope with this and other parts don't.

Thanks for the swift reply Ben, you were right about the line endings I =
now having a working mailing list!

> Try piping the mail through tr(1) to filter out the CRs and see if it =
works:
>=20
> |tr -d '\r' | /bin/mlmmj-receive -L /opt/mlmmj/mylist/
>=20
> If it doesn't like the pipe in aliases, try making a script that does =
the piping and referring to that in aliases rather than mlmmj-receive =
directly.

Great suggestions, but Haraka had it all in hand.

The code that does the pipe to external commands is a plugin for Haraka =
that I wrote myself[1]. The interface for using the content of an email =
in Haraka is a stream and it takes the following option:

* line_endings (default: "\r\n")

All I had to do was pass "\n" as the value for that option and all was =
solved :)

Thanks again!

Joe

[1] =
https://github.com/Joeasaurus/nuxMail/blob/master/plugins/jme.queue.pipe_c=
ommand.js

--
:wq!


--Apple-Mail=_DAB85B00-2F14-4441-BD40-1658544A36E5
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJUcLynAAoJEPHx7tTUAhHxp9gQALmWrb7VcBMn5OBZ/MifkS89
HeMrfZR1479T2vOoJUnCS69yiNlNiI9n0rkpgLhduK4ej1lW2rCNGY2M9sMq8DH2
1YFUOvJl9BmP9wo4toA17EbhWqYjHoN/Q02dyRwzsCq1wDEvpUYJLGFHGLYT90ic
ui79GILKpIFoyhz1Y+OxW2XH9qOVv5OxYNKyoCisbklsx+2l2KK17dAG/Dh8T/Z/
Vp1MJStcU0h0s1fkbsIAIpML27H6QdC1nDe/j+5fQrZuV8GWG1teKhwxz0yDao6L
ZF/OlM/dR5+hvg+7fW6kxENkmJsGaSgMuFk4gfdLNwuK/2ODfV141uvZ+P2TvPKK
WgsOYLiDibenxezJ2xBWsJAgYdYv5zo+rRq+mHwBSKe9V1JZjNFTp7YNJljv3arb
Oub3GAZuu7L4PHqQ8eSxEoKvUcTWxN5phfcS9piSXP2UJRExKmvqh57464dRJiPk
WBT+QLsPGbe6K6szKJIv6N+svBcB4ad/dBaaldu3fIFzXEU43YuSjNqj58KG8Zgr
T0SH4Z8mQa5b6RgopMbKVd8oHMP3k7Olb8HF+AbqhJtTOgn12GEDyyFaL+D1o2SC
eYFHjO2KuJK1pQlCrzCoZo7nUhwwsvqIWH8htdsCrKrWLJwUblhXR/NKn7yYz6IH
EDJcHo6iWh5jdmfmLn8M
=6oLn
-----END PGP SIGNATURE-----

--Apple-Mail=_DAB85B00-2F14-4441-BD40-1658544A36E5--

