From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Thu, 09 Nov 2023 15:03:18 +0000
Subject: Re: [mlmmj] Odd message truncation with 1.4.0-rc2
Message-Id: <zgut6u4figaacj72vztpcxzgqu5aeytp2w4gyblvgml44dndkp@ddzvwvrmhlyk>
List-Id: <mlmmj.mlmmj.org>
References: <mg5alzflgvmkdvjy6sn3jpbnm5fcwy3bt4yx3ppccwlvmpwyq3@cb7xw4s4s64e>
In-Reply-To: <mg5alzflgvmkdvjy6sn3jpbnm5fcwy3bt4yx3ppccwlvmpwyq3@cb7xw4s4s64e>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, Nov 09, 2023 at 03:58:40PM +0100, Baptiste Daroussin wrote:
> > Ah, yes, that would explain the truncation. Does that also explain the fact
> > that the index value remained the same?
> > 
> 
> Yes I think so, mlmmj does not receive the reponse from the SMTP server it
> expects, so it considers the delivery as failed

Great, thank you. I've built the latest master and re-enabled mlmmjopt on
those two lists. If something else comes up, I'll report it.

Best wishes,
-K

