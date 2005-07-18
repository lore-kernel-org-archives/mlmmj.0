From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 18 Jul 2005 20:29:33 +0000
Subject: Re: mlmmj 1.2.9 UNOFFICIAL release, with qmail support
Message-Id: <20050718202933.GK83227@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <42D3CDD00000AB73@ims3a.cp.tin.it>
In-Reply-To: <42D3CDD00000AB73@ims3a.cp.tin.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* fifadd@tin.it <fifadd@tin.it> [Jul 18. 2005 18:20]:
> Hi Mads,
> 
> in attach you can find the version 1.2.9 of mlmmj. This version support properly
> the qmail MTA. I have updated a lot of files, also the TODO, ChangeLog, VERSION,
> etc. Now you can easily change the constant RECIPDELIM to make mlmmj compatible
> with qmail.
> I have added the italian list texts and also a README.qmail.
> If you want check my improvements, you can use WinMerge or similar to compare
> sources. I cannot catalogue all the changes here, but you can read REAME.qmail
> and ChangeLog to get an idea.
> Attention! This is not an official release, but it's running on my server
> just now. You can use it at your own risk!
> Before to commit changes and release the official 1.2.9 version look at the
> new sources and check them please.

There's a few memory leaks, and it's also changing the coding style of
the existing code.

What if you try removing all the stuff you commented out, and then
instead of sending a whole tar-ball, create a patch with:

$ diff -urpN mlmmj-1.2.8 mlmmj-1.2.9 > recipdelim.patch

and then gzip the patch?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
