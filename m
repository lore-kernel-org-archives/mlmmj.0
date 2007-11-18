From: "mattias" <mj@mattiasweb.net>
Date: Sun, 18 Nov 2007 19:48:59 +0000
Subject: SV: help
Message-Id: <000001c82a1c$0fdc0ef0$0500a8c0@liomk23cfxd68z>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

I use apt-get to install
I use debian

-----Ursprungligt meddelande-----
Fr=E5n: Morten K. Poulsen [mailto:morten@afdelingp.dk]=20
Skickat: den 18 november 2007 20:06
Till: mlmmj@mmj.dk
=C4mne: Re: help


mattias wrote:
> I try to use mlmmj-php-web-admin
[...]
> Warning: fopen(../conf/tunables.pl) [
> function.fopen]:
> failed to open stream: No such file or directory in=20
> /var/www/mlmmj-php-web-admin/edit.php on line 117
[...]
> What are wrong?

Obviously the file tunables.pl is missing. You only copied the htdocs=20
directory into your webroot, and left out (at least) the conf directory.

Please read the README for the web interface. It explains the=20
installation procedure.

Morten

--=20
Morten K. Poulsen <morten@afdelingp.dk> http://www.afdelingp.dk/




