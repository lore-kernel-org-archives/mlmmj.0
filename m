From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sun, 17 Oct 2004 17:55:43 +0000
Subject: Re: mail accepted but not retransmitted?
Message-Id: <20041017175543.GJ48081@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <200410151214.34989.akohlsmith-mlmmj@benshaw.com>
In-Reply-To: <200410151214.34989.akohlsmith-mlmmj@benshaw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Andrew Kohlsmith <akohlsmith-mlmmj@benshaw.com> [Oct 16. 2004 18:39]:
> > Does it work if you touch listdir/control/tocc ?
> 
> No.  :-(
> 
> # ls -l control/tocc
> -rw-r--r--  1 vmail vmail 0 2004-10-16 12:32 control/tocc
> 
> At what point is mlmmj supposed to take the messages in the queue and send 
> them?

What are the permissions on the listdirectory?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
