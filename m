From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 20 Sep 2004 06:11:11 +0000
Subject: Re: mlmmj doesn't send mails to the list
Message-Id: <20040920061111.GB76919@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0409200903170.19142@watson.hemma.bergenheim.net>
In-Reply-To: <Pine.LNX.4.61.0409200903170.19142@watson.hemma.bergenheim.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Wolf Bergenheim <wolf+mlmmj@bergenheim.net> [Sep 20. 2004 08:07]:
> Hi!
> 
> I just installed the debian package for mlmmj (version 1.0.0-RELEASE-1) 
> The mailinglist commands seem to work fine, that is sending to 
> mlmmjtest+subscribe@bergenheim.net, etc work just fine, but sending mail 
> to the list results in the mail beeing dropped in queue/discarded.
> What could be wrong?

Are you using exim? If yes, you should make sure that exim adds
the Return-Path: header as required by the standards.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
