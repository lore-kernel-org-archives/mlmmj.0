From: Christoph Thiel <ct@kki.org>
Date: Thu, 04 Nov 2004 17:21:15 +0000
Subject: Re: feature request: /etc/skel functionality
Message-Id: <Pine.LNX.4.61.0411041817170.8979@t41p.thiel.lan>
List-Id: <mlmmj.mlmmj.org>
References: <20041104171245.GL10927@mail.lieber.org>
In-Reply-To: <20041104171245.GL10927@mail.lieber.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi there,

On Thu, 4 Nov 2004, Kurt Lieber wrote:

> Since I don't think either ezmlm or mlmmj have a notion of "global"
> configuration settings, it would be nice to at least have /etc/skel-type
> functionality.[1]  That is to say, let me set up a default list directory
> (/etc/mlmmj-skel?) exactly the way I want it.  Then, when I create a new
> list, it will make a copy of that directory and modify it based on the new
> list name, plus additional parameters I provide.

Sounds like that could be done by enhancing mlmmj-make-ml.sh... It already 
creates the basic dirs and it shouldn't be to difficult to copy some files 
from $mlmmj_skel ;)


Regards
	Christoph
- --
Christoph Thiel <ct@kki.org>, http://ct.kki.org/
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBimUOSQ2wS9JeDp0RAvRXAJ9+Ucmv3N7Cogm98E5Rmzuxq4jUJACfQq0F
kpsaf97m0lsXPhcFJNbi6yE=llgK
-----END PGP SIGNATURE-----

