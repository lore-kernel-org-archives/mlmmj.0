From: Piotr Auksztulewicz <mlmmj-listrcpt@hasiok.net>
Date: Mon, 24 Mar 2014 16:49:12 +0000
Subject: Re: [mlmmj] Encrypted list
Message-Id: <20140324164912.GA5777@szaflik.hasiok.net>
List-Id: <mlmmj.mlmmj.org>
References: <20140320184234.GG23804@szaflik.hasiok.net>
In-Reply-To: <20140320184234.GG23804@szaflik.hasiok.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, Mar 20, 2014 at 11:34:34PM +0200, Matti Nykyri wrote:
> The only ones that I can think of being keen on security
> and sending mails in the free internet are security administrators 
> for example with gentoo and the Linux kernel. Security administrators 
> send sensitive and time critical information about the found security
> security holes of the system and they use encryption.

This is indeed a rare case of communication that's only mildly sensitive
for a limited time, and also of a close-knitted group of people that may
have some benefit such re-encrypting list. I still think such list isn't
usable for serious matters, while a regular closed list is private
enough for non-sensitive matters.

Most of the lists out there are "hey, let's make a list for people
interested in X" and anybody can join. This is not secure and only
a little more private than a web forum or something.

> It is sad to see how little people demand security and privacy todays.
> When people don't demand it corporations don't implement it... on the
> contrary they lessen your privacy by scanning your messages.

This is also why email privacy is dead and buried. Even if I started
using GPG now (actually, I have stopped long ago), as long as most of my
correspondents flock to gmail and the like, either I can't use it with
them, because they won't let go their shiny webmail interface and go
back to Thunderbird or whatever, or I am at mercy of future gmail's
features. I can easily imagine them offering support for encrypted mail
by allowing to deposit one's private key with them, and many users
blindly doing just that.

Basically, email providers can't be trusted AND email users can't be
trusted in majority.

Myself, I know only a handful of poeple that I can trust to hold their
mailbox secure... and even with them I don't use encrypted email just
because I don't have anything so sensitive to say, so it will be just
a hassle or a moslty pointless excercise of GPG skills.

For an email list, you can't trust anybody, unless you ultimately trust
the owner and his methods of vetting subscribers. Kernel developers may
be able to do that.

Myself, I am treating email as a postcard. Anybody in the post office
can read it, secret agencies will scan and store it, kids in the
neighbourhood can open the mailbox and steal or read the contents,
addressee will put it in the trash for dumpster-divers to have. On the
other hand, a random person would not snatch it in transit, or read
the contents without considerable efforts, so it provides a little bit
of privacy. So it is fine to send vacation postcards to your relatives,
while it is not wise to post a billboard saying that (think burglars).

> Is it easier to crack the server or open the message? In most cases I
> think it will be the server.

True. Bruce Schneier says "math is good". It is the application of it,
or human shortcomings, that allow the secrets to be revealed.

> Only way to implement encrypted list is to let the list decrypt and then
> reencrypt the messages. Otherwise the list needs to be implemented inside
> the MUA.

My disgression was about omitting the re-encrypting by encrypting at the
sender with multiple keys. But it requires support in the MUA, or some
clever script/plugin, yes. The server would re-mail as usual. But you
need to keep all the keys. Maybe the server could help by attaching
all keys to each email, or sending them on request. Such setup will
circumvent the issue of server security and the trust of the owner;
but you still need to trust all subscribers not to leak the message,
intentionally or not. Kernel developers, again.

> The only metadata available to Eve the Evesdropper is the sender and
> the list name and the route between them.

GPG and no TLS would get Eve sitting on the wire near the server all
subscribers' addresses, routing information, subject, date, MUAs used
etc. etc. - from the headers.

TLS would get such Eve only the originating (or intermediate) and target
MTAs. This may be sufficient to identify single subscribers (myself, for
example - I run my own server).

Attacking TLS is not so easy, but doable. If you think CA subversion -
that's not needed in case of email. Most sending MTAs will accept any
certificate, or go without TLS if not offerred. You need to do some kind
of traffic hijacking (DNS poisoning? BGP false advertisement?) to get
the TCP stream, then you can pretend to be any MTA you want, TLS or no
TLS, get the headers and content, then re-send to the proper MTA. So a
determined attacker can get any SMTP metadata almost without notice.
Almost, because in case of hijacking the resent message will come from a
different IP address than normal - unless you hijack the reverse path as
well. Receiving MTA will likely accept that, unless there's a strong SPF
policy or two-way DNS check policy in place, which is rare. Only a human
checking the Received: headers could notice something strange.

> I think there is a difference between the re-ecrypted and TLS protected
> messages. ISP's and anyone between the route is able to record messages
> and sell the content. That is what most of the companies do nowadays.

It is a difference, but from my point of view it is not particularly
significant. Both protect the message contents from a causal sniffer on
the wire, TLS protects headers, too. I have not heard of any intermediate
MTA that will mine the messages' contents (not counting virus/spam
scanning). It is true, that many email account providers mine the emails
for commercial purposes, but users of such services would be either
unable/unwilling to use encrypted email (because they would loose the
universal and convenient access to their mails from every web browser
or phone app out there), or aware enough not to use them.

Today there aren't many MTA hops in email transmissions, not counting
technical ones, like one MTA instance sending to the virus scanner,
then to another MTA instance sending it out - all within the same
network/organisation. Then there's a direct hop to the recipient.
Only spammers use the higher-order MX records :-)

This is why I insist that enforcing TLS (and banning gmail users :-P)
would be sufficient privacy for a listserver.

> If mail servers would not record the route and the return path the
> message would be anonymous and private as it is with old fasion 
> letters.

Not with the SMTP protocol. Sender and recipient are there, so not
anonymous, and not private in the sense that the fact of communication
is hidden. TLS helps a little. GPG adds confidentiality of contents
only. Snail mail is a little better at privacy (metadata is not so
easy to obtain) and worse at confidentiality - an envelope is not
very secure, and even if there are methods of increasing physical
security in order to enhance confidentiality, encryption is still much,
much  better.

> Hiding your true communication can be done by increasing
> random traffic. If your want anonymity you will need a software
> especially designed for that... for example TOR.

This is what I was hinting at. Use the right tools. Email list
is not one.

> But I think that when cryptography
> comes closer to normal people the situation will be different.

It is a hard problem - how to make cryptography both secure and easy
to use.

> Cloud computing can be made
> private if it is encrypted and the keys are kept only with the client.

If you mean cloud storage, yes - and ONLY storage at this point. There
are some precursors already, the new MEGA promises exactly that -
client-side encryption. How easy to use it will be, and how hard to
circumvent - time will tell. Myself, I won't trust server-pushed
Javascript encryption software - even if MEGA's use of crypto is sound
and key management is more or less secure.

I use GPG before uploading my backups and stuff to S3.

But "cloud" is more than that. Indexing your email for search, sorting,
thumbnailing, cropping of your photos, recommending music based on what
you've listened to before, etc. etc. - all require server-side
processing of your unencrypted data and therefore are susceptible to
data mining. People are used to that and won't let such features go.
Homomorphic encryption is in statu nascendi and will be there for many
years yet - and if it ever gets strong enough it would be most likely
very CPU-intensive (and thus expensive!) to process any data in
encrypted form. People want "free" and easy-to-use stuff. This is it.

> A little more of encryption would not hurt.

Sometimes it will - if it creates a false sense of security.


PS. I apologize non-crypto-geeks on the list for the long rant :-)

PPS. I like this list to go live - even if slighlty off-topic.

-- 
Piotr "Malgond" Auksztulewicz                     firstname@lastname.net

