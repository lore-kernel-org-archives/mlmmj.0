From: Martin Brampton <martin@black-sheep-research.com>
Date: Mon, 12 Oct 2020 10:14:26 +0000
Subject: Re: [mlmmj] Problems with spam filters
Message-Id: <8072bb3a-3172-6dc8-211b-a8eafa665734@black-sheep-research.com>
List-Id: <mlmmj.mlmmj.org>
References: <640117cb-85da-7b62-6a6e-7066f6f3ec94@black-sheep-research.com>
In-Reply-To: <640117cb-85da-7b62-6a6e-7066f6f3ec94@black-sheep-research.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

OK, thanks. I guess that's inherent in mail server usage.

But I'm having problems with btinternet and hotmail users receiving from 
my mailing lists even when I am the sender. And in the case where I am 
the sender, the list server is my mail server, and so the mail should 
arrive with correct SPF, DKIM and DMARC.

Yet it is still treated as spam.

Is there any solution to any of these problems? Or are conventional 
mailing lists obsolete, to the detriment of the usefulness of email?


On 12/10/2020 07:55, Marcus MERIGHI wrote:
> Because the IP of the sending server (mlmmj list server at
> 198.101.246.47) is not in the SPF-published "allowed sender" IP list:
> 
> $ echo black-sheep-research.com | smtpctl spf walk
> 79.79.41.36
> 164.90.179.118
> 45.55.101.18
> 205.201.128.0/20
> 198.2.128.0/18
> 148.105.8.0/21
> 207.58.142.208/29
> 207.58.147.64/28
> 216.22.15.224/27
> 43.228.184.0/22
> 103.47.204.0/22
> 103.36.108.0/22
> 103.2.140.0/22
> 203.31.36.0/22
> 66.128.144.88/29
> 198.74.56.28

