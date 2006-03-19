From: "Andreas V. Meier" <andreas@anvame.net>
Date: Sun, 19 Mar 2006 16:27:16 +0000
Subject: testing mlmmj
Message-Id: <20060319162716.GU31545@waterworld.anvame.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ipiAXJWFVZGVDOzf"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--ipiAXJWFVZGVDOzf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I just installed and played a bit with mlmmj and my exim.
My first confusion was caused by 2 different ways to use it. One is by
just adding the lists to /etc/aliases as a pipe to the mlmmj-receive.
Second is by using router and transport for mlmmj_domains.
The later only makes sense when using a dedicated domain for mlmmj as
far as I can see. At least the difference is not clear and there is no
distinction made in the README's.

But now to my problem: I created a list mlmmj-test@anvame.net and
successfully subscribed to it. Only when sending a mail to this list I
see the following in syslog and the message gets discarded:
---
Mar 19 01:32:41 waterworld /usr/bin/mlmmj-process[23489]:
mlmmj-process.c:612: Discarding
/raid/var/spool/mlmmj/mlmmj-test//incoming/ca5b636770aae27 due to
invalid envelope from email count (was 0, must be 1): No such file or
directory
---

My exim uses the header_from as envelope_from due to a rewrite rule,
so there should be an envelope from.

Can you suggest a fix for this behaviour?

Thx & Ciao

Andreas

PS: Sorry if this mail appeared twice, I already sent it once but it
    did not appear in the archive.

--ipiAXJWFVZGVDOzf
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFEHYZk2A9/vRi9PS4RAmb/AKCWhwhdEneWVUXE05IdplReLpwlfwCeNMyE
5U9kYuNfWCl2lYdpPvvJDGQ=
=A6hx
-----END PGP SIGNATURE-----

--ipiAXJWFVZGVDOzf--
