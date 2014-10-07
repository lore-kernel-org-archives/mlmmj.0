From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 07 Oct 2014 06:29:51 +0000
Subject: Re: [mlmmj] Broken email
Message-Id: <5433885F.8010505@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <CAPcb_GLkCEA6jPGqTE-jOmTax79m4=WoOsFyRSPSpg9bgQFxMA@mail.gmail.com>
In-Reply-To: <CAPcb_GLkCEA6jPGqTE-jOmTax79m4=WoOsFyRSPSpg9bgQFxMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 7/10/14 10:21 AM, Gavin Henry wrote:
> Hi all,
>
> We've set up mlmmj but emails come through broken in Gmail and just shoe this in
> the body with no Subject :
>
> MIME-Version: 1.0
> X-Received: by 10.68.209.138 with SMTP id mm10mr27452276pbc.88.1412636264404;
>   Mon, 06 Oct 2014 15:57:44 -0700 (PDT)
> Received: by 10.70.32.68 with HTTP; Mon, 6 Oct 2014 15:57:44 -0700 (PDT)
> Received: by 10.70.32.68 with HTTP; Mon, 6 Oct 2014 15:57:44 -0700 (PDT)
> Date: Mon, 6 Oct 2014 23:57:44 +0100
> Message-ID: <CAPcb_GLbsXNC7w6VHq
> <mailto:CAPcb_GLbsXNC7w6VHq-FpqNDqUrA4rXEHu6awi8N2xnyuCvBiw@mail.gmail.com>-
> <mailto:CAPcb_GLbsXNC7w6VHq-FpqNDqUrA4rXEHu6awi8N2xnyuCvBiw@mail.gmail.com>FpqNDqUrA4rXEHu6awi8N2xnyuCvBiw
> <mailto:CAPcb_GLbsXNC7w6VHq-FpqNDqUrA4rXEHu6awi8N2xnyuCvBiw@mail.gmail.com>@
> <mailto:CAPcb_GLbsXNC7w6VHq-FpqNDqUrA4rXEHu6awi8N2xnyuCvBiw@mail.gmail.com>mail.gmail.com
> <mailto:CAPcb_GLbsXNC7w6VHq-FpqNDqUrA4rXEHu6awi8N2xnyuCvBiw@mail.gmail.com>>
> Subject: [NOC Alerts] test
> From: Gavin Henry <ghenry@ <mailto:ghenry@suretec.co.uk>suretec.co.uk
> <mailto:ghenry@suretec.co.uk>>
> To: noc <mailto:noc-alerts@lists.suretec.net>-alerts@
> <mailto:noc-alerts@lists.suretec.net>lists.suretec.net
> <mailto:noc-alerts@lists.suretec.net>
> Content-Type: multipart/alternative; boundary7d7b111c77bcb66a0504c902b3
> Delivered-To: noc <mailto:noc-alerts@lists.suretec.net>-alerts@
> <mailto:noc-alerts@lists.suretec.net>lists.suretec.net
> <mailto:noc-alerts@lists.suretec.net>
>
> --047d7b111c77bcb66a0504c902b3
> Content-Type: text/plain; charset=ISO-8859-1
>
> What's breaking it?

Looks like the headers are being ended early somehow.

Do you have a customheaders tunable that has an extra newline at the end
of it? That could do it.

Ben.




