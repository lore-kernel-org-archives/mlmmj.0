From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Sun, 03 Oct 2010 21:37:58 +0000
Subject: Re: [mlmmj] List archive howto?
Message-Id: <robbat2-20101003T213549-615784985Z@orbis-terrarum.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="J4XPiPrVK1ev6Sgr"
List-Id: <mlmmj.mlmmj.org>
References: <4C6B3882.6070904@gmail.com>
In-Reply-To: <4C6B3882.6070904@gmail.com>
To: mlmmj@mlmmj.org


--J4XPiPrVK1ev6Sgr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2010 at 07:33:54PM -0600, Morgan Gangwere wrote:
> Howdy y'all
>=20
> I'm kinda curious as to what is used for the archiving of the mailing lis=
t?
>=20
> I've got my own list set up and I'm pouring through the documentation
> looking for what actually generates the html. Any help?
For Gentoo, we use mhonarc, with some minor modifications.

One of the key modifications was ultimately caused by the message
numbering issue in threads.

Specifically, what URL should exist if a message arrives out of sequence
due to a delay. Some archive tools renumber the urls, others keep an
index based on some part of the mail. Both of these caused some degree
of problems for us, and we had to come up with an alternative.

Specifically, when the message is being received, we add two headers:
X-Archives-Salt: ${UUID}
then we hash the entire message file, including the new header, and
generate:
X-Archives-Hash: ${SHA1}

This gets used in the filename for the individual message files we
write to disk:
http://archives.gentoo.org/gentoo-scm/msg_c0f2f8f123f85bb8b664827b4a1dcb09.=
xml
It's consistent regardless of how many times we have to rebuild a
message archive.

We've got nearly 588k messages in the archive, and now the next problem
is starting to be the storage/access scalability of some of the larger
lists. Also need to work on better parallelization for building archives
for each list.

Largest lists, by mails:
72808 gentoo-dev
97619 gentoo-user
283036 gentoo-commits

Footnote:
Yes, we generate XML, that's to integrate with our templating, but you
could generate HTML even more easily.

--=20
Robin Hugh Johnson
Gentoo Linux: Developer, Trustee & Infrastructure Lead
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--J4XPiPrVK1ev6Sgr
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks - The text below is a digital signature. If it doesn't make any sense to you, ignore it.

iEYEARECAAYFAkyo97YACgkQPpIsIjIzwizAmACgqVDuvtbR9jZHcpavGzQ4TKhT
pH8AoI0l6AQijqUYzaxrqNEnQQuGWW+c
=REu2
-----END PGP SIGNATURE-----

--J4XPiPrVK1ev6Sgr--

