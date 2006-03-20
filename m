From: "Andreas V. Meier" <andreas@anvame.net>
Date: Mon, 20 Mar 2006 00:14:42 +0000
Subject: Re: testing mlmmj
Message-Id: <20060320001442.GE31545@waterworld.anvame.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="B0ZU/rjo5v6h4DpE"
List-Id: <mlmmj.mlmmj.org>
References: <20060319162716.GU31545@waterworld.anvame.net>
In-Reply-To: <20060319162716.GU31545@waterworld.anvame.net>
To: mlmmj@mlmmj.org


--B0ZU/rjo5v6h4DpE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 20, 2006 at 12:31:36AM +0100, Jakob Hirsch wrote:
> Andreas V. Meier wrote:
> > Second is by using router and transport for mlmmj_domains.
> > The later only makes sense when using a dedicated domain for mlmmj as
> > far as I can see. At least the difference is not clear and there is no
> > distinction made in the README's.
> Not necessarily. You'll not need a separate domainlist if you use
> local_domains.
Yes, I missed the require_file part.

> > Mar 19 01:32:41 waterworld /usr/bin/mlmmj-process[23489]:
> > mlmmj-process.c:612: Discarding
> > /raid/var/spool/mlmmj/mlmmj-test//incoming/ca5b636770aae27 due to
> > invalid envelope from email count (was 0, must be 1): No such file or
> > directory
>   headers_remove = Delivered-To
>   headers_add = Delivered-To: $local_part$local_part_suffix@$domain
> in the router or transport.

This did not help, I tried to add the two lines to the system_aliases
router and to the pipe transport, without effect related to my
problem.

But I felt encouraged and tried the other way using dedicated router
and transport for mlmmj again. I found out that there is an error in
the README.exim4. After fixing it works now :)

The README.exim4 uses ${lc::$local_part} in the mlmmj_transport. At
this point it seems not to be a list any more (it always got expanded
to the lower case local_part with a preceeding colon).
So it should correctly read ${lc:$local_part}.

Ciao

Andreas

--B0ZU/rjo5v6h4DpE
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFEHfPy2A9/vRi9PS4RAny/AJ9S2PC8/s3rmOilH/KKpoX/VXfpqgCgie5A
Mv9P4EWWPDrUf2I3OYpoBZ4=
=eNIm
-----END PGP SIGNATURE-----

--B0ZU/rjo5v6h4DpE--
