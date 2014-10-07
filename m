From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 07 Oct 2014 06:30:00 +0000
Subject: Re: [mlmmj] Broken email
Message-Id: <54338868.10506@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <CAPcb_GLkCEA6jPGqTE-jOmTax79m4=WoOsFyRSPSpg9bgQFxMA@mail.gmail.com>
In-Reply-To: <CAPcb_GLkCEA6jPGqTE-jOmTax79m4=WoOsFyRSPSpg9bgQFxMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> The headers above show numerous errors and do not show an external
> email sending attempt; all of the Received: lines show IP addresses
> that are always in a private IP range.

That will be because the external sending attempt is still in the
message headers (before they were ended prematurely). Only the headers
after the erroneous newline that's ending them are showing in the
message body the OP pasted.

> The To and From headers seem to have invalid email addresses in them
> like there's some kind of encapsulation going on; same with the
> Message-ID header.

I think that's because you read the plain text version of the email.
Presumably because the OP copied and pasted the message body (which is
actually overflown headers), all the email addresses in it were
converted to hyperlinks by the MUA for HTML mail, and then the
hyperlinks were converted to plain text in a stupid way, totally
mangling them.

So instead of:

To: noc-alerts@lists.suretec.net

you saw:

To: noc <noc-alerts@lists.suretec.net>-alerts@
<noc-alerts@lists.suretec.net>lists.suretec.net
<noc-alerts@lists.suretec.net>

> That's all I can determine from the above text.

Well done for getting that much!

What a mess!

Grins,

Ben.




