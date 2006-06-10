From: Jakob Hirsch <jh@plonk.de>
Date: Sat, 10 Jun 2006 23:09:46 +0000
Subject: Re: delay in mailing to lists?
Message-Id: <448B513A.1030104@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <5D67D244-B0A5-4E06-BB80-0FC6B5EC1DAC@gmail.com>
In-Reply-To: <5D67D244-B0A5-4E06-BB80-0FC6B5EC1DAC@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Quoting Nate Beaty:

> I've tried all sorts of things, and I assume the problem is simple and
> due to some dumb misconfiguration on my part. Below is the output of
> your command: (When I debug with "nate@clixel.com", it correctly skips
> dnslookup and matches the vdom_aliases router.)

sorry, my first thought was wrong.
It seems you are using the verp router and that it matches before the
router for local users (at least for nate@clixel.com). So can either put
all router for local users in front of the verp_router or add
!local_domains to the verp_router's domains condition.

For a proper test, run
exim -d -f mlmmj-test+bounces-13@lists.clixel.com -bt nate@clixel.com

The mlmmj domain should not be local_domains.
The reference to 127.0.0.1 you saw was about the sender host, which is
correct.

Oh, and recipient verification should be skipped for the mlmmj sender. I
will update README.exim4 for that.


