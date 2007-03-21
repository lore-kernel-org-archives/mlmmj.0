From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Wed, 21 Mar 2007 19:23:04 +0000
Subject: mlmmj-1.2.14-RC1 released
Message-Id: <78d28b92a543192190943f1226818ae3@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi list!


mlmmj-1.2.14-RC1 is available for download at:

dffec73b4f699b632fe20dc3d08eb45e
http://mlmmj.mmj.dk/files/mlmmj-1.2.14-RC1.tar.bz2

0cd898e9a699e122a878ae54ea265669
http://mlmmj.mmj.dk/files/mlmmj-1.2.14-RC1.tar.gz


It contains a few bug fixes, a major clean up of access rule
handling and some new features: mail size limit and a MIME
processor.

The mail size limit feature requires a new listtext file. If
you are maintaining a translation, please translate this file:
http://mlmmj.mmj.dk/~mortenp/maxmailsize


Changes since mlmmj-1.2.13:

1.2.14-RC1
 o Fixed a small memory leak in log_oper() log rotation
 o Fixed address parsing for cases with quotes and multiple addresses
 o Added contrib/recievestrip/ MIME processor (Sascha Sommer)
 o Fixed digest multipart boundary (Thanks to Ulrich Mueller)
 o Added support for mail size limit (Christoph Wilke)
 o Log the result of access rules in the operation log (Henne Vogelsang)
 o Ignore empty lines in control files


I do not expect any problems with this release candidate, but please test
it, so we can get mlmmj-1.2.14 out of the door soon.


Have fun!
 Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

