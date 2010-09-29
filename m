From: Christian Gleerup <christian.gleerup@swn.nu>
Date: Wed, 29 Sep 2010 18:04:52 +0000
Subject: Re: [SPAM Re: [mlmmj] Cannot remove mail adress
Message-Id: <4CA37FC4.1030500@swn.nu>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

  Ok, I see them now, but.

the concerned email adress i can't delete, lives in

/var/spool/mlmmj/nyhedsbrev/subscribers.d/c

See the following:
/$ sudo cat /var/spool/mlmmj/nyhedsbrev/subscribers.d/c | grep cromozon
cromozon@swn.nu
cromozon@sawsaw.redirectme.net

/$ sudo /usr/bin/mlmmj-unsub -L /var/spool/mlmmj/nyhedsbrev/ -a cromozon@sa=
wsaw.redirectme.net -s
Changing to uid 65534, owner of /var/spool/mlmmj/nyhedsbrev/.
/$ sudo /usr/bin/mlmmj-unsub -L /var/spool/mlmmj/nyhedsbrev/ -a cromozon@sw=
n.nu -s
Changing to uid 65534, owner of /var/spool/mlmmj/nyhedsbrev/.

/$ sudo cat /var/spool/mlmmj/nyhedsbrev/subscribers.d/c | grep cromozon
cromozon@swn.nu

Note, If I ommit the -s when i unsubscribe, I get an email with the text fr=
om unsub-notsubscribed



Den 9/29/2010 8:20 AM, Mads Martin J=F8rgensen skrev:
> Look in:
>
> /var/spool/mlmmj/nyhedsbrev/subscribers.d/
>
> where all files containing emailadresses are subscribers.
>


