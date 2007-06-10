From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Sun, 10 Jun 2007 21:59:30 +0000
Subject: mlmmj-1.2.14-cvs20070610
Message-Id: <7f91e82268803dab7b16033f919a959c@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi list,

I have committed some patches from Sascha Sommer and Ansgar Burchardt:

 o Moved English listtexts and install all languages (Ansgar Burchardt)
 o Added encoding headers for German listtexts (Ansgar Burchardt)
 o Fixed missing exit()s in case of failed execl() calls (Ansgar Burchardt)
 o Changed Message-ID headers to include FQDN (Ansgar Burchardt)
 o Added support for 'discard' keyword in access rules (Sascha Sommer)

59667a5e8c1b1826555d0b620c46a7ed
http://mlmmj.mmj.dk/~mortenp/mlmmj-1.2.14-cvs20070610.tar.bz2

ed07b66d3741a2d339401405b2a79e96
http://mlmmj.mmj.dk/~mortenp/mlmmj-1.2.14-cvs20070610.tar.gz

Does anybody have anything else, before I roll 1.2.15-RC1 ?

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

