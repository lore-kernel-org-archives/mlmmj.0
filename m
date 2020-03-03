From: "Richard Torrens (lists)" <Lists@Torrens.org>
Date: Tue, 03 Mar 2020 12:17:39 +0000
Subject: Re: [mlmmj] DMARC (corrected)
Message-Id: <584b6eaaf7Lists@Torrens.org>
List-Id: <mlmmj.mlmmj.org>
References: <20200303095859.Horde.WCHP_tNDxpm70b-4WXMAcYP@andreasschulze.de>
In-Reply-To: <20200303095859.Horde.WCHP_tNDxpm70b-4WXMAcYP@andreasschulze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

In article
<20200303095859.Horde.WCHP_tNDxpm70b-4WXMAcYP@andreasschulze.de>,
   A. Schulze <sca@andreasschulze.de> wrote:

> Christof Thalhofer:

> > They say, reject every mail that is supposed to come from casema.nl but
> > was sent from a server not being part of this domain.

> Hello,

> I like to correct the wording:
> p=reject aks the receiving MTA to reject messages with RFC5322.From =  
> *@casema.nl
> unless the message could be successful authenticated by SPF or DKIM.

dig is a tool I was not aware of. Unfortunately the response is not
exactly clear so thanks fot the exp;anation.



> That open two options
> - auth by SPF
>    usually happen for directly sent messages from the originators MTA
>    unlikely to happen for messages sent via an MLM as such hosts  
> aren't expected to be included in senders SPF

> - auth by DKIM
>    very common for MLM to break DKIM signatures by
>    * adding a subject tag
>    * adding a footer to mail body

> So, as MLM operator you /may/ make your lists "dkim save": strictly  
> avoid any message modification.
> Then any subscriber could use your MLM even if the subscriber announce  
> dmarc p=reject

Yes - I got this much earlier: I used to add a footer and an i/d to the
subject. But removing them has not changed things. 

It seems to me that I need to remove the original From and insert subjects
such as

From: thelist
Original-sender: theposter

But there seems to be no way of inserting the original poster's email
address in a new header?

-- 
Richard Torrens.
http://www.Torrens.org for genealogy, natural history, wild food, walks, cats
and more!

