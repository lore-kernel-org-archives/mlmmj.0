From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sun, 06 Aug 2006 07:44:55 +0000
Subject: Re: closedlistsub not working
Message-Id: <20060806074455.GS34255@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <44D546D2.3060702@kite.se>
In-Reply-To: <44D546D2.3060702@kite.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Magnus Naeslund(k) <mag@kite.se> [Aug 06. 2006 03:39]:
> Magnus Naeslund wrote:
> > Hello,
> 
> Oh, I forgot to mention the mlmmj version used, it's a ubuntu (hence
> debian) package, version 1.2.9-1.

That explains it :)

Look at ChangeLog:

1.2.10
 o Fix nasty bug in the new 1.2.9 find_email_adr() making comma in
   quoted text in From: being discarded as invalid
 o Simply make all addresses lowercase before doing anything else
   wrt. sub/unsub and bounce
 o Add czech listtexts (Lukas Hluze)
 o Make non list emails (subconf, moderation etc.) also honor relayhost
   and smtpport
 o Add tunable to be able to close for subscription only (closedlistsub)

'closedlistsub' was added in 1.2.10.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
