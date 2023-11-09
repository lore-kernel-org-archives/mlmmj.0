From: Baptiste Daroussin <bapt@nours.eu>
Date: Thu, 09 Nov 2023 15:09:46 +0000
Subject: Re: [mlmmj] Odd message truncation with 1.4.0-rc2
Message-Id: <wqgmzepu72ntbj3fznynkdop72jogkblcby7tjtdmrwqnpowkk@kn4ogjacpmwe>
List-Id: <mlmmj.mlmmj.org>
References: <mg5alzflgvmkdvjy6sn3jpbnm5fcwy3bt4yx3ppccwlvmpwyq3@cb7xw4s4s64e>
In-Reply-To: <mg5alzflgvmkdvjy6sn3jpbnm5fcwy3bt4yx3ppccwlvmpwyq3@cb7xw4s4s64e>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, Nov 09, 2023 at 10:03:18AM -0500, Konstantin Ryabitsev wrote:
> On Thu, Nov 09, 2023 at 03:58:40PM +0100, Baptiste Daroussin wrote:
> > > Ah, yes, that would explain the truncation. Does that also explain the fact
> > > that the index value remained the same?
> > > 
> > 
> > Yes I think so, mlmmj does not receive the reponse from the SMTP server it
> > expects, so it considers the delivery as failed
> 
> Great, thank you. I've built the latest master and re-enabled mlmmjopt on
> those two lists. If something else comes up, I'll report it.
> 
I'll on my side have setup a couple of the FreeBSD mailing lists to use that
version as well, I will let them run for a month to see.

Best regards,
Bapt

