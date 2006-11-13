From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Mon, 13 Nov 2006 22:31:50 +0000
Subject: mlmmj-1.2.12 released
Message-Id: <4da75b692623c7712991b5643f389690@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi list,

mlmmj-1.2.12 has been released!


It can be downloaded from:

88e43c13a656c586d1f9149bd35ecce8
http://mlmmj.mmj.dk/files/mlmmj-1.2.12.tar.bz2

1fc93803fb705daa48d3408f50ad8986
http://mlmmj.mmj.dk/files/mlmmj-1.2.12.tar.gz


Two bugs have been fixed since mlmmj-1.2.12-RC4. One of the bugs
involved memory corruption, and could be exploitable in combination
with some malloc implementations. Please upgrade.


This is the complete ChangeLog since mlmmj-1.2.11:

1.2.12
 o Fixed memory corruption in cleanquotedp()
 o Fixed bug in gethdrline() introduced in 1.2.12-RC3
1.2.12-RC4
 o Fixed memory leak in checkwait_smtpreply()
 o Changed mlmmj-process to look at environment variable DEFAULT instead
   of EXT for qmail (Fabio Busatto)
 o Added Frensh listtext unsub-confirm-digest (Christophe Gallienne)
1.2.12-RC3
 o Fixed EOF handling in checkwait_smtpreply()
 o Fixed header unfolding in gethdrline()
1.2.12-RC2
 o Changed German listtexts (Stefan Reinauer, Christian Lackas)
 o Changed English listtexts (Stefan Reinauer)
 o Changed chomp() to also remove CR from CRLF sequences
1.2.12-RC1
 o Update web interface with new tunables
 o Add support for qmail (envelope from address in environment variable)
 o Add digest text part
 o Add subscriber moderation
 o Fix default subject in administrative mails
 o Add French listtexts (Christophe Gallienne)
 o Add search and pagination functionality to the perl-admin web interface
 o Only add To: header when sending out actual list mail
 o Close stdin, stdout and stderr in the child of mlmmj-receive after
   forking. This is neccesary on FreeBSD.
 o No need to check for subscribers in 0-sized files
 o Make sure chomp works with empty strings (Frank Denis)


Enjoy!
 Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

