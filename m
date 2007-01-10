From: Jesper Lund <jesper@ballbreaker.dk>
Date: Wed, 10 Jan 2007 20:24:46 +0000
Subject: Re: Round robin relayhost
Message-Id: <20070110212446.30af0b98.jesper@ballbreaker.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20070110195425.e60da9a4.jesper@ballbreaker.dk>
In-Reply-To: <20070110195425.e60da9a4.jesper@ballbreaker.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> >>> With the tunable, "relayhost", I can set a relayhost. I would
> >>> like to be able to specify multiple relayhosts, and round robin
> >>> between them. Just put 2 or more adresses in the "relayhost"
> >>> file.
> >>>
> >>> Is this possible ? Otherwise, this is a feature request :-)
> >>
> >> Is it not possible for you to set up relayhost.your.domain with
> >> multiple A records in DNS?
> >
> > Been there, done that. But when I do that, it seems that mlmmj
> > uses the same relayhost to deliver all messages pr. posting, via
> > the same relayhost.
> 
> Perhaps mlmmj should use a list of addresses if gethostbyname
> returns more than one.
> 
> But are you sure that using multiple relayhosts will actually get
> your messages out any quicker?

I think it would be easier for me just to put a list of relayhosts in
the file. But i'm not a programmer. Maybe there is a reason not to do
it.

I can't find a reason why it should not get its messages out faster.
Because of mlmmj being faster than my smtp server(s).

Regards, Jesper
