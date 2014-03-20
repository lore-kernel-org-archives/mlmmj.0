From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Thu, 20 Mar 2014 23:31:15 +0000
Subject: Re: [mlmmj] Encrypted list
Message-Id: <1641604.sKn2PbqMtR@trelane>
List-Id: <mlmmj.mlmmj.org>
References: <20140320184234.GG23804@szaflik.hasiok.net>
In-Reply-To: <20140320184234.GG23804@szaflik.hasiok.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thursday, March 20, 2014 23:34:34 Matti Nykyri wrote:
> On Thu, Mar 20, 2014 at 07:42:35PM +0100, Piotr Auksztulewicz wrote:
> > On Wed, Mar 19, 2014 at 11:42:30PM +0200, Matti Nykyri wrote:
[...]
> > Using complex cryptoghraphy like multiple-key encryption is
> > still harder and every subscriber would have to update the list of
> > recipients' keys to be able to encrypt the message for all of them to
> > be able to decrypt. In such case there's little advatange of having
> > a server, one may just put all of the addresses in the To: field.
> 
> Only way to implement encrypted list is to let the list decrypt and then
> reencrypt the messages. Otherwise the list needs to be implemented inside
> the MUA. Still this makes things simpler because it is then only needed
> for the list to have upto date keys of all the members. If MUA is doing
> the work then every subscriber has to have all the correct keys of all
> the subscribers!

Assuming we're discussing using PGP/GPG here (going to call it GPG for short), 
I can see how this could theoretically be done.  All users would have to have 
a GPG public/private keypair, and the mailing list itself would need a 
dedicated public/private keypair as well.  Users of the list would only have 
to import the GPG key of the list and /not/ of the other subscribers.  Emails 
sent back to the list would be encrypted using the /list/ GPG key, decrypted 
by the list, then messages would be re-encrypted to individual subscribers by 
the list itself.

Although technically possible to do, there are two snags.

1.  The GPG interface sucks.  I could rant about a long list of issues here,
    but suffice it to say that it's difficult to learn how to use it, how to
    get your favorite mail client integrated with it, how to configure GPG
    for setting the "default-preference-list" and "cert-digest-algo" ... etc.
    It represents a significant technical education problem.

2.  GPG can only encrypt the body of the message, and that doesn't cover any
    of the headers of the message, so the Subject, who the message is From
    and To, the route it took -- etc -- cannot be protected by GPG.  And
    one of the things we've learned from the Edward Snowden NSA revelations
    is that "metadata" itself is incredibly revealing.

[...] 
> > Therefore, semi-confidentiality of a regular closed list is not much
> > worse than re-encrypting list. To get in-transit confidentiality
> > it will be much simpler just to configure the server to use and
> > accept only STARTTLS SMTP sessions. Very few servers don't offer the
> > functionality today - and most will use it when available. From my
> > experience, non-TLS session on a TLS-advertising server is an almost
> > sure indication of spam.
> 
> I think there is a difference between the re-ecrypted and TLS protected
> messages. ISP's and anyone between the route is able to record messages
> and sell the content. That is what most of the companies do nowadays.
> Nobody would setup an encrypting mailing list to a server they don't
> trust.

I agree with Piotr: TLS is a /requirement/ for any "secure" mailing list, 
because TLS encryption starts at the connection with the MTA and therefore 
covers all of the headers as well as the body of the message.  The wonderful 
thing about TLS in SMTP is that if it were /mandated/ for all MTA transfers of 
a "secure" mailing list, the users don't have to do anything -- no GPG 
required, no key signatures, passwords -- nothing --from the user side it's 
dead simple.

And thankfully I see the same thing Piotr does: TLS SMTP transfers are now 
quite commonr.  There are unfortunately exceptions, so it's not quite 
ubiquitous yet -- I'm looking forward to the day when it is.

But if you say set up a separate copy of an MTA on a dedicated IP where the 
MTA /mandates/ TLS transfers, that in itself should cover most of what you'd 
need to allow running a "secure" mailing list with MLMMJ.

At least ... almost this is where I currently have an issue with MLMMJ: 
because I did this sort of "dual IP" setup (without mandating TLS transfers), 
but MLMMJ currently doesn't have a facility to specify which source IP to send 
email from, which makes the headers of the resulting email "look wrong" 
because it's sourced from the wrong IP.  To fix that in Exim4 I ended up 
having to make a "hack" whereby the "received_header_text" is set 
conditionally to remove the appearance of the "local MTA1" -> "local MTA2" 
transfer.

Creating the "source-IP" tunable is the facility I've been considering working 
on.

  -- Chris

--
Chris Knadle
Chris.Knadle@coredump.us

