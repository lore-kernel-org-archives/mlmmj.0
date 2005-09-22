From: Joel Aelwyn <joel@lightbearer.com>
Date: Thu, 22 Sep 2005 01:29:55 +0000
Subject: Re: alternate value for RECIPDELIM
Message-Id: <43320913.3060308@lightbearer.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------enig03EFB5710524A43D18C280C6"
List-Id: <mlmmj.mlmmj.org>
References: <43316167.4010700@woozle.org>
In-Reply-To: <43316167.4010700@woozle.org>
To: mlmmj@mlmmj.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig03EFB5710524A43D18C280C6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Neale Pickett wrote:
> I've got a mail server that's been using '-' instead of '+' for a long, 
> long time now, and I can't switch it over to '+' without breaking a 
> billion email addresses.  I patched the source code (patch at bottom) to 
> let me use '+', and let anyone else #define a new RECIPDELIM (and have 
> it work), but I don't like the patch.
> 
> It seems like the *right* thing to do would be to use something like my 
> patch, where people could configure it at compile-time, but to maybe 
> read /etc/mlmmj/recipdelim (if it exists) to get the RECIPDELIM.  This 
> would let me go back to using the debian package with its default '+'.

This looks awfully familiar. I swear I developed mine separately. But it's 
clearly a feature in fairly high demand...

The two differences are that I set it up to read an optional list delimiter on 
a per-list basis, and that my patch supports multi-character delimiters (not 
that this is probably a generally-sane idea to do with most servers, but... 
why make things difficult? It's not really any more effort to support it, or 
any slower in practice).

As soon as I can pare out the last nits, I'll post it (it's getting copies of 
real list emails from my production server right now to excercise it some, and 
there are a couple of things still being odd).
-- 
Joel Aelwyn <joel@lightbearer.com>

--------------enig03EFB5710524A43D18C280C6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (MingW32)

iD8DBQFDMgkTlZCPwGNtWe4RAn0vAJ9vUjEs+0T/HOH/xMw2FHuf02sypQCfai/F
zlThRbeNOFyuk69f8jf61LA=
=6xLA
-----END PGP SIGNATURE-----

--------------enig03EFB5710524A43D18C280C6--
