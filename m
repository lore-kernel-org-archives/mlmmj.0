From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Mon, 18 Oct 2004 14:20:47 +0000
Subject: Re: SOLVED: mail accepted but not retransmitted?
Message-Id: <20041018142047.GD7292@mopo.i.tv2.dk>
List-Id: <mlmmj.mlmmj.org>
References: <200410181000.30302.akohlsmith-mlmmj@benshaw.com>
In-Reply-To: <200410181000.30302.akohlsmith-mlmmj@benshaw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, Oct 18, 2004 at 10:00:30AM -0400, Andrew Kohlsmith wrote:
> The exact command that is being executed is
> /usr/local/bin/mlmmj-send -L /var/spool/mlmmj/mlmmj-test/ 
> -m /var/spool/mlmmj/mlmmj-test//queue/72e1474456fce86a
> 
> I can run that manually and get a segmentation fault.  The strace output shows 
> that mlmmj-send segfaults after trying to do some network calls:
[snip]
> Drilling down a little more, I see that my /etc/hosts entry for this machine 
> is wrong.  I had renamed the machine but did not update /etc/hosts.
[snip]
> corrected the SIG11 and the list is now sending.

Ok.

> I am shortly going to submit a patch to mlmmj-1.0.0 which uses the RECIPDELIM 
> define throughout; right now only about 1/3 of the code uses it.  :-)

We're looking forward to it. It is a well known issue.

> Thank you all for your help in tracking this problem down.  It was a real
> bear of a problem and should probably make its way into a FAQ or README
> somewhere.

Well, no, it should be patched, if it is a problem in mlmmj. I guess we will
have to debug that a bit.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
