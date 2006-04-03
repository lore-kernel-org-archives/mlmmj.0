From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 03 Apr 2006 22:49:46 +0000
Subject: Re: Mailing list moving messages to queue/discarded
Message-Id: <20060403224946.GE79072@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <937117890604031225n6181817bk91c2794d6934f6c0@mail.gmail.com>
In-Reply-To: <937117890604031225n6181817bk91c2794d6934f6c0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Andreas V. Meier <andreas@anvame.net> [Apr 03. 2006 22:44]:
> > I have set up a new mailing list (mlmmj 1.2.11, Exim 4, no VERP) and
> > when I try to send a message to the mailing list, it gets moved to
> > queue/discarded.
> > 
> > How can I find out why?
> 
> I found informative messages in my syslog when I started with mlmmj,
> you might want to have a look there. I think the logs of exim would
> just tell you that it was passed to mlmmj, right?

Good place to start, paste them here if you need help. Also--does the
messages in queue/discarded/ have a Return-Path: header?

http://mlmmj.mmj.dk/archive/0748.html was a thread an exim problem and
also http://ymmv.de/sw/mlmmj/README.exim4 is the latest and greated from
Jakob Hirsch about exim and mlmmj setup.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
