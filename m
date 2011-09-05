From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 05 Sep 2011 11:38:27 +0000
Subject: Re: [mlmmj] Regarding new listttexts
Message-Id: <4E64B4B3.7040703@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <20110905112154.GB22957@barfooze.de>
In-Reply-To: <20110905112154.GB22957@barfooze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 5/09/11 9:21 PM, Moritz Wilhelmy wrote:
> Just some questions regarding the new listtexts:
>
> The way I see it (from a quick look at the code), these "percent-
> conditions" are a new feature and mlmmj does not yet actually support
> expanding the listtexts?

Correct.

> When do you plan adding support?

I am implementing it currently. It should be in 1.2.18 which I plan to
release later this year (ASAP, really).

> Do you intend to parse this by hand, or do you consider using lex/yacc?

By hand, at least for starters, similarly to what we already do. It is
deliberately very simple. A little more complicated than what we
currently have, but still very simple.

Ben.




