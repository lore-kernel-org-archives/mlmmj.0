From: Piotr Auksztulewicz <mlmmj-listrcpt@hasiok.net>
Date: Thu, 20 Mar 2014 18:42:35 +0000
Subject: Re: [mlmmj] Encrypted list
Message-Id: <20140320184234.GG23804@szaflik.hasiok.net>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wed, Mar 19, 2014 at 11:42:30PM +0200, Matti Nykyri wrote:
> Actually implementing an encrypting mailing list would be quite
> an interesting challenge. The list would store public keys of
> the subscribers and post to the list would be encrypted with the
> list's key. The mails to the subscribers would be each encrypted
> with their own public keys. Security should never be underestimated.

That's an interesting idea, but I have several points why it is
not particularly useful - and it may be the reason it haven't got
implemented in any list server software I know.

First of all, using cryptography properly is hard. Very few poeple
know how to do it securely and many would not be convinced to learn
it or willing to jump the hoops. So the feature would be not for
the run-of-the-mill lists but rather for the rare case of a list for
really tech-savvy people that are crypto geeks.

However, crypto geeks will recognise weaknesses of such a setup.

What features can cryptography give you? Confidentiality, authenticity,
integrity, privacy (if applied properly of course).

Let's talk about confidentiality first.

One problem is such a setup has a single point of failure. While
the messages' contents will be protected in transit, they have to be
decrypted on the server and encrypted again. Compromising the server
breaks the confidentiality completely. Subscribers would have to
trust the server's owner integrity and competence.

Using complex cryptoghraphy like multiple-key encryption is
still harder and every subscriber would have to update the list of
recipients' keys to be able to encrypt the message for all of them to
be able to decrypt. In such case there's little advatange of having
a server, one may just put all of the addresses in the To: field.

Confidentiality depends on all subscribers being able to keep the
secret. One incompenent subscriber breaks it. The list would have
to be closed of course - but there would also be a need to vet all
new subscribers somehow. Subscription moderation may help only a
little and everybody needs to trust the moderators' decisions.

Finally, the confidentiality will apply to messages' contents only -
metadata is sent in the clear. You can infer a lot from metadata.
If the subject of communication is sensitive enough, regular email
is of no use, encrypted or not.

Therefore, semi-confidentiality of a regular closed list is not much
worse than re-encrypting list. To get in-transit confidentiality
it will be much simpler just to configure the server to use and
accept only STARTTLS SMTP sessions. Very few servers don't offer the
functionality today - and most will use it when available. From my
experience, non-TLS session on a TLS-advertising server is an almost
sure indication of spam.

Authenticity & integrity (that the message comes from the person
claiming to be its author and has not been modified in transit) can
be easy obtained by cryptographically signing a cleartext message.
This is fully optional and compatible with existing mailing lists.

Next, privacy. I define privacy in the communication context as
confidentiality of the fact of communication. That is, everybody may
know that for example the address joe@example.com belongs to Mr. Joe
Clever, and Mr. Clever sometimes sends greetings to friends or open
letters to the public, but when he wants to communicate privately
with someone, there's no way to tell from data transmission contents
and patterns that he has done so and when - but the recipient will
know that he got a message from Mr. Clever and not a random person.

Email gives next to no privacy, addresses are sent in the
clear. STARTTLS sessions mask the fact of communication somewhat,
specifically if both parties have large user bases, but again, such
parties have to be trusted not to leak the logs etc. Even then,
traffic analysis can reveal communication patterns.


All in all, there's too little assurance of confidentiality in
"encrypting list server" setup to be of serious use.

-- 
Piotr "Malgond" Auksztulewicz           firstname@lastname.net

