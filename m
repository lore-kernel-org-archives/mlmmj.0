From: Kurt Lieber <klieber@gentoo.org>
Date: Thu, 04 Nov 2004 13:25:16 +0000
Subject: feature request: mlmmj-list
Message-Id: <20041104132516.GE10927@mail.lieber.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="AAi0U5uflHqV1n1C"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--AAi0U5uflHqV1n1C
Content-Type: multipart/mixed; boundary="IZB/kjTMIKQcQpQi"
Content-Disposition: inline


--IZB/kjTMIKQcQpQi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

One of the nice utilities in ezmlm is ezmlm-list.  It lists all subscribers
on a particular list and also has an option (-n) to list just a count of
all subscribers.=20

I've attached the man page for reference.  It has a number of other
options, including SQL support, but I'm personally mainly interested in the
-N and -n options. =20

I realize this is something that can be done via a bash script (and that's
what we're going to do for now) but as a longer term "nice to have", it
would be...well...nice to have. :)

--kurt

--IZB/kjTMIKQcQpQi
Content-Type: application/x-troff-man
Content-Disposition: attachment; filename="ezmlm-list.man"
Content-Transfer-Encoding: quoted-printable

ezmlm-list(1)                                                    ezmlm-list=
(1)=0A=0A=0A=0ANAME=0A       ezmlm-list - show the addresses on a mailing l=
ist=0A=0ASYNOPSIS=0A       ezmlm-list [ -n msgnum ] [ -aAmMnNvV ] dir=0A=0A=
DESCRIPTION=0A       ezmlm-list prints the subscriber list for the mailing =
list stored in dir, one address per line.=0A=0A       WARNING:  Unless  you=
 have disabled automatic subscriptions, the addresses in a mailing list are=
 under the control of a possibly mali-=0A       cious remote user.  ezmlm-l=
ist does not strip control characters.=0A=0AGENERAL OPTIONS=0A       -m    =
 (Default.)  Use SQL support if available.=0A=0A       -M     Do not use SQ=
L support even if available.  This option can be used to manipulate a norma=
l local subscriber  database  even  for=0A              lists with SQL supp=
ort.=0A=0A       -n     Print only the number of subscribers.=0A=0A       -=
N     (Default.)  List subscriber addresses, one per line.=0A=0A       -v  =
   Display ezmlm-list(1) version information.=0A=0A       -V     Display ez=
mlm-list(1) version information.=0A=0ASEE ALSO=0A       ezmlm-list(1), ezml=
m-manage(1), ezmlm-make(1), ezmlm-send(1), ezmlm-sub(1), ezmlm(5)=0A=0ASEE =
ALSO=0A       ezmlm-sub(1), ezmlm-unsub(1), ezmlm(5)=0A
--IZB/kjTMIKQcQpQi--

--AAi0U5uflHqV1n1C
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFBii28JPpRNiftIEYRAsDhAJ9Ni++nQ+qIuCP+AEG9kSjLYQqH6QCeO8Rl
uU7CzAl3gK+e0dX4PoXeLTc=
=4wWa
-----END PGP SIGNATURE-----

--AAi0U5uflHqV1n1C--
