From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 15 Nov 2005 21:26:07 +0000
Subject: Re: case sensitivity of email addresses
Message-Id: <20051115212607.GB85098@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <200511150837.22197.neale@woozle.org>
In-Reply-To: <200511150837.22197.neale@woozle.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Neale Pickett <neale@woozle.org> [Nov 15. 2005 22:22]:
> > FWIW, this is what RFC2821 says about:
> >
> >    The local-part of a mailbox MUST BE treated as case sensitive. 
> > Therefore, SMTP implementations MUST take care to preserve the case of
> > mailbox local-parts.  Mailbox domains are not case sensitive.  In
> > particular, for some
> >    hosts the user "smith" is different from the user "Smith".
> > However, exploiting
> >    the case sensitivity of mailbox local-parts impedes interoperability and
> > is discouraged.
> 
> Right, so it's not clear to me what we're supposed to do in the face
> of some mail clients changing the case of the local-part.  Given that
> "exploiting the case sensitivity of mailbox local-parts ... is
> discouraged", I propose the RFC is suggesting the check be
> case-insensitive.

We want mlmmj to be case insensitive. We're not doing RFC2821--that's
supposed to be handled by the smtpd delivering to mlmmj.

Anyone have a patch, just for this?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
