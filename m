From: Jakob Hirsch <jh@plonk.de>
Date: Mon, 10 Oct 2005 21:41:05 +0000
Subject: Re: Fw: footer isn't appended to multipart messages (part II: reality
Message-Id: <434ADFF1.2020601@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <200507052130.02825.lists@seattleserver.com>
In-Reply-To: <200507052130.02825.lists@seattleserver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Mads Martin Joergensen wrote:

>>so I wonder what's wrong about it.
> Well, if someone wants to add a footer, then every single mail will be
> "massaged" even in the case of it not being needed. I really would like
> it to happen only when the mail is not a text mail.

I considered this, but thought it would be an advantage to have constant
behaviour. There's no real downside in always having a MIME mail, or is
it? Mailing list software always modify messages and all current MUAs
are MIME-capable. Checking for text/plain adds only a little complexity,
so if you insist on it, I'll do it. It's probably a good idea to make
this configurable (footer_force_mime or something).

> I also would like to see some checking of the writen() return values. If
> any one these writes fail, it just continues on.

Should we abort if a critical writen() fails?
There are already some writen() without checking...

