From: "Morten K. Poulsen" <mopo@mopo.tv2.local>
Date: Wed, 01 Sep 2004 14:30:58 +0000
Subject: Re: digest separation
Message-Id: <20040901143058.GB2126@mopo.tv2.local>
List-Id: <mlmmj.mlmmj.org>
References: <20040901093648.GA68374@panther.mmj.dk>
In-Reply-To: <20040901093648.GA68374@panther.mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wed, Sep 01, 2004 at 11:36:48AM +0200, Mads Martin Joergensen wrote:
> What seperates every mail in a digest of several mails?

I think the correct (as in RFC 2046) way to do it is to make the digest
mail a multipart/digest, and have each mail be a part with content type
message/rfc822.

Best regards,
Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
