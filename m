From: Kurt Lieber <klieber@gentoo.org>
Date: Thu, 04 Nov 2004 17:05:33 +0000
Subject: feature request: DIR/mimereject
Message-Id: <20041104170533.GK10927@mail.lieber.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="J2dKNoLeXnWu5vox"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--J2dKNoLeXnWu5vox
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

I didn't see this feature listed on the mlmmj page -- apologies if it
already exists.

That said, one thing we *really* need is the DIR/mimereject feature of
ezmlm. (might be an ezmlm-idx specific feature, come to think of it) This
feature scans list messages prior to sending them and rejects messages with
pre-defined attachment types.  "application/octet-stream" is the one we
block on most of our lists as those attachments are generally
worms/viruses.

I'd *like* to have a global option that allowed me to say, "for any/all
lists on this machine, reject messages with the following MIME types".  IF
that's more difficult, then I'm content with at least being able to do it
on a list-by-list basis.  Another option would be some sort of /etc/skel
type functionality, but that's a separate feature request, so I'm going to
send that in a separate email.

--kurt

--J2dKNoLeXnWu5vox
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFBimFdJPpRNiftIEYRAv0oAJ9yYYfMiyLK33yx/NHhT2eLiv7jUACfTP9c
bx48QZVdse/SC27t+pcJCW0=
=4wEA
-----END PGP SIGNATURE-----

--J2dKNoLeXnWu5vox--
