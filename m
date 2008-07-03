From: Christian Laursen <xi@borderworlds.dk>
Date: Thu, 03 Jul 2008 11:29:37 +0000
Subject: Re: bounce-probe text being sent to non-owners
Message-Id: <ygfy74jxl26.fsf@dominion.borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
References: <486CB110.9080206@monsternett.no>
In-Reply-To: <486CB110.9080206@monsternett.no>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Helge Milde <helge@monsternett.no> writes:

> I'm using mlmmj to run a newsletter to 500ish destinations, and
> everything has been working great so far, except one odd problem; the
> message contained in text/bounce-probe is sometimes (well.. once) sent
> to arbitrary subscribers (non-owners).

That is expected behaviour. It happens when mail to the subscriber
bounces back and mlmmj needs to determine if it is a permanent problem
or just temporary.

If the bounce probe mail doesn't bounce, the subscriber will keep
being subscribed. Otherwise bounce probes will be sent until no nounce
is received back or the time spcified by the "bouncelife" tunable has
elapsed. In the latter case the address in question will be
unsubscribed from the list.

Proper bounce handling is an essential part of any modern mailing list
manager. :)

-- 
Christian Laursen
