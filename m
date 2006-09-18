From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Mon, 18 Sep 2006 21:26:36 +0000
Subject: mlmmj-1.2.12-RC3 released
Message-Id: <08d9d1cc41f0727ee27b5e4b0cf219ba@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi list,

The third release candidate for mlmmj-1.2.12 has been released.


It can be downloaded from:

25c6102f2969310e9730ac1bd9468c23
http://mlmmj.mmj.dk/files/mlmmj-1.2.12-RC3.tar.bz2

797b1c78b5ee52c2d0987994b710d244
http://mlmmj.mmj.dk/files/mlmmj-1.2.12-RC3.tar.gz


Two fixes has been applied since mlmmj-1.2.12-RC2. One of the fixes is for unfolding headers - a mail with a white-space as the first character in the body would cause mlmmj to search the mail body for headers. The other fix is for handling an SMTP server which resets the connection while mlmmj is waiting for a reply.

1.2.12-RC3
 o Fixed EOF handling in checkwait_smtpreply()
 o Fixed header unfolding in gethdrline()


Please take it for a spin, and give me a Go/No-Go for release.


Have fun,
 Morten 

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

