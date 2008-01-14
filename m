From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Mon, 14 Jan 2008 11:36:58 +0000
Subject: Gentoo lists mailing loss solved, mlmmj bug patched
Message-Id: <20080114113658.GF5504@curie-int.orbis-terrarum.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="rz+pwK2yUstbofK6"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--rz+pwK2yUstbofK6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

So I see this was mentioned once before on the lists, but was dismissed
as an issue at the time. Back in April I suspected an mlmmj bug, and was
told to get off sendmail, but after all this time, I finally had time
and managed to trace the issue.

If you run into this error:
/usr/bin/mlmmj-send[9353]: getaddrsfromfd.c:27: Could not mmap fd: Invalid =
argument
and you seem to be losing mail, you should apply this patch:
http://sources.gentoo.org/viewcvs.py/gentoo-x86/net-mail/mlmmj/files/mlmmj-=
1.2.15_mmap_zero_byte.patch?rev=3D1.1

The linux manpage for mmap notes that since 2.6.12, mmap of a zero-byte
file will fail. For mlmmj, this means that getaddrsfromfd returned -1,
which triggered the termination condition in send_mail_many_fd.

The 0-byte files must have arisen from earlier earlier versions of
mlmmj, or somebody before me mucking with the subscriber files directly,
as the present version does remove empty files.

I didn't do a complete audit of the rest of mlmmj, but I suspect the
same bug may exist in other places.

--=20
Robin Hugh Johnson
Gentoo Linux Developer & Infra Guy
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--rz+pwK2yUstbofK6
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.8 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks - The text below is a digital signature. If it doesn't make any sense to you, ignore it.

iEYEARECAAYFAkeLSVoACgkQPpIsIjIzwiwP0gCgxf5CrvW+lr9M536HwEFWiHFh
MEIAn1NVDZn21EsubcxNobVnZ9ZNGQG/
=pbT5
-----END PGP SIGNATURE-----

--rz+pwK2yUstbofK6--
