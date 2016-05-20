From: Eric Wong <e@80x24.org>
Date: Fri, 20 May 2016 21:55:32 +0000
Subject: Re: [mlmmj] Adding customheaders & footer to mlmmj list-control mails message
Message-Id: <20160520215532.GA1917@dcvr.yhbt.net>
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20160504T203222-118504689Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20160504T203222-118504689Z@orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Eric Wong <e@80x24.org> wrote:
> "Robin H. Johnson" <robbat2@gentoo.org> wrote:
> > Not handled by the above is including HTTP-based sub/unsub links, as required
> > by SORBS, but this should be big help to everybody.
> 
> Yikes, SORBS requires HTTP links?  (I assume HTTPS is fine, too?)
> Anyways, I'll see what I can cook up with Sendmail::Pmilter
> and a PSGI app...

My first time using Sendmail::PMilter, but hopefully it's fine:

https://public-inbox.org/meta/20160520213655.19381-1-e@80x24.org/
(Also in the "unsub" branch in git://80x24.org/public-inbox.org)

For now the unique, per-user HTTPS unsubscribe link is only
enabled for whitelisted users; I don't want to propagate URLs
forever until I'm reasonably certain things are good.  I've
whitelisted Robin's email for the milter above, I can add others
if desired :>

You can try it with my instance at test@public-inbox.org
(mlmmj subscription to test+subscribe@public-inbox.org works)
I still have POST confirmation enabled in the example since
destructive actions over HTTP GET seems wrong to me, but
confirmation is easily disabled.


On a side note, public-inbox will probably start offering
lists over POP3, soon; since not many people read archives over
NNTP and I really don't like pushing mail as opposed to pulling.

