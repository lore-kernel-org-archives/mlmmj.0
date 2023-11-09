From: Baptiste Daroussin <bapt@nours.eu>
Date: Thu, 09 Nov 2023 14:58:40 +0000
Subject: Re: [mlmmj] Odd message truncation with 1.4.0-rc2
Message-Id: <5bfnmsptmh6ld5tu52fas5uksxaxe6v2mbtfeey66zlhb4wolr@pxslq2dfprfu>
List-Id: <mlmmj.mlmmj.org>
References: <mg5alzflgvmkdvjy6sn3jpbnm5fcwy3bt4yx3ppccwlvmpwyq3@cb7xw4s4s64e>
In-Reply-To: <mg5alzflgvmkdvjy6sn3jpbnm5fcwy3bt4yx3ppccwlvmpwyq3@cb7xw4s4s64e>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, Nov 09, 2023 at 09:57:09AM -0500, Konstantin Ryabitsev wrote:
> On Thu, Nov 09, 2023 at 11:26:15AM +0100, Baptiste Daroussin wrote:
> > I think this should fix it:
> > https://codeberg.org/mlmmj/mlmmj/commit/b502a85f5bc6f12c24950e20f424e4be2b831dec
> 
> Ah, yes, that would explain the truncation. Does that also explain the fact
> that the index value remained the same?
> 

Yes I think so, mlmmj does not receive the reponse from the SMTP server it
expects, so it considers the delivery as failed

Best regards,
Bapt

