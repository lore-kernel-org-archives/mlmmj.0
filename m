From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Thu, 13 Dec 2007 11:49:14 +0000
Subject: Re: MIME encodings when dealing with adding the footer
Message-Id: <1197546554.6363.26.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <1197540455.6128.23.camel@camobap>
In-Reply-To: <1197540455.6128.23.camel@camobap>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org


On Thu, 2007-12-13 at 14:18 +0300, Peter Volkov wrote:
> В Чтв, 13/12/2007 в 11:31 +0100, Morten K. Poulsen пишет:
> > Long answer: MIME parsing has been a source of vulnerabilities in almost
> > every single piece of software which attempts to parse MIME encoded
> > messages. Mlmmj can - in any normal installation - be triggered
> > remotely. It's a trade-off. I have made the decision to leave out MIME
> > parsing. I do not plan to add it, nor do I plan to accept patches which
> > add it.
> 
> Morten, but then footer feature should be dropped from mlmmj as it does
> not work and breaks mails. Or at least big red notice should be added...
> What do you think about this?

Yes, a word of warning in the readme might be a good idea.

Morten

