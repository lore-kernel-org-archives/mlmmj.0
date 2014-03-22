From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Sat, 22 Mar 2014 20:38:05 +0000
Subject: Re: [mlmmj] Encrypted list
Message-Id: <1466601.7IiCRv8oMB@trelane>
List-Id: <mlmmj.mlmmj.org>
References: <20140320184234.GG23804@szaflik.hasiok.net>
In-Reply-To: <20140320184234.GG23804@szaflik.hasiok.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Saturday, March 22, 2014 09:40:33 Matti Nykyri wrote:
> On Mar 21, 2014, at 22:09, Chris Knadle <Chris.Knadle@coredump.us> wrote:
> > So encrypting the entire DATA section would only require changing the SMTP
> > protocol for both MTAs and MUAs.  :-/
[...]
> An interesting change in smtp protocol would be an additional command that
> would specify a public key for the RCPT. In that way the new Received
> header could be encrypted with that key and prepended to the DATA portion.

You can't do that.  The MTA needs to be able to see the RCPT TO as part of the 
process /before/ the DATA SMTP section is seen, in order to know whether the 
recipient of the mail is local or can otherwise be accepted.  The MTA itself 
doesn't read the DATA section, it can only pass it to other processes and pass 
along the contents.

> This would make each MTA aware only of the previous MTA, the sender, and 
> the recipient. It is also secure because only the sender needs to
> authenticate the public key of the recipient. If someone changes the key in
> between the recipient just can't open the message.
> 
> The sender address needs to be a real clear text address to receive the
> error of mail delivery. To get even more privacy the senders server could
> do virtual address map for all the mails it sends. So for every email the
> user part of the address is a new random string.

This is possible to do with some forms of wildcard addressing, but if the 
sending address really were a random string then you'd be expecting the 
recipient of the mail to accept email as if it came from someone they knew 
even though it looked like it was sent from a new nonexistent address.  That 
muddies the phishing scams problem.

> When the message is being
> replied by the recipient or because of an error, the random user string is
> used. The original MTA will then map it to the real sender. The original
> recipient will get the true sender from the decrypted body of the message
> (the From header).
>
> Another point is the sending time. To fake that you could delay the message
> for a random time. But fighting metadata is actually really tricky. That's
> why it is so useful in analyzing traffic. It is hard to fake.

I haven't yet considered sending/transit time in my statistics and ACL 
checking, but I know others that do and seem to find it useful.

> But this is a never ending battle a cat and mouse chase... What gives more
> privacy and what hinders usability?!? Good solutions are usually simple and
> governments use billions for their goals!
>
> > I agree that we'd /want/ this -- but how would you accomplish this without
> > CA-signed TLS certificates?  The whole CA system is screwed up and makes
> > things more difficult.
> 
> I'm just saying that using TLS does not give any more privacy in mail
> delivery if you are fighting for privacy from a CA!

TLS encryption hides the contents of the transfer, even if there isn't 
authentication as part of it.  SSL/TLS has two distinct parts to it; 
encryption and authentication.  The encryption part is what hides data from 
prying eyes, the authentication part means being able to verify the source.  
Encryption adds privacy, even though it doesn't add authenticity; 
authentication alone /does not/ add privacy because it doesn't hide anything.

It can give "a feeling of security", knowing that the message you got came 
from the actual author, but not privacy.

> > The DANE protocol requires DNSSEC and very few sites/MTAs are using it
> > (supposedly only about 20 so far from last I heard), and not all MTAs have
> > the feature yet -- Postfix does but Exim doesn't yet -- the Exim
> > developers are looking into it though.  But even with DANE, it's a LOT to
> > expect for a site to run DNSSEC, especially being that not all DNS
> > servers support it.
> > 
> > So for now I think the best we can do is use /unauthenticated/ TLS --
> > purposefully -- so that at least the MTA transfers will be encrypted, even
> > though they're not authenticated.
> 
> To get true privacy to the content of the message you need to encrypt the
> message so that only your recipient has a key to open it! The true problem
> is authenticating this key you use to encrypt the message. Can you trust a
> CA to authenticate you recipients public key? To gain true positive
> authentication you will need to meet or talk with the recipient to verify
> the key. Here comes the web-of-trust in play. Now when you have established
> one authentication you should be able to trust all the keys that have been
> signed by your recipient.

You can encrypt a message for someone without meeting them if they tell you 
their key ID (or if you look it up), they just won't be able to 
cryptographically authenticate that it was you that sent it to them.
Same thing in reverse.

Having verified GPG keys that are signed and trusted is sadly a rare thing, 
even in the technological circles I'm in.  I wouldn't count on having that.  
Too problematic to accomplish in practice.

> >> Hopefully people will realice this some day. The main issue is in
> >> authentication. It is truely hard to be one 100% certain that someone is
> >> who he claims to be. The web-of-trust gives another and I would say a
> >> better approach to the chain-of-trust that has been the dominating way to
> >> do thigs.
> > 
> > The web-of-trust method is good for microcosms (such as the group of
> > Debian developers) but as a worldwide solution I think it's too easily
> > manipulated.
>
> I think that all your friends are quite a small microcosmos.

What's your point?  Very few of my friends are also part of the web-of-trust, 
so even assuming this was true, it doesn't really help.

  -- Chris

--
Chris Knadle
Chris.Knadle@coredump.us

