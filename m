From: Anders Johansson <andjoh@rydsbo.net>
Date: Thu, 19 Aug 2004 18:39:05 +0000
Subject: Re: Checking envelope From for recipient delimiter
Message-Id: <200408192039.05455.andjoh@rydsbo.net>
List-Id: <mlmmj.mlmmj.org>
References: <20040819121309.GK70901@panther.mmj.dk>
In-Reply-To: <20040819121309.GK70901@panther.mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thursday 19 August 2004 14:13, Mads Martin Joergensen wrote:
> Hey together,
>
> One of the mlmmj users had an incident with a completely horrible bounce
> from Lotus Notes.
>
> They bounced to listname+bounces-... in envelope From but had a
> different address in To:.

I don't understand this sentence at all. envelope From and To are usually 
different?!

> Since they've configured the list to not 
> require the listaddress in the To: or Cc: header, the bounce ended up on
> the list.
>
> So I wondered if any of the people on this list (I know there's quite
> some wizard sysadmins subscribed :) could see any problem in sending the
> mail to listcontrol in case envelope From contains a recipient
> delimiter, and in such case completely ignore what's in To: and only
> work on the envelope From from there on?

Do you mean "....in case envelope To " meaning RCPT TO: " contains..."? Isn't 
this what is done already? No mail handling software should ever use the 
information in the DATA section. I've seen several Domino systems acting as 
remailers on mailing lists because they look at DATA To:, so maybe it's 
standard procedure on those systems, but sane systems shouldn't look at DATA
