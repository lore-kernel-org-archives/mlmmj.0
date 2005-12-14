From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 14 Dec 2005 15:15:26 +0000
Subject: mlmmj-1.2.9 released
Message-Id: <20051214151526.GA92814@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Here we go, ChangeLog since 1.2.8:

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

http://mlmmj.mmj.dk/files has it all.

--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
