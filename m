From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Tue, 19 Sep 2006 15:48:09 +0000
Subject: Re: mlmmj-send processes eating cpu
Message-Id: <084983735571598f7c2c0cb5a494688a@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4BFA0DC3-3060-4B2B-8FBE-E5F8DD32E84E@gmail.com>
In-Reply-To: <4BFA0DC3-3060-4B2B-8FBE-E5F8DD32E84E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Nate,

On Mon, 18 Sep 2006 23:58:23 -0700, Nate Beaty <natebeaty@gmail.com> wrote:
>> he function that checks SMTP replies was not doing proper EOF
>> checking, so it would enter an infinite loop if the SMTP server
>> closed the connection while mlmmj was waiting for the reply.
>>
>> I have fixed the issue. Please try the following patch:
> 
> This seems to have worked. I haven't seen any rampant mlmmj-send
> processes since upgrading to 1.2.12.

Ok, good.

> Could this by any chance be related to one of the users getting 30+
> copies of the bounce message to an address that he had deactivated
> (I'm not sure what he means by that, but the fact that he's gotten so
> many of these is odd)?

I don't know. It could be. Perhaps the mail server disconnected after accepting the mail, but mlmmj never got that OK, and therefore re-sent the mail.

Do you have the maillog from the relay host? If you do, could you check whether the mail was sent multiple times from mlmmj to the relay host, or only from the relay host to the end user?

>>  Sent: 18 Sep '06 08:00
[snip]
> His email was still in bounce/
[snip]
> 2:1158350823 # Fri Sep 15 13:07:03 2006
> 
> I don't understand how it lists the 15th as the last message date,
> when clearly his message above says it was sent on the 18th.. ?

Yes, a mail (id and timestamp) is kept in the bounce file for "control/bouncelife" seconds (default is 432000 = 5 days). If the bounce probe ("Messages from $listaddr$ to you have been bouncing") itself does not bounce within this time, the bounce file is removed. Otherwise the user is unsubscribed.

> Any ideas?

If the user still gets multiple copies, please send me a tarball of /var/spool/mlmmj and your maillog.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

