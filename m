From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Tue, 20 Mar 2007 18:17:59 +0000
Subject: Re: Address Parsing
Message-Id: <8bac8e70306d54df620e69e74511bed5@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20070320140935.GP25058@suse.de>
In-Reply-To: <20070320140935.GP25058@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Henne,

Henne Vogelsang <hvogel@opensuse.org> wrote:
> i had a listmember that sent a mail that included brackets in the
> address field. Something like that:
> 
> To: mmj@mmj.dk
> Cc: Heino Vogel <hvogel@hennevogel.de>, opensuse-test@opensuse.org, "Henne
> (Work)" <hvogel@suse.de>
> 
> After some testing we found that the to/cc parsing goes wrong here
> (maybe because () are illegal?). The 3. and 4. address never reach mlmmj
> and thus it thinks that the listaddress (opensuse-test@opensuse.org) is
> not in to or cc.

The parsing failed at the quotes. The code looked for end-quote, and if the
end-quote was after the comma, the comma was ignored. This should (obviously)
only be done, if the begin-quote was before the comma.

This patch fixes the issue:
http://mlmmj.mmj.dk/~mortenp/patch-mlmmj-1.2.13-find_email_adr.diff

Neale, will you send this fix upstream to wherever-the-code-came-from? :-)


Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

