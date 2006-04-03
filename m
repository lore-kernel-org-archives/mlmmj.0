From: "=?ISO-8859-1?Q?Marcelo_E._Magall=F3n?=" <marcelo.magallon@gmail.com>
Date: Mon, 03 Apr 2006 23:37:53 +0000
Subject: Re: Mailing list moving messages to queue/discarded
Message-Id: <937117890604031637w3c01ef6cse4f9921f846daa20@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <937117890604031225n6181817bk91c2794d6934f6c0@mail.gmail.com>
In-Reply-To: <937117890604031225n6181817bk91c2794d6934f6c0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 4/3/06, Mads Martin Joergensen <mmj@mmj.dk> wrote:
> * Andreas V. Meier <andreas@anvame.net> [Apr 03. 2006 22:44]:

> > I found informative messages in my syslog when I started with mlmmj,
> > you might want to have a look there. I think the logs of exim would
> > just tell you that it was passed to mlmmj, right?

Ah, thank you, I was looking for messases in the exim message log
only.  It didn't occur to me that mlmmj was sending messages to syslog
by itself.  That's something to remember!

> Good place to start, paste them here if you need help. Also--does the
> messages in queue/discarded/ have a Return-Path: header?

And this was indeed the problem.  No Return-Path, I had forgotten to
add it to the transport, just like the README says you have to.

Thanks!

Marcelo
