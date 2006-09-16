From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sat, 16 Sep 2006 19:11:07 +0000
Subject: Re: [Fwd: Re: Mails in incoming cause of "invalid from"]
Message-Id: <20060916191106.GG14637@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <450B2711.4030008@darkman.de>
In-Reply-To: <450B2711.4030008@darkman.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Sven 'Darkman' Michels <sven@darkman.de> [Sep 16. 2006 19:58]:
> Mads Martin Joergensen wrote:
> > Just tried to reproduce, and cannot. Can you reproduce with 1.2.12-RC2?
> 
> Yep. I updated to rc2 and did:
> cat incoming/5dc2658876e70a91 | /usr/bin/mlmmj-recieve -L
> /var/spool/mlmmj/test/
> 
> With 1.2.11 i saw output on the shell, now i don't. But: i see
> logs from mlmmj-process.c which told me that the mail was
> discarded, and with RC2 the mail now is put into the discard
> dir, not left in incoming anymore.
> Log:
> Sep 16 19:55:58 pamphlet /usr/bin/mlmmj-process[7818]:
> mlmmj-process.c:641: Discarding
> /var/spool/mlmmj/test//incoming/2d1420e3163f055e due to invalid From::
> Bad file descriptor
> Sep 16 19:55:58 pamphlet /usr/bin/mlmmj-process[7818]:
> mlmmj-process.c:644: fromemails.emaillist[0] = my@benjamin-oette.de :
> Bad file descriptor
> Sep 16 19:55:58 pamphlet /usr/bin/mlmmj-process[7818]:
> mlmmj-process.c:644: fromemails.emaillist[1] = Adnan Vatandas
> [mailto:vatandas@rz.uni-frankfurt.de]  : Bad file descriptor

What I meant by reproducing is creating a mail in an editor doing this?
I cannot do that. So there must be something seriously fishy with this
one. Haven't had a chance to examine it yet.

And please keep the list involved, since I'm no longer maintainer of
mlmmj :-)

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
