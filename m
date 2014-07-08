From: "A. Schulze" <sca@andreasschulze.de>
Date: Tue, 08 Jul 2014 19:04:28 +0000
Subject: Re: [mlmmj] Allowing empty enevelope senders
Message-Id: <20140708210428.Horde.xCdJZhpO89aYiumhxoev7A1@horde.andreasschulze.de>
List-Id: <mlmmj.mlmmj.org>
References: <3154844.GYFGS8R0Q3@storm>
In-Reply-To: <3154844.GYFGS8R0Q3@storm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Thomas Jarosch:

> we have one mlmmj list that gets back email bounces
> from a newsletter. Such bounce emails are usually sent
> using an empty envelope sender address "<>".
that may happen

> Currently mlmmj discards all emails with an empty envelope sender
> address and this is not configurable (see mlmmj-process.c, line ~704)
show logs of your evidence please

> I've found a good description why an empty envelope is a valid thing
> according to RFC 821, page 15:
> http://marc.merlins.org/netrants/nullenvelope.txt
RFC821 is 32 years old and updated many times. In terms of <> it's  
still not wrong
but be careful with your references.

> Should we make this configurable or disable the code altogether?
> If we make it configurable: Should we invert the default value?
first make sure you solve the right problem

Andreas


