From: Christoph Thiel <ct@kki.org>
Date: Sat, 05 Jun 2004 08:19:33 +0000
Subject: Re: mlmmj-0.5.2
Message-Id: <Pine.LNX.4.58.0406051017570.4379@hermes.cthiel.de>
List-Id: <mlmmj.mlmmj.org>
References: <20040529154106.GB36109@panther.mmj.dk>
In-Reply-To: <20040529154106.GB36109@panther.mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi there,

On Sat, 5 Jun 2004, Mads Martin Joergensen wrote:

> > Btw: Wouldn't it be consequently to move listdir/moderators to
> > listdir/control/moderators?
> > 
> > - --- mlmmj-process.c~    2004-06-04 22:29:09.000000000 +0200
> > +++ mlmmj-process.c     2004-06-04 22:29:09.000000000 +0200
> > @@ -61,7 +61,7 @@
> >         }
> >         free(randomstr);
> >  
> > - -       moderatorsfilename = concatstr(2, listdir, "/moderators");
> > +       moderatorsfilename = concatstr(2, listdir, "/control/moderators");
> >         if((moderatorsfile = fopen(moderatorsfilename, "r")) = NULL) {
> >                 log_error(LOG_ARGS, "Could not open '%s'", moderatorsfilename);
> >                 free(queuefilename);
> 
> Indeed it would. Thanks.

Actually the same goes for listdir/listaddress. I'm not sure if
listdir/index matches, too?


Regards,
	Christoph
- --
Christoph Thiel <ct@kki.org>, http://ct.kki.org/
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAwYIYSQ2wS9JeDp0RAkqZAJ4g/rgshxDrwaCmjdKQA1KhnqI9rgCfc4bu
Y04ASEfYKaKbt7eCPsf5ch8=HG1d
-----END PGP SIGNATURE-----

