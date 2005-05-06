From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Fri, 06 May 2005 12:36:09 +0000
Subject: Re: mail to list+subscribe if already subscribed
Message-Id: <20050506123609.GA1538@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <427A83C8.7010304@plonk.de>
In-Reply-To: <427A83C8.7010304@plonk.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Jakob Hirsch <jh@plonk.de> [May 06. 2005 14:32]:
> >>mlmmj seems to ignore subscribe-mails from already subscribed
> >>addresses.  Shouldn't it notify the user in this case?
> >You might argue that it should, and the reason it doesn't is that noone
> >made it so yet.
> 
> so it's time to change that. :)

Indeed.

> >Why do you allow mail to the list where the listaddress is not in To:
> >or Cc: in the first place?
> 
> Because I thought there's no reason for doing so, but dumb me forgot 
> about control messages...

And it also prevents spam.

> >You should use Delivered-To: for the envelope-rcpt, postfix (and qmail)
> >already does that.
> 
> Ok, found that in the mlmmj-process manpage.
> Exim has an option to add a header called Envelope-to, so it might be a 
> good idea to check for that, too. OTOH, it's easy to tell Exim to put 
> this into a Delivered-To header.

I thought about using Envelope-To if there is none, but since it's not
added pr. default and one have to add one or the other anyway, I prefer
following the "standard" and add Delivered-To:.

> >>What do you think?  I'd try to put that into the code (not many
> >>changes, I'd say) and send patches.
> >Uuuuh, patches always sound extremely nice :-)
> 
> on my way!

:)

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
