From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sat, 16 Oct 2004 12:46:42 +0000
Subject: Re: mail accepted but not retransmitted?
Message-Id: <20041016124642.GF48081@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <200410151214.34989.akohlsmith-mlmmj@benshaw.com>
In-Reply-To: <200410151214.34989.akohlsmith-mlmmj@benshaw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Andrew Kohlsmith <akohlsmith-mlmmj@benshaw.com> [Oct 15. 2004 18:15]:
> Pardon my ignorance, I am new to postfix and mlmmj, but I have been a diehard 
> qmail + ezmlm user for damn near a decade now (well the qmail part anyway).
> 
> I am setting up an entirely-virutal mail domain just like I do with 
> qmail+vpopmail and the virtual domain part is working great.  I created a 
> mlmmj-test@virtual.dom mailing list and subscribed my email address 
> (different domain, different server) to it.
> 
> I can send a message to mlmmj-test@virtual.dom and I see it delivered via the 
> mlmmj-receive program.
> 
> My /etc/aliases line:
> mlmmj-test:  "|/usr/local/bin/mlmmj-recieve -L /var/spool/mlmmj/mlmmj-test/"
> 
> Now I look in /var/spool/mlmmj/mlmmj-test/queue and I see the message there:
> 
> # cat /var/spool/mlmmj/mlmmj-test/queue/245a58f23ff51521
> X-Original-To: mlmmj-test@mixdown.ca
> Delivered-To: mlmmj-test@gromit.mixdown.ca
> Received: from me.com (localhost [127.0.0.1])
>         by gromit.mixdown.ca (Postfix) with SMTP id B7E93414E0B
>         for <mlmmj-test@mixdown.ca>; Tue, 12 Oct 2004 10:25:04 -0400 (EDT)
> From: akohlsmith@benshaw.com
> To: mlmmj-test@mixdown.ca
> Subject: test x
> Message-Id: <20041012142504.B7E93414E0B@gromit.mixdown.ca>
> Date: Tue, 12 Oct 2004 10:25:04 -0400 (EDT)
> 
> test x
> #
> 
> but mlmmj-deliver never seems to get called.  Relevant bits from maillog:
> 
> Oct 12 10:25:23 gromit postfix/cleanup[30745]: B7E93414E0B: 
> message-id=<20041012142504.B7E93414E0B@gromit.mixdown.ca>
> Oct 12 10:25:23 gromit postfix/qmgr[30715]: B7E93414E0B: 
> from=<akohlsmith@benshaw.com>, size62, nrcpt=1 (queue active)
> Oct 12 10:25:23 gromit postfix/local[30746]: B7E93414E0B: 
> to=<mlmmj-test@gromit.mixdown.ca>, orig_to=<mlmmj-test@mixdown.ca>, 
> relay=local, delay, status=sent (delivered to 
> command: /usr/local/bin/mlmmj-recieve -L /var/spool/mlmmj/mlmmj-test/)
> Oct 12 10:25:23 gromit postfix/qmgr[30715]: B7E93414E0B: removed
> 
> And that's it...  I do have the maintenance cron task running but it doesn't 
> seem to do much, as evidenced in the maintenance log...
> 
> I feel I'm missing something REALLY basic here but I can't figure it out.

What's the To: header, Delivered-To: header and contents of
listdir/control/listaddress?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
