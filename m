From: Kurt Lieber <klieber@gentoo.org>
Date: Thu, 04 Nov 2004 17:12:45 +0000
Subject: feature request: /etc/skel functionality
Message-Id: <20041104171245.GL10927@mail.lieber.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="qnnAaaMsXgirVbdt"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--qnnAaaMsXgirVbdt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

When we create a new list, there are certain things that we always want to
have in place.  There's always a certain address subscribed to every list
(for our custom archives), there's also a set of MIME types that we want to
reject, etc.

Since I don't think either ezmlm or mlmmj have a notion of "global"
configuration settings, it would be nice to at least have /etc/skel-type
functionality.[1]  That is to say, let me set up a default list directory
(/etc/mlmmj-skel?) exactly the way I want it.  Then, when I create a new
list, it will make a copy of that directory and modify it based on the new
list name, plus additional parameters I provide.

Hopefully, this makes sense.  If not, let me know and I can try to explain
it differently.  This is a nice-to-have feature, but not something we'd
consider a must-have.

--kurt

[1] In case folks are unfamiliar with /etc/skel, items placed in there are
automatically copied over to a user's home directory when their account is
first created.  This allows a sysadmin to create a default home directory
for all users on that machine.

--qnnAaaMsXgirVbdt
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFBimMNJPpRNiftIEYRAhhAAKCYggpHdL+R9qzVJEBr0x4e6yTXpACfUX5R
cQK+5NmvgjfCDojlg/h2jFk=
=GVQk
-----END PGP SIGNATURE-----

--qnnAaaMsXgirVbdt--
