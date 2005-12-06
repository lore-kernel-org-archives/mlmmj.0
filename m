From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 06 Dec 2005 14:03:11 +0000
Subject: Re: mlmmj-1.2.9-RC2 and scooping up patches
Message-Id: <20051206140311.GC92814@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20051206135000.GA92814@mmj.dk>
In-Reply-To: <20051206135000.GA92814@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

* Mads Martin Joergensen <mmj@mmj.dk> [Dec 06. 2005 14:50]:
> Hey guys,
>=20
> Due to me being busy both in private and work, I've been neglecting this
> for too long.
>=20
> I've just created 1.2.9-RC2, with the new find_email_adr() from Neale
> and BSD. There's also a couple of other small bugfixes, but I might have
> missed something.
>=20
> So if people would give
>=20
>   http://mlmmj.mmj.dk/files/mlmmj-1.2.9-RC2.tar.gz
>   http://mlmmj.mmj.dk/files/mlmmj-1.2.9-RC2.tar.bz2
>=20
> a whirl, it would be most appreciated, so we can get 1.2.9 out the door.
> Too much good stuff lingering in that tree.

Forgot the ChangeLog since 1.2.8:

1.2.9
 o Make find_email_adr() more robust (BSD, Neale Pickett)
 o Make the email address check case-insensitive. (Neale Pickett)
 o Add spanish listtext translations (Enrique Mat=EDas S=E1nchez)
 o Make recipient delimiter configurable per list. SIC! (Joel Aelwyn)
 o Added italian list texts translation. A thanks to Andrea Barisani, he has
   checked italian texts. (Filippo F. Fadda)
 o Use is_subbed_in instead of find_subscriber when subscribing people
   (Christian Laursen)
 o Make it possible to confirm subscription even though it's a closedlist.
   It makes sense to be able to confirm a request submitted by the sysadmin
   on the commandline
 o Add 'subonlyget' tunable which makes +get-N only work for subscribers

--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
