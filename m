From: morten@afdelingp.dk
Date: Wed, 01 Sep 2004 22:58:29 +0000
Subject: Re: digest separation
Message-Id: <1094079509.413654159ca53@mail.afdelingp.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20040901093648.GA68374@panther.mmj.dk>
In-Reply-To: <20040901093648.GA68374@panther.mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Quoting Mads Martin Joergensen <mmj@mmj.dk>:
> > I think the correct (as in RFC 2046) way to do it is to make the digest
> > mail a multipart/digest, and have each mail be a part with content type
> > message/rfc822.
>
> Ok. Have an example of how such an RFC conformant thing actually looks?

http://rfc.net/rfc1521.html#s7.2.4.
http://rfc.net/rfc2046.html#s5.1.5.

The example in 1521 is only multipart/digest, and the one in 2046 is a
multipart/mixed with a text/plain part and a multipart/digest part.

I *think* ezmlm-idx creats a single multipart/digest (in MIME, VIRGIN and NATIVE
modes), but I am not sure. As far as I can see, it also includes a MIXED mode,
which is the same as the others, but with a content type of multipart/mixed on
the main part, to work around a bug in Pine. RFC 1153 (oh, I love this kind of
research) also describes a digest format, but it is non-MIME and ugly IMO.
Let's ignore it :-)

Do we need a text part, or is multipart/{digest,mixed} enough?

Best regards,
Morten

--
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
