From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 19 Aug 2004 18:45:29 +0000
Subject: Re: Checking envelope From for recipient delimiter
Message-Id: <20040819184529.GM70901@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20040819121309.GK70901@panther.mmj.dk>
In-Reply-To: <20040819121309.GK70901@panther.mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Anders Johansson <andjoh@rydsbo.net> [Aug 19. 2004 20:39]:
> > One of the mlmmj users had an incident with a completely horrible bounce
> > from Lotus Notes.
> >
> > They bounced to listname+bounces-... in envelope From but had a
> > different address in To:.
> 
> I don't understand this sentence at all. envelope From and To are usually 
> different?!

They are, but usually when a mailserver bounces something, it uses the
RCPT TO: as To: as well.

> > Since they've configured the list to not 
> > require the listaddress in the To: or Cc: header, the bounce ended up on
> > the list.
> >
> > So I wondered if any of the people on this list (I know there's quite
> > some wizard sysadmins subscribed :) could see any problem in sending the
> > mail to listcontrol in case envelope From contains a recipient
> > delimiter, and in such case completely ignore what's in To: and only
> > work on the envelope From from there on?
> 
> Do you mean "....in case envelope To " meaning RCPT TO: " contains..."? Isn't 
> this what is done already? No mail handling software should ever use the 
> information in the DATA section. I've seen several Domino systems acting as 
> remailers on mailing lists because they look at DATA To:, so maybe it's 
> standard procedure on those systems, but sane systems shouldn't look at DATA

Sane systems use the RCPT TO: as the user specified in To: right? That's
why it newer was an issue.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
