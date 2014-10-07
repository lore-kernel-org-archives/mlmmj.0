From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Tue, 07 Oct 2014 03:30:28 +0000
Subject: Re: [mlmmj] Broken email
Message-Id: <1578751.LKacbMl1qM@trelane>
List-Id: <mlmmj.mlmmj.org>
References: <CAPcb_GLkCEA6jPGqTE-jOmTax79m4=WoOsFyRSPSpg9bgQFxMA@mail.gmail.com>
In-Reply-To: <CAPcb_GLkCEA6jPGqTE-jOmTax79m4=WoOsFyRSPSpg9bgQFxMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tuesday, October 07, 2014 00:21:50 Gavin Henry wrote:
> Hi all,
> 
> We've set up mlmmj but emails come through broken in Gmail and just shoe
> this in the body with no Subject :
> 
> MIME-Version: 1.0
> X-Received: by 10.68.209.138 with SMTP id
> mm10mr27452276pbc.88.1412636264404;
>  Mon, 06 Oct 2014 15:57:44 -0700 (PDT)
> Received: by 10.70.32.68 with HTTP; Mon, 6 Oct 2014 15:57:44 -0700 (PDT)
> Received: by 10.70.32.68 with HTTP; Mon, 6 Oct 2014 15:57:44 -0700 (PDT)
> Date: Mon, 6 Oct 2014 23:57:44 +0100
> Message-ID: <CAPcb_GLbsXNC7w6VHq
> <CAPcb_GLbsXNC7w6VHq-FpqNDqUrA4rXEHu6awi8N2xnyuCvBiw@mail.gmail.com>-
> <CAPcb_GLbsXNC7w6VHq-FpqNDqUrA4rXEHu6awi8N2xnyuCvBiw@mail.gmail.com>
> FpqNDqUrA4rXEHu6awi8N2xnyuCvBiw
> <CAPcb_GLbsXNC7w6VHq-FpqNDqUrA4rXEHu6awi8N2xnyuCvBiw@mail.gmail.com>@
> <CAPcb_GLbsXNC7w6VHq-FpqNDqUrA4rXEHu6awi8N2xnyuCvBiw@mail.gmail.com>
> mail.gmail.com
> <CAPcb_GLbsXNC7w6VHq-FpqNDqUrA4rXEHu6awi8N2xnyuCvBiw@mail.gmail.com>>
> Subject: [NOC Alerts] test
> From: Gavin Henry <ghenry@ <ghenry@suretec.co.uk>suretec.co.uk
> <ghenry@suretec.co.uk>>
> To: noc <noc-alerts@lists.suretec.net>-alerts@
> <noc-alerts@lists.suretec.net>lists.suretec.net
> <noc-alerts@lists.suretec.net>
> Content-Type: multipart/alternative; boundary7d7b111c77bcb66a0504c902b3
> Delivered-To: noc <noc-alerts@lists.suretec.net>-alerts@
> <noc-alerts@lists.suretec.net>lists.suretec.net
> <noc-alerts@lists.suretec.net>
> 
> --047d7b111c77bcb66a0504c902b3
> Content-Type: text/plain; charset=ISO-8859-1
> 
> What's breaking it?
> 
> Thanks.
> 
> --
> Kind Regards,
> 
> Gavin Henry.

The headers above show numerous errors and do not show an external email 
sending attempt; all of the Received: lines show IP addresses that are always 
in a private IP range.  The To and From headers seem to have invalid email 
addresses in them like there's some kind of encapsulation going on; same with 
the Message-ID header.  That's all I can determine from the above text.

  -- Chris

--

Chris Knadle
Chris.Knadle@coredump.us

