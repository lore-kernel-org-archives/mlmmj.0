From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Fri, 06 May 2005 05:08:23 +0000
Subject: Re: mail to list+subscribe if already subscribed
Message-Id: <20050506050823.GF42647@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <427A83C8.7010304@plonk.de>
In-Reply-To: <427A83C8.7010304@plonk.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Jakob Hirsch <jh@plonk.de> [May 05. 2005 22:36]:
> Hi,
> 
> mlmmj seems to ignore subscribe-mails from already subscribed
> addresses.  Shouldn't it notify the user in this case?

You might argue that it should, and the reason it doesn't is that noone
made it so yet.

> Another thing I'd appreciate: Use a custom header instead of To/CC for
> getting the recipient address. This may not sound useful, but I had
> list-management mails sent to the list, because they had no To/CC
> header, but the envelope recipient was right. I'd tell my MTA to put
> the envelope-rcpt into the header (as it happens already with the
> envelope-sender in Return-Path) and would be on the safe side then.

Why do you allow mail to the list where the listaddress is not in To:
or Cc: in the first place?

You should use Delivered-To: for the envelope-rcpt, postfix (and qmail)
already does that.

> What do you think?  I'd try to put that into the code (not many
> changes, I'd say) and send patches.

Uuuuh, patches always sound extremely nice :-)

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
