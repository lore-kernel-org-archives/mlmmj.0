From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Tue, 07 Nov 2006 21:56:23 +0000
Subject: Re: mlmmj-1.2.12-RC4 released
Message-Id: <428064adc93da425802482068c2f9d23@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <07000545535fd7f3f6fd56f93e19379f@mail.n0rd.dk>
In-Reply-To: <07000545535fd7f3f6fd56f93e19379f@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Jacob,

Jakob Hirsch <jh@plonk.de> wrote:
>>> I wanted to test on Exim, but for some reason
>>> I could not figure out it dumps core
>>
>> And this is RC4 I assume?
> 
> Sure. RC1 runs fine

Sorry.

I introduced the bug in my gethdrline() header unfolding fix in RC2. With the fix, gethdrline() does not handle end-of-file in headers correct.

This patch fixes the issue.

http://mlmmj.mmj.dk/~mortenp/patch-mlmmj-1.2.12_RC4-gethdrline.diff

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

