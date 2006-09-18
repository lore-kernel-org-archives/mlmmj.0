From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Mon, 18 Sep 2006 20:28:19 +0000
Subject: Re: mlmmj-send processes eating cpu
Message-Id: <acddc9754e8ae58deb8a8b80d610d401@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4BFA0DC3-3060-4B2B-8FBE-E5F8DD32E84E@gmail.com>
In-Reply-To: <4BFA0DC3-3060-4B2B-8FBE-E5F8DD32E84E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Nate,

Nate Beaty <natebeaty@gmail.com> wrote:
> Sorry for all the posts.. but I seem to have run into a few problems
> that my feeble troubleshooting skills aren't figuring out.

No problem, that is what the list is for.

> mlmmj-send is still consuming all my CPU resources:

The function that checks SMTP replies was not doing proper EOF checking, so it would enter an infinite loop if the SMTP server closed the connection while mlmmj was waiting for the reply.

I have fixed the issue. Please try the following patch:

http://mlmmj.mmj.dk/~mortenp/patch-mlmmj-1.2.12_RC2-checkwait_smtpreply.diff

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

