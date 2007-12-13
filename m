From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Thu, 13 Dec 2007 13:00:05 +0000
Subject: Re: MIME encodings when dealing with adding the footer
Message-Id: <1197550805.6363.37.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <1197540455.6128.23.camel@camobap>
In-Reply-To: <1197540455.6128.23.camel@camobap>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, 2007-12-13 at 04:02 -0800, Robin H. Johnson wrote:
...
> > > ?? ??????, 13/12/2007 ?? 11:31 +0100, Morten K. Poulsen ??????????:
...
> > > > I have made the decision to leave out MIME parsing. I do
> > > > not plan to add it, nor do I plan to accept patches which
> > > > add it.
...
> Could we have a limited feature then:
> - If we think it is NOT safe to add the footer, then do not add it.

Yes, that would be possible to implement. And it is a good idea.

> Cases where it is not safe:
> 1. The mail has more than one MIME part (not parse, just read the mail
> headers).

Technically it *is* safe to add text in the MIME epilogue.

> 2. The mail is not MIME, but is not safe encoding to muck with.
> 
> #2 was Peter's original case that he reported to me for the Gentoo lists,
> a mail having the following headers:
> Content-Transfer-Encoding: base64
> Content-Type: text/plain; charset="utf-8"
> Content-Disposition: inline
> 
> Should NOT get a plaintext footer added, because it would cause the
> base64 to not decode.

You are right, we should not add a plain text footer to mails with an
unknown Content-Transfer-Encoding. We could encode it, if the mail is in
a known encoding (quoted-printable, base64). Patches are, as always,
very welcome :-)

Morten

