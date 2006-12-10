From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Sun, 10 Dec 2006 16:18:38 +0000
Subject: mlmmj-1.2.13-RC1 released
Message-Id: <XFMail.20061210171838.morten@afdelingp.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi list!


mlmmj-1.2.13-RC1 is available for download at:

f7e001fbaf9e00e533fe38b41b90e5a3
http://mlmmj.mmj.dk/files/mlmmj-1.2.13-RC1.tar.bz2

a714d227dad496d1471161a883a568bb
http://mlmmj.mmj.dk/files/mlmmj-1.2.13-RC1.tar.gz


The release contains a few bug fixes and some new features:

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


Please test it!


Have fun,
 Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
