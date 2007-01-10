From: Jesper Lund <jesper@ballbreaker.dk>
Date: Wed, 10 Jan 2007 19:27:02 +0000
Subject: Re: Round robin relayhost
Message-Id: <20070110202702.a24eeda3.jesper@ballbreaker.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20070110195425.e60da9a4.jesper@ballbreaker.dk>
In-Reply-To: <20070110195425.e60da9a4.jesper@ballbreaker.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> > With the tunable, "relayhost", I can set a relayhost. I would
> > like to be able to specify multiple relayhosts, and round robin
> > between them. Just put 2 or more adresses in the "relayhost" file.
> >
> > Is this possible ? Otherwise, this is a feature request :-)
> 
> Is it not possible for you to set up relayhost.your.domain with
> multiple A records in DNS?

Been there, done that. But when I do that, it seems that mlmmj uses
the same relayhost to deliver all messages pr. posting, via the same
relayhost. I believe that from posting to posting, it will use
different relayhosts. 

My goal is to share the load between relayhosts, as I might have
about 25k subscribers. With a single relayhost it will take a long
time to deliver mail to all subscribers.

Regards, Jesper
