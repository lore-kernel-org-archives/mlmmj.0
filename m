From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Wed, 14 Mar 2007 22:16:15 +0000
Subject: Re: Digest format lacks line break before boundary lines
Message-Id: <0b777fcea058fe59f9d415c5ae8aa5f4@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <17912.17402.917135.795821@a1ihome1.kph.uni-mainz.de>
In-Reply-To: <17912.17402.917135.795821@a1ihome1.kph.uni-mainz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Ulrich,

Ulrich Mueller <ulm@kph.uni-mainz.de> wrote:
> the format of mailing list digests created by mlmmj seems to lack a
> line break before the boundary delimiter lines.
> 
> There should be _two_ line breaks preceding the boundary lines,
> however, there is only one. I cite from RFC 2046, section 5.1.1.
> "Common Syntax":

Thanks for your bug report.

Here is a patch fixing the issue:

http://mlmmj.mmj.dk/~mortenp/patch-mlmmj-1.2.13-digest_rfc2046.diff

Have fun,
Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

