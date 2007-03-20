From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 20 Mar 2007 14:30:33 +0000
Subject: Re: Address Parsing
Message-Id: <20070320143033.GB32481@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20070320140935.GP25058@suse.de>
In-Reply-To: <20070320140935.GP25058@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Henne Vogelsang <hvogel@opensuse.org> [Mar 20. 2007 15:09]:
> Hi,
> 
> i had a listmember that sent a mail that included brackets in the
> address field. Something like that:
> 
> To: mmj@mmj.dk
> Cc: Heino Vogel <hvogel@hennevogel.de>, opensuse-test@opensuse.org,
> "Henne (Work)" <hvogel@suse.de>
> 
> After some testing we found that the to/cc parsing goes wrong here
> (maybe because () are illegal?). The 3. and 4. address never reach mlmmj
> and thus it thinks that the listaddress (opensuse-test@opensuse.org) is
> not in to or cc.

I just looked through find_email_address.c, and it's the same in
FreeBSD-6.2, so the error must be ours?

Neal, it's been a while, am I remembering incorrectly that you added
this code (which was a HUGE improvement still)?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
