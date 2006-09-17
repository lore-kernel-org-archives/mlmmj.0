From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sun, 17 Sep 2006 20:08:22 +0000
Subject: Re: [Fwd: Re: Mails in incoming cause of "invalid from"]
Message-Id: <20060917200822.GE20790@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <450B2711.4030008@darkman.de>
In-Reply-To: <450B2711.4030008@darkman.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Sven 'Darkman' Michels <sven@darkman.de> [Sep 17. 2006 20:35]:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Mads Martin Joergensen wrote:
> > Can you try it without this patch?
> 
> doesn't work. It looks like the problem existed before
> because i run 1.2.11 since beginning of the year and
> haven't changed anything. The user with the problem
> did subscribe before moving to mlmmj, so we maybe
> never triggered that one. We played around with it
> now. It looks like the "From: " in the body is the
> normal behavior of outlook when replying to a mail.
> Now we add a "space" in front of the "From:" in the
> body and voila, it worked. So it seems the headerparser
> or whatever is broken. It doesn't stop parsing the
> mailheader after the "^$" line. May this from the new
> email address parsing?

mlmmj should stop parsing headers when two newlines are met like the
spec claims.

That's why when I add a From: on the beginning of a line after a
newline, that From: isn't picked up.

Could you look in a hex editor or such, to see if there's something
making mlmmj believe there's more headers? Space or tab is enough to
make it continue.

> I also tested this with thunderbird: when i add some
> "fake headers", it works with the following "code":
>   bla fasel

Well, can you trigger it with Thunderbird, by writing From: somewhere
after a newline?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
