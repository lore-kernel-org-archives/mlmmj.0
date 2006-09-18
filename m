From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Mon, 18 Sep 2006 19:18:03 +0000
Subject: Re: [Fwd: Re: Mails in incoming cause of "invalid from"]
Message-Id: <5cc1638fad7ae4e67ef00a22914cd607@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <450B2711.4030008@darkman.de>
In-Reply-To: <450B2711.4030008@darkman.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Sven,

On Sun, 17 Sep 2006 20:35:14 +0200, Sven 'Darkman' Michels <sven@darkman.de> wrote:
> Mads Martin Joergensen wrote:
>> Can you try it without this patch?
> 
> doesn't work. It looks like the problem existed before
> because i run 1.2.11 since beginning of the year and
> haven't changed anything.

Yes, it is an old (but unknown) issue. We have just never seen any problems with it.

The problem is this; If a header is followed by a line beginning with whitespace, that next line is to be "folded" back into the first one (RFC 2822 section 2.2.3). We did that. However, we did not follow RFC 2822 section 3.2.3, which states:

   However, where CFWS occurs in this standard, it MUST NOT be inserted
   in such a way that any line of a folded header field is made up
   entirely of WSP characters and nothing else.

So "Header: value1\n value2\n" was unfolded, but so was "\n body." So if a mail's body begin with a whitespace character, that first body line is folded onto the end-of-headers marker, and header parsing continues down through the mail body.

I have fixed the issue, and you can get the patch from

http://mlmmj.mmj.dk/~mortenp/patch-mlmmj-1.2.12_RC2-gethdrline.diff

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

