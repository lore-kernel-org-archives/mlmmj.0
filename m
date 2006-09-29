From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Fri, 29 Sep 2006 21:12:27 +0000
Subject: mlmmj-1.2.12-RC4 released
Message-Id: <07000545535fd7f3f6fd56f93e19379f@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi list,

The fourth release candidate for mlmmj-1.2.12 has been released.


It can be downloaded from:

1ec92f3752d4ad6874364ba46e456141
http://mlmmj.mmj.dk/files/mlmmj-1.2.12-RC4.tar.bz2

c8d7e6200bf44dd66b0b799e3da76def
http://mlmmj.mmj.dk/files/mlmmj-1.2.12-RC4.tar.gz


A few minor bugs has been fixed, and a single file has been translated:

 o Fixed memory leak in checkwait_smtpreply()
 o Changed mlmmj-process to look at environment variable DEFAULT instead
   of EXT for qmail (Fabio Busatto)
 o Added Frensh listtext unsub-confirm-digest (Christophe Gallienne)


I honestly believe this is ready for release. But please install it at test it anyway.

I have tested with Postfix on FreeBSD. I need a go on:
- sendmail
- exim
- qmail
- Linux

Please, please, pretty please.


Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

