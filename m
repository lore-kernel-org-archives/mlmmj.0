From: Marcus MERIGHI <mcmer-mlmmj@tor.at>
Date: Sun, 11 Oct 2020 14:55:55 +0000
Subject: Re: [mlmmj] Problems with spam filters
Message-Id: <20201011145555.GJ76113@tor.at>
List-Id: <mlmmj.mlmmj.org>
References: <640117cb-85da-7b62-6a6e-7066f6f3ec94@black-sheep-research.com>
In-Reply-To: <640117cb-85da-7b62-6a6e-7066f6f3ec94@black-sheep-research.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

martin@black-sheep-research.com (Martin Brampton), 2020.10.11 (Sun) 15:04 (CEST):
> Despite it being neat software, I'm finding it near impossible to run mlmmj
> mailing lists because mail is being treated as junk by big mail outfits such
> as hotmail and btinternet.

SPF does not go along too well with traditional mailing lists:
(thats why more and more mailing lists rewrite the From:)

$ dig +short black-sheep-research.com mx
100 mx.yorkshiremail.com.

$ dig +short black-sheep-research.com txt
"v=spf1 include:yorkshiremail.com ~all"

$ dig +short yorkshiremail.com mx
100 mx.yorkshiremail.com.

$ dig +short mx.yorkshiremail.com
164.90.179.118

$ dig +short yorkshiremail.com txt
"v=spf1 a ip4:79.79.41.36 ip4:164.90.179.118 include:spf.smtp2go.com include:servers.mcsv.net ?all"

... but I get your mail, via the mlmmj list from this IP:

Received: from adhara.zumppe.net (adhara.zumppe.net [198.101.246.47])

This is why my rspamd gives your mail 3 spammy points:

R_DKIM_REJECT(1.00)[smtpcorp.com:s=a1-4,black-sheep-research.com:s=s151337];
DMARC_POLICY_REJECT(2.00)[black-sheep-research.com : No valid SPF,reject];

below just included for completeness, no score assigned:

DKIM_TRACE(0.00)[smtpcorp.com:-,black-sheep-research.com:-];
FROM_NEQ_ENVFROM(0.00)[martin@black-sheep-research.com,mlmmj@mlmmj.org]

I have no idea whether mlmmj has an option to rewrite the "From:"!
(And I hate the rewritten "From:"s...)

Marcus

> My own mail server (which includes rspamd) accepts mlmmj mailing list mail
> without a problem. And I can observe that my mail, as received, is checked
> to be valid for DKIM, SPF and DMARC. I've also checked some mail against
> e.g. mail-tester.com and not found any problems.
> 
> My mail server is not blacklisted anywhere.
> 
> Despite this, a number of recipients seem to have messages routinely put in
> junk, and they don't all monitor junk. This creates a big problem, and makes
> a mailing list unusable.
> 
> Obviously, I have no influence with hotmail, btinternet, etc who probably
> wouldn't even reply to me.
> 
> It seems that big commercial outfits want to force people into paid services
> and to prevent them using simple but valuable mechanisms such as an ordinary
> mailing list.
> 
> Is there anything I can do to deal with this problem?
> 
> 

-- 
https://www.tor.at/~mcmer/signature.txt

Ich untersage hiermit a) die Verwendung meiner personenbezogenen Daten
zu anderen Zwecken als den in diesem Vorgang gegenstaendlichen sowie b)
die Weitergabe meiner personenbezogenen Daten. Die Nichtbefolgung
dieser Anweisung ist in Oesterreich gesetzeswidrig. Siehe hiezu das 
Datenschutzgesetz (DSG) 2000 idgF., zu finden u.a. unter:
http://ris.bka.gv.at/GeltendeFassung.wxe?Abfrage=Bundesnormen&Gesetzesnummer=10001597

