From: Christian Laursen <xi@borderworlds.dk>
Date: Fri, 20 Aug 2004 10:06:21 +0000
Subject: New version of the perl-admin webinterface
Message-Id: <861xi2uns2.fsf@borg.borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I started out to just add the new tunables for 0.8.3 to the perl-admin
webinterface and ended up mostly rewriting it too.

It now uses CGI::FastTemplate to construct the HTML pages in order to
make it possible to customize the pages.

Furthermore it is possible to configure alternative topdirs and change
the text for the existing tunables.

The code is here:
http://hoegaarden.pil.dk/~cfsl/perl-admin.tar.bz2

Comments, questions and suggestions are of course welcome.

-- 
Christian Laursen
