From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Mon, 25 Dec 2006 11:36:43 +0000
Subject: mlmmj-1.2.13 released
Message-Id: <7fe9b8839b62315f567695328bad0fe9@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi list!


mlmmj-1.2.13 is available for download at:

ee45d77fffb02d7f6c9a1fe52b55f7ed
http://mlmmj.mmj.dk/files/mlmmj-1.2.13.tar.bz2

e19daf3c45d68cf8dda861feaa98a38f
http://mlmmj.mmj.dk/files/mlmmj-1.2.13.tar.gz


Changes since mlmmj-1.2.12:

1.2.13
 o Added Dutch listtexts (Raymond den Ouden)
1.2.13-RC1
 o Added 'nonomailsub' tunable which will disable nomail subscriptions
   to a list (Henne Vogelsang)
 o Added 'nodigestsub' tunable which will disable subscription to the
   digest version of a list (Henne Vogelsang)
 o Added list FAQ feature (Henne Vogelsang)
 o Added support for default list text directory (Henne Vogelsang)
 o Fixed a Bourne Shell issue in mlmmj-make-ml.sh (Magnus Naeslund)
 o Fixed hostnamestr() for hosts that can't find themselves using
   gethostbyname() (Benoit Dolez)
 o Add 'modnonsubposts' tunable that when set will moderate all posts
   from non subscribers
 o Fixed requeue for lists with noarchive enabled


Have fun,
 Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

