From: Matti Nykyri <Matti.Nykyri@iki.fi>
Date: Thu, 20 Mar 2014 21:34:34 +0000
Subject: Re: [mlmmj] Encrypted list
Message-Id: <20140320213434.GA734@lyseo.edu.ouka.fi>
List-Id: <mlmmj.mlmmj.org>
References: <20140320184234.GG23804@szaflik.hasiok.net>
In-Reply-To: <20140320184234.GG23804@szaflik.hasiok.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, Mar 20, 2014 at 07:42:35PM +0100, Piotr Auksztulewicz wrote:
> On Wed, Mar 19, 2014 at 11:42:30PM +0200, Matti Nykyri wrote:
> > Actually implementing an encrypting mailing list would be quite
> > an interesting challenge. The list would store public keys of
> > the subscribers and post to the list would be encrypted with the
> > list's key. The mails to the subscribers would be each encrypted
> > with their own public keys. Security should never be underestimated.
> 
> That's an interesting idea, but I have several points why it is
> not particularly useful - and it may be the reason it haven't got
> implemented in any list server software I know.

That is true. The only ones that I can think of being keen on security
and sending mails in the free internet are security administrators 
for example with gentoo and the Linux kernel. Security administrators 
send sensitive and time critical information about the found security
security holes of the system and they use encryption.

> First of all, using cryptography properly is hard. Very few poeple
> know how to do it securely and many would not be convinced to learn
> it or willing to jump the hoops. So the feature would be not for
> the run-of-the-mill lists but rather for the rare case of a list for
> really tech-savvy people that are crypto geeks.

I agree. Even professionals fail to use it the correct way at times.
Cryptography is not my home time but I've been visiting there for few
years now. It is a very interesting field of study. It is sad to see
how little people demand security and privacy todays. When people don't 
demand it corporations don't implement it... on the contrary they 
lessen your privacy by scanning your messages. Targeted advertising
and selling information. Not to mention the interests of intelligence
agencies.

> However, crypto geeks will recognise weaknesses of such a setup.
> 
> What features can cryptography give you? Confidentiality, authenticity,
> integrity, privacy (if applied properly of course).
> 
> Let's talk about confidentiality first.
> 
> One problem is such a setup has a single point of failure. While
> the messages' contents will be protected in transit, they have to be
> decrypted on the server and encrypted again. Compromising the server
> breaks the confidentiality completely. Subscribers would have to
> trust the server's owner integrity and competence.

By definition every message can be opened no matter how it is encrypted.
It is just a question of money and time. Is it easier to crack the 
server or open the message? In most cases I think it will be the server.
But the server can protected and controlled and a breach spotted. If a 
message that has been poorly encrypted it will be sneakyly read without
anyone knowing. 

> Using complex cryptoghraphy like multiple-key encryption is
> still harder and every subscriber would have to update the list of
> recipients' keys to be able to encrypt the message for all of them to
> be able to decrypt. In such case there's little advatange of having
> a server, one may just put all of the addresses in the To: field.

Only way to implement encrypted list is to let the list decrypt and then
reencrypt the messages. Otherwise the list needs to be implemented inside
the MUA. Still this makes things simpler because it is then only needed
for the list to have upto date keys of all the members. If MUA is doing
the work then every subscriber has to have all the correct keys of all
the subscribers!

> Confidentiality depends on all subscribers being able to keep the
> secret. One incompenent subscriber breaks it. The list would have
> to be closed of course - but there would also be a need to vet all
> new subscribers somehow. Subscription moderation may help only a
> little and everybody needs to trust the moderators' decisions.

If you think of security administrators jobs that is the way it goes:
The server is and needs to be secure, administrators are screened,
and then accepted to the group.

> Finally, the confidentiality will apply to messages' contents only -
> metadata is sent in the clear. You can infer a lot from metadata.
> If the subject of communication is sensitive enough, regular email
> is of no use, encrypted or not.

The only metadata available to Eve the Evesdropper is the sender and
the list name and the route between them. But Eve will not be aware of
the lists subscribers because when the list sends out the message each
is encrypted differently and the return path can be set to anything
(there is no way to decrypt the returned message anyways). The little
things that will be leaked are sending times, message sizes and 
recipients of the servers entire mail flow.

> Therefore, semi-confidentiality of a regular closed list is not much
> worse than re-encrypting list. To get in-transit confidentiality
> it will be much simpler just to configure the server to use and
> accept only STARTTLS SMTP sessions. Very few servers don't offer the
> functionality today - and most will use it when available. From my
> experience, non-TLS session on a TLS-advertising server is an almost
> sure indication of spam.

I think there is a difference between the re-ecrypted and TLS protected
messages. ISP's and anyone between the route is able to record messages
and sell the content. That is what most of the companies do nowadays.
Nobody would setup an encrypting mailing list to a server they don't
trust.

> Authenticity & integrity (that the message comes from the person
> claiming to be its author and has not been modified in transit) can
> be easy obtained by cryptographically signing a cleartext message.
> This is fully optional and compatible with existing mailing lists.
> 
> Next, privacy. I define privacy in the communication context as
> confidentiality of the fact of communication. That is, everybody may
> know that for example the address joe@example.com belongs to Mr. Joe
> Clever, and Mr. Clever sometimes sends greetings to friends or open
> letters to the public, but when he wants to communicate privately
> with someone, there's no way to tell from data transmission contents
> and patterns that he has done so and when - but the recipient will
> know that he got a message from Mr. Clever and not a random person.

If mail servers would not record the route and the return path the
message would be anonymous and private as it is with old fasion 
letters. Hiding your true communication can be done by increasing
random traffic. If your want anonymity you will need a software
especially designed for that... for example TOR.

> Email gives next to no privacy, addresses are sent in the
> clear. STARTTLS sessions mask the fact of communication somewhat,
> specifically if both parties have large user bases, but again, such
> parties have to be trusted not to leak the logs etc. Even then,
> traffic analysis can reveal communication patterns.

Everything depends on your opponent. His skills and resources.

> All in all, there's too little assurance of confidentiality in
> "encrypting list server" setup to be of serious use.

I know.. It was just more of an interesting idea that came into my
mind while thinking of another topic. But I think that when cryptography
comes closer to normal people the situation will be different. I say
that it is about companies who make cell phones to start offering
the applications and options to people. Cloud computing can be made
private if it is encrypted and the keys are kept only with the client.
All MUA's can be made aware of encryption technology and public key
infrastructure. Today when your fingerprints are automatically loaded
to some company's server it hard to talk about privacy. A little more
of encryption would not hurt.

-- 
-Matti

Ps. Sorry for the even longer message

Pps. Could the administrator of this list add Reply-To custom header
to the list. The current phones don't know how to reply to a list by
default :/ At least Apple wants to send mail to the sender not to the 
list

