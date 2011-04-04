From: Richard Mortimer <richm@oldelvet.org.uk>
Date: Mon, 04 Apr 2011 18:52:19 +0000
Subject: Re: [mlmmj] bounces from a closed list back to spoofed email addresses
Message-Id: <4D9A1363.7020903@oldelvet.org.uk>
List-Id: <mlmmj.mlmmj.org>
References: <BANLkTi=DTJ6pFmLUF3sc_Lf2heGpWXdxRg@mail.gmail.com>
In-Reply-To: <BANLkTi=DTJ6pFmLUF3sc_Lf2heGpWXdxRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

On 04/04/2011 15:54, Kovacs Albert wrote:
> Hello,
>
> I have a problem with one of my closed lists. Whenever a spammer tries
> to send an email, of course mlmmj bounces back a message that it's a
> closed list for subscribers only. So far, it's fine.
>
> However most of the time spammers enter a fake email address, and
> mlmmj tries to send back the bounces to the spoofed email addresses,
> which is of course impossible, so my postfix queue is filling with
> undeliverable mlmmj messages.
>
> My question is how to get rid of these messages? It would be nice if
> mlmmj could be set on a per list base to discard (ie. not to send) any
> bounce messages.
I think you want to set the  "nosubonlydenymails" and/or 
"noaccessdenymails" tunables
see http://mlmmj.org/docs/tunables/

Another option is to set "modnonsubposts" and moderate all 
non-subscriber posts. That means that the moderator gets all the junk 
but it does mean that you don't get hard to diagnose dropped mail when 
people post from alternate email addresses by accident.

Regards

Richard

>
> Best regards,
> Bela
>
>

