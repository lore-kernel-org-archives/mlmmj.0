From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Tue, 20 Feb 2007 22:52:49 +0000
Subject: Re: [PATCH] access log handling
Message-Id: <208cb44156e70c065142e63837619c8a@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Henne,

Henne Vogelsang <hvogel@opensuse.org> wrote:
> i would like to move logging about access rules to the operation log.  I
> think this is clearly mlm related and has nothing to do with the mail
> setup. A usecase for me is that i can expose the operation log to
> listowners via a webfrontend. I wouldnt be comfortable doing that with
> the systems mail log.

I agree.

> Patch attached.

When I looked at your patch (and do_access()) I realised that the code
was over-engineered (shame on me), so I simplified it a lot. I also
added even more logging. Now it logs every action taken by do_access()
in the operation log and errors are also logged in the mail log.

http://mlmmj.mmj.dk/~mortenp/patch-mlmmj-1.2.13-access.diff

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

