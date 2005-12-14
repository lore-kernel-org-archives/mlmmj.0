From: Patrick Bennett <patrick@pebcomputing.com>
Date: Wed, 14 Dec 2005 17:35:35 +0000
Subject: Re: mlmmj-1.2.9 released
Message-Id: <43A057E7.4090101@pebcomputing.com>
List-Id: <mlmmj.mlmmj.org>
References: <20051214151526.GA92814@mmj.dk>
In-Reply-To: <20051214151526.GA92814@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Mads Martin Joergensen wrote:

>Here we go, ChangeLog since 1.2.8:
>
>1.2.9
> o Make find_email_adr() more robust (BSD, Neale Pickett)
> o Make the email address check case-insensitive. (Neale Pickett)
> o Add spanish listtext translations (Enrique Mat=EDas S=E1nchez)
> o Make recipient delimiter configurable per list. SIC! (Joel Aelwyn)
> o Added italian list texts translation. A thanks to Andrea Barisani, he h=
as
>   checked italian texts. (Filippo F. Fadda)
> o Use is_subbed_in instead of find_subscriber when subscribing people
>   (Christian Laursen)
> o Make it possible to confirm subscription even though it's a closedlist.
>   It makes sense to be able to confirm a request submitted by the sysadmin
>   on the commandline
> o Add 'subonlyget' tunable which makes +get-N only work for subscribers
>
>http://mlmmj.mmj.dk/files has it all.
>
> =20
>
Excellent!  It sounds like the "find_email_addr()" bit will better=20
handle the "From:" header my user is locked into.  Soren, you offerred=20
to backport 1.2.8 to sarge before, I wonder if 1.2.9 could also be=20
backported?

   -Patrick
