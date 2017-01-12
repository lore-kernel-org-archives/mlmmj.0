From: Christoph Ehnes <chris@filmkreis.tu-darmstadt.de>
Date: Thu, 12 Jan 2017 18:03:27 +0000
Subject: Re: [mlmmj] Allowing specific addresses with subonlypost
Message-Id: <20170112190327.5f0c7b29@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Sig_/ImnO1K1KHLUEkfvDN_8i37."
List-Id: <mlmmj.mlmmj.org>
References: <13b7eecf-62da-b77b-4685-ddae6cc0ee39@gmail.com>
In-Reply-To: <13b7eecf-62da-b77b-4685-ddae6cc0ee39@gmail.com>
To: mlmmj@mlmmj.org


--Sig_/ImnO1K1KHLUEkfvDN_8i37.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

yep, this thread is quite old, but in case someone needs this later
on...

On Fri, 23 Dec 2016 08:05:46 +1100
Ben Schmidt <mail_ben_schmidt@yahoo.com.au> wrote:

>=20
> On 22/12/2016 11:51 pm, Morten Shearman Kirkegaard wrote:
> > On 2016-12-22, at 13:24:10 +0100, David Demelier wrote:
> >> However to stop spam I've enabled the subonlypost option to only
> >> allow subscribers to post mails. The problem is that I also would
> >> like to add specific addresses so my own mail server can also send
> >> mails to people subscribed.
> >
> > The easiest way of allowing that, is adding them in nomailsubs.d/.
>=20
> This is absolutely right. But using 'send' in an access file should
> have worked, too. I might have to look into that.

It works, but only if the send statement is followed by an allow. For
me it looks therefore like this:

send ^Return-Path:.*@domain.tld
allow


Regards
Chris

--Sig_/ImnO1K1KHLUEkfvDN_8i37.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREKAAYFAlh3xPQACgkQt21yk8wKTAroRAEAqNWxOhWFbH1haOezvCKnYHud
Jdm122yHLAA0W/mNK70BAM2QMWxO9/E7E3CKO/jJWLgDHpTAN2lbE68rBGsThGZw
=S71R
-----END PGP SIGNATURE-----

--Sig_/ImnO1K1KHLUEkfvDN_8i37.--

