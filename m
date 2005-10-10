From: Jakob Hirsch <jh@plonk.de>
Date: Mon, 10 Oct 2005 22:08:16 +0000
Subject: Re: Fw: footer isn't appended to multipart messages (part II: reality
Message-Id: <434AE650.7000504@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <200507052130.02825.lists@seattleserver.com>
In-Reply-To: <200507052130.02825.lists@seattleserver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Neale Pickett wrote:

>>There's no real downside in always having a MIME mail, or is it?
> I would consider this behaviour undesirable.  YMMV.  

I don't want to raise another "MIME - bad or not?" discussion, but why?
MIME was considered a bad back in the old days, when bandwidth was
expensive and many MUAs couldn't handle it. Things have changed a lot
since then.

> If this does get added I hope it's optional.

So there should be an option footer_never_mime? Don't think that makes
much sense. If the mail has a multipart content-type, the footer will be
lost. If it's already MIME, we only meet the standards.
