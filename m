From: "A. Schulze" <sca@andreasschulze.de>
Date: Tue, 03 Mar 2020 08:58:59 +0000
Subject: Re: [mlmmj] DMARC (corrected)
Message-Id: <20200303095859.Horde.WCHP_tNDxpm70b-4WXMAcYP@andreasschulze.de>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Christof Thalhofer:

> They say, reject every mail that is supposed to come from casema.nl but
> was sent from a server not being part of this domain.

Hello,

I like to correct the wording:
p=reject aks the receiving MTA to reject messages with RFC5322.From =  
*@casema.nl
unless the message could be successful authenticated by SPF or DKIM.

That open two options
- auth by SPF
   usually happen for directly sent messages from the originators MTA
   unlikely to happen for messages sent via an MLM as such hosts  
aren't expected to be included in senders SPF

- auth by DKIM
   very common for MLM to break DKIM signatures by
   * adding a subject tag
   * adding a footer to mail body

So, as MLM operator you /may/ make your lists "dkim save": strictly  
avoid any message modification.
Then any subscriber could use your MLM even if the subscriber announce  
dmarc p=reject

Andreas


