From: Eric Wong <e@80x24.org>
Date: Fri, 20 May 2016 01:30:56 +0000
Subject: Re: [mlmmj] Adding customheaders & footer to mlmmj list-control mails message
Message-Id: <20160520013056.GA8577@dcvr.yhbt.net>
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20160504T203222-118504689Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20160504T203222-118504689Z@orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

"Robin H. Johnson" <robbat2@gentoo.org> wrote:
> Not handled by the above is including HTTP-based sub/unsub links, as required
> by SORBS, but this should be big help to everybody.

Yikes, SORBS requires HTTP links?  (I assume HTTPS is fine, too?)
Anyways, I'll see what I can cook up with Sendmail::Pmilter
and a PSGI app...

