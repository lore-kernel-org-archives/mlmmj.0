From: Matti Nykyri <matti.nykyri@iki.fi>
Date: Sat, 22 Mar 2014 07:40:33 +0000
Subject: Re: [mlmmj] Encrypted list
Message-Id: <06D743FF-562B-496E-8C06-FAA1192CDC6D@iki.fi>
List-Id: <mlmmj.mlmmj.org>
References: <20140320184234.GG23804@szaflik.hasiok.net>
In-Reply-To: <20140320184234.GG23804@szaflik.hasiok.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

On Mar 21, 2014, at 22:09, Chris Knadle <Chris.Knadle@coredump.us> wrote:

> So encrypting the entire DATA section would only require changing the SMTP 
> protocol for both MTAs and MUAs.  :-/

Everything depends on the needs of users. And in the long run protocols an standards change. This hole snowden stuff has brought the problems to the eyes of common users. The professionals that seek for total privacy already have the tools and special applications for doing it. For an expert it is possible get privacy, but it takes a lot of effort.

An interesting change in smtp protocol would be an additional command that would specify a public key for the RCPT. In that way the new Received header could be encrypted with that key and prepended to the DATA portion. This would make each MTA aware only of the previous MTA, the sender, and  the recipient. It is also secure because only the sender needs to authenticate the public key of the recipient. If someone changes the key in between the recipient just can't open the message.

The sender address needs to be a real clear text address to receive the error of mail delivery. To get even more privacy the senders server could do virtual address map for all the mails it sends. So for every email the user part of the address is a new random string. When the message is being replied by the recipient or because of an error, the random user string is used. The original MTA will then map it to the real sender. The original recipient will get the true sender from the decrypted body of the message (the From header).

Another point is the sending time. To fake that you could delay the message for a random time. But fighting metadata is actually really tricky. That's why it is so useful in analyzing traffic. It is hard to fake.

But this is a never ending battle a cat and mouse chase... What gives more privacy and what hinders usability?!? Good solutions are usually simple and governments use billions for their goals!

> 
> I agree that we'd /want/ this -- but how would you accomplish this without
> CA-signed TLS certificates?  The whole CA system is screwed up and makes 
> things more difficult.

I'm just saying that using TLS does not give any more privacy in mail delivery if you are fighting for privacy from a CA!

> The DANE protocol requires DNSSEC and very few sites/MTAs are using it 
> (supposedly only about 20 so far from last I heard), and not all MTAs have the 
> feature yet -- Postfix does but Exim doesn't yet -- the Exim developers are 
> looking into it though.  But even with DANE, it's a LOT to expect for a site 
> to run DNSSEC, especially being that not all DNS servers support it.
> 
> So for now I think the best we can do is use /unauthenticated/ TLS -- 
> purposefully -- so that at least the MTA transfers will be encrypted, even 
> though they're not authenticated.

To get true privacy to the content of the message you need to encrypt the message so that only your recipient has a key to open it! The true problem is authenticating this key you use to encrypt the message. Can you trust a CA to authenticate you recipients public key? To gain true positive authentication you will need to meet or talk with the recipient to verify the key. Here comes the web-of-trust in play. Now when you have established one authentication you should be able to trust all the keys that have been signed by your recipient.

>> Hopefully people will realice this some day. The main issue is in
>> authentication. It is truely hard to be one 100% certain that someone is
>> who he claims to be. The web-of-trust gives another and I would say a
>> better approach to the chain-of-trust that has been the dominating way to
>> do thigs.
> 
> The web-of-trust method is good for microcosms (such as the group of Debian 
> developers) but as a worldwide solution I think it's too easily manipulated.

I think that all your friends are quite a small microcosmos.

> 
> Okay, I see what you mean.
> 
> There is another downside to GPG-encrypted email though; you can't search 
> through it easily for past content you're looking for.  [Well, you can, but it 
> takes significant effort.]

True. The search needs to happen in your MUA and it might get slow without good indexing or without downloading all the mail to your local drive.

> However if you're looking for a Mailing List Manager that uses GPG, I believe 
> the 'schleuder' package can do that (it's one of the MLMs I looked at before 
> deciding to go with MLMMJ):
> 
> ---------------------------------------------------------------------
> $ apt-cache show schleuder
> 
> Package: schleuder
> Version: 2.2.1-3
> Installed-Size: 151
> Maintainer: Jérémy Bobbio <lunar@debian.org>
> Architecture: all
> Depends: adduser, exim4 | mail-transport-agent, ruby1.8, ruby-tmail, ruby-
> gpgme, ruby-magic, ruby-log4r, ruby-highline
> Description-en: GnuPG enabled mailing list manager with remailer-capabilities
> Schleuder is designed as a tool for group communication: subscribers
> can communicate encrypted (and pseudonymously) among themselves, receive
> emails from non-subscribers and send emails to non-subscribers via the list.
> .
> Schleuder takes care of all decryption and encryption, stripping of headers,
> formatting conversions, etc. Schleuder can also send out its own public key
> upon request and process administrative commands by email.
> Description-md5: 8480ae94adbe3ab75bd3e05d12375f2a
> Homepage: http://schleuder.nadir.org/
> Tag: implemented-in::ruby, interface::daemon, mail::list, mail::smtp,
> network::server, protocol::smtp, role::program, scope::application,
> security::authentication, security::cryptography, security::privacy,
> works-with::mail

I think this comes down to individuals. Just one man who writes a good patch to support more privacy. Then its about community to evaluate if it is a good or the best solution. If it gets wide enough exceptance it might probably in some face end up in standard. The time will tell. 

-- 
-Matti
