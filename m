From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Thu, 13 Dec 2007 10:31:50 +0000
Subject: Re: MIME encodings when dealing with adding the footer
Message-Id: <1197541910.6363.19.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <1197540455.6128.23.camel@camobap>
In-Reply-To: <1197540455.6128.23.camel@camobap>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, 2007-12-13 at 13:07 +0300, Peter Volkov wrote:
> There is a problem in the current version of mlmmj in handling footer
> which in combination of gmail effectively makes impossible usage of this
> feature. In short if you have mail mime encoded
...
> The best fix would be, if the body has a non-plaintext type, add the
> footer in another MIME block, rather than trying to add it to the
> existing block.
...
> are there any plans to fix this issue?

Short answer: no.

Long answer: MIME parsing has been a source of vulnerabilities in almost
every single piece of software which attempts to parse MIME encoded
messages. Mlmmj can - in any normal installation - be triggered
remotely. It's a trade-off. I have made the decision to leave out MIME
parsing. I do not plan to add it, nor do I plan to accept patches which
add it.

However, Sascha Sommer has contributed a version of mlmmj-recieve [sic]
which can strip unwanted mime parts. It might be possible to extend it
to also add MIME encoded footers.

Morten

