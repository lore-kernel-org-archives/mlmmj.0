From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Tue, 07 Oct 2014 08:43:11 +0000
Subject: Re: [mlmmj] Broken email
Message-Id: <6217178.v1xnFSImh8@trelane>
List-Id: <mlmmj.mlmmj.org>
References: <CAPcb_GLkCEA6jPGqTE-jOmTax79m4=WoOsFyRSPSpg9bgQFxMA@mail.gmail.com>
In-Reply-To: <CAPcb_GLkCEA6jPGqTE-jOmTax79m4=WoOsFyRSPSpg9bgQFxMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tuesday, October 07, 2014 08:25:42 Gavin Henry wrote:
> Here's the raw email:
> 
> http://paste.scsys.co.uk/428484

Within the email headers there's a blank line between the Date header and the 
MIME-Version header; a blank line after the headers is the usual breakpoint 
for where the body of the email starts.  I think this explains why the body of 
the email starts with the MIME-Version header.

> We're testing with prefix, footer and customerheaders (have now
> removed any trailing newlines and will test again):

There's another oddity: there are TWO Date headers; one after headers added by 
MLMMJ and one that looks like comes from the mail client, and the Date headers 
differ in time.  Additionally not all of the Received headers are contiguous 
and that's unusual.  I suspect that there may be an Exim misconfiguration when 
it comes to handling mailing list mail.

  -- Chris

--

Chris Knadle
Chris.Knadle@coredump.us

