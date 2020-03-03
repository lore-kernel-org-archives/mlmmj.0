From: Christof Thalhofer <chrisml@deganius.de>
Date: Tue, 03 Mar 2020 09:37:29 +0000
Subject: Re: [mlmmj] DMARC (corrected)
Message-Id: <cc2f775b-0e52-0803-879a-efc4dc6ae1db@deganius.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="XQiliYNQitzLX5ushwfPY678BSqNY0Hvg"
List-Id: <mlmmj.mlmmj.org>
References: <20200303095859.Horde.WCHP_tNDxpm70b-4WXMAcYP@andreasschulze.de>
In-Reply-To: <20200303095859.Horde.WCHP_tNDxpm70b-4WXMAcYP@andreasschulze.de>
To: mlmmj@mlmmj.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XQiliYNQitzLX5ushwfPY678BSqNY0Hvg
Content-Type: multipart/mixed; boundary="A5Zi5CAnSQ6gCsyECJFPQY4nE8vomb2Vv"

--A5Zi5CAnSQ6gCsyECJFPQY4nE8vomb2Vv
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 03.03.20 um 09:58 schrieb A. Schulze:

> I like to correct the wording

Thank you!

> So, as MLM operator you /may/ make your lists "dkim save": strictly =20
> avoid any message modification.
> Then any subscriber could use your MLM even if the subscriber announce =
=20
> dmarc p=3Dreject

Mailman 2 offers these possibilities on "Action to take when anyone
posts to the list from a domain with a DMARC Reject/Quarantine Policy":

"Munge From: This action replaces the poster's address in the From:
header with the list's posting address and adds the poster's address to
the addresses in the original Reply-To: header."

"Wrap Message: Just wrap the message in an outer message with the From:
header containing the list's posting address and with the original From:
address added to the addresses in the original Reply-To: header and with
Content-Type: message/rfc822. This is effectively a one message MIME
format digest."

Is there any similar functionality in mlmmj?

If not:

How can any message modification be avoided  in mlmmj or is this the
default behavior of mlmmj?


Alles Gute

Christof Thalhofer

--=20
Dies ist keine Signatur


--A5Zi5CAnSQ6gCsyECJFPQY4nE8vomb2Vv--

--XQiliYNQitzLX5ushwfPY678BSqNY0Hvg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEp/QSihTiBGN70hb+5r9EJtW1vzUFAl5eJVkACgkQ5r9EJtW1
vzWk7A/8DRIjxw8nTcwO5ParUQ0lDccKNH1OQI8T+oe483Th4zpiAIj+RlC2NvzS
bHRDap4bmwtW9IAqwzfxKYcDJsDB3m4gVcDLnBWKSsvK+IsWW0IRFqrakP9DqWec
2xYnry1EbOaVJBXDAvUsQirvWFS1nQ0/noVO32MjzQXKXOSekqy0Q2XlthE0sV1x
MeZaNTqBeMuNw4rWteM20Sq09Yf9gXhPhDcRuH8nKuEdCB8qqeSPf6NNx1DvNcKQ
D9idjeY33kudvfqlwjwAasa8YKgfvkrTcr/f/Qvnxby5uJgkKtSY/huF0xJJEw93
9EPdr1196GF/xgolErkz1xTIxU+duzdN08RMLLjYKtAvKM1vAEADWlkcFGgVPuD8
ZBmR4bPqDytqlS+W1bULMpggVY4im7IiewULWRnECvL9HbWg58LmCFe/QNSG0zJo
BvvvCXmGUgfaCtuS63cLPq6J3xut/TVfb2IlBDDcljzqUQPAepP+LGWM8Y7GI1HX
H/My77qC7W8BfaMgk/nbCHSbxH0rX27eSndcghkpRlmixzaF41zMpVouaq5vAgGI
u15p65SQXDdXMTzK0W/GOYdlm9lEHn8i/w2DJScuEeIs2qlZHWztyfmaYcaa/L6v
mt/UshhKnVe0QMPDu+GKNbYSobu0bEimkc8E1678yY+5MJQOFhU=
=SUhK
-----END PGP SIGNATURE-----

--XQiliYNQitzLX5ushwfPY678BSqNY0Hvg--

