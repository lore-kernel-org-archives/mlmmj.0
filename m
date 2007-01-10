From: Jesper Lund <jesper@ballbreaker.dk>
Date: Wed, 10 Jan 2007 20:54:34 +0000
Subject: Re: Round robin relayhost
Message-Id: <20070110215434.5b92e1e4.jesper@ballbreaker.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20070110195425.e60da9a4.jesper@ballbreaker.dk>
In-Reply-To: <20070110195425.e60da9a4.jesper@ballbreaker.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

>  > Been there, done that. But when I do that, it seems that mlmmj
>  > uses
> > the same relayhost to deliver all messages pr. posting, via the
> > same relayhost. I believe that from posting to posting, it will
> > use different relayhosts. 
> 
> If the host ttl is low enough, this may be right. I guess that it
> will use the "first" reply from dns as long as its valid. Then it
> *may* switch...

The server which handles the mailinglist and runs mlmmj, i actually
using the DNS, which i authoritative for the host I am using as
relayhost. Posting by posting, it uses a different relayhost.

> > My goal is to share the load between relayhosts, as I might have
> > about 25k subscribers. With a single relayhost it will take a long
> > time to deliver mail to all subscribers.
> 
> Okay, but, maybe the better way to do this is with ipvs (linux
> virtual server) or a tool like balance which enables you to share
> the load between multiple servers.
> Its imho better because its more robust and the job of tools like
> balance is to balance the traffic, while mlmmjs job is beeing a
> mailing list manager ;)

Hmm..... I get your point :) The servers are all runnning FreeBSD.

Maybe I could do some voodoo with a local postfix, to make it do the
round robin for mlmmj, which just relay to "localhost".

What would you do, if your smtp server was "too slow" to relay the
mails fast enough ?

Regards, Jesper
