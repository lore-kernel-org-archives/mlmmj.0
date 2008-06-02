From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 02 Jun 2008 21:55:33 +0000
Subject: Re: Changing mailing list subscription process
Message-Id: <20080602215533.GF86724@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20080529230903.GJ16364@curie-int.orbis-terrarum.net>
In-Reply-To: <20080529230903.GJ16364@curie-int.orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Robin H. Johnson <robbat2@gentoo.org> [May 30. 2008 01:09]:
> Here's how they are conducting the attack:
> 
> 1. Spammer forges a mail from $LIST+subscibe@gentoo.org, sending it to
>    an auto-responder.
> 2. Lists sends a confirmation mail to the auto-responder.
> 3. Auto-responder sends mail, with intact confirmation data back to the
>    confirmation address (in Reply-To).
> 4. Auto-responder is now subscribed to the mailing list.
> 5. Spammer forges a mail from the auto-responder, to the normal mailing
>    list address.
> 
> I tried adding a specific Reply-To address in the header of the list
> text/ file, but it's made to part of the mail body instead of the
> header.

So what exactly would help you--I would be glad to cook up a patch to
test some things for you, but I need to know exactly what you want (yes,
I'm getting old and lazy--too lazy to figure it out myself :)

BTW, wouldn't ezmlm be prone to the same attacks?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
