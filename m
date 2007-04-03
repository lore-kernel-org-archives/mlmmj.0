From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Tue, 03 Apr 2007 11:24:02 +0000
Subject: mlmmj-1.2.14 released
Message-Id: <d25849f3d489418b5c702854f637d518@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi list!


mlmmj-1.2.14 is available for download at:

dfa478667a1fbce7af7835d885f76150
http://mlmmj.mmj.dk/files/mlmmj-1.2.14.tar.bz2

e61c09b54020fbcf38e54b21dc6d7ad7
http://mlmmj.mmj.dk/files/mlmmj-1.2.14.tar.gz


The only thing changed since RC1 is the Danish listtexts.

This release contains a few bug fixes, a major clean up of
access rule handling and some new features: mail size limit
and a MIME processor.


Changes since mlmmj-1.2.13:

1.2.14
 o Updated Danish listtexts (Jesper Lund)
1.2.14-RC1
 o Fixed a small memory leak in log_oper() log rotation
 o Fixed address parsing for cases with quotes and multiple addresses
 o Added contrib/recievestrip/ MIME processor (Sascha Sommer)
 o Fixed digest multipart boundary (Thanks to Ulrich Mueller)
 o Added support for mail size limit (Christoph Wilke)
 o Log the result of access rules in the operation log (Henne Vogelsang)
 o Ignore empty lines in control files


Have fun!
 Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

