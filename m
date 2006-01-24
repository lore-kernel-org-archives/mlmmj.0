From: Sven 'Darkman' Michels <sven@darkman.de>
Date: Tue, 24 Jan 2006 04:08:12 +0000
Subject: Re: 1.2.11 is out
Message-Id: <43D5A82C.3020802@darkman.de>
List-Id: <mlmmj.mlmmj.org>
References: <20060123180701.GJ33296@mmj.dk>
In-Reply-To: <20060123180701.GJ33296@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thomas Goirand wrote:
> I think it's a shame that the original debian folder used to build that
> binary package is not in the original tar.gz. Would it be possible to
> include it in the next release?

Well, actually we use these builds for our listservers, so they're
normally not for the public ;) The build process is quick'n dirty,
so i didn't release anything else than that yet. I'll try to make
a clean package in the next days to make you all more happy.
At the moment the deb is nothing special, its based on the 1.2.8-7
debian package with a few changes: removed the call_to_free patch
since its already fixed in mlmmj, changed the fullpath patch (typo
removed). Thats it. No voodoo, no backdors..

Regards,
Sven
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFD1agsQoCguWUBzBwRApgmAJ0V7/KCaLdmEnIq5F3Y/UQROShXTACfQ5ii
qzRBEFDG1UM68ODe9c2sHxI=zPPE
-----END PGP SIGNATURE-----
