From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Fri, 21 Mar 2014 20:09:28 +0000
Subject: Re: [mlmmj] Encrypted list
Message-Id: <2098232.X7lJFMPTSo@trelane>
List-Id: <mlmmj.mlmmj.org>
References: <20140320184234.GG23804@szaflik.hasiok.net>
In-Reply-To: <20140320184234.GG23804@szaflik.hasiok.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Friday, March 21, 2014 17:48:48 Matti Nykyri wrote:
> On Mar 21, 2014, at 1:31, Chris Knadle <Chris.Knadle@coredump.us> wrote:
[...]
> > Although technically possible to do, there are two snags.
> >=20
> > 1.  The GPG interface sucks.  I could rant about a long list of issues
> > here,>=20
> >    but suffice it to say that it's difficult to learn how to use it, how
> >    to
> >    get your favorite mail client integrated with it, how to configure G=
PG
> >    for setting the "default-preference-list" and "cert-digest-algo" ...
> >    etc.
> >    It represents a significant technical education problem.
>=20
> Yes that is true. But what it means is that the worl is not ready yet!
> Users don't pursue privacy... Is it gonna change in future? There are
> many> intances that want to prevent this.
>=20
> And if you you just look at gpg it really lags quite much compared to the
> high end of the game. Openssl is far more advanced but the user interface
> is light years behind gpg's :/ But in general the world of email would not
> hurt from a little more of privacy!

I'm in total in agreement on that latter part.

> > 2.  GPG can only encrypt the body of the message, and that doesn't cover
> > any>=20
> >    of the headers of the message, so the Subject, who the message is Fr=
om
> >    and To, the route it took -- etc -- cannot be protected by GPG.  And
> >    one of the things we've learned from the Edward Snowden NSA revelati=
ons
> >    is that "metadata" itself is incredibly revealing.
>=20
> Well standards don't support it (wonder why) but actually encrypting the
> entire data section of smtp should not prevent the mail from being
> delivered. I have not tested though. In my belief the mail is transported
> solely on rcpt and mail commands.

Eh, er, sort of.  In terms of the MTA transfer the mail could be routed eve=
n=20
if the DATA portion of the SMTP session was fully encrypted, but then you'd=
=20
end up with an additional Received: header from "the current hop" added=20
directly on top of encrypted data where the rest of the headers were (and=20
perhaps several layers of this happening.)  This would hide the source IP o=
f=20
the originating message and the Subject, but it wouldn't hide the sender's =

address, receiver's, or the two MTAs.

However things would go wrong on the side of the MUA (i.e. mail client)=20
because the email the user would get wouldn't have a From:, To:, Subject:, =
or=20
Date:, because all that would be encrypted, so instead the MUA would simply=
=20
show a list with an email showing empty data for those fields.  And an unkn=
own=20
number of decryption steps to get to the headers.  Ick.

So encrypting the entire DATA section would only require changing the SMTP =

protocol for both MTAs and MUAs.  :-/

> > [...]
> >=20
> >>> Therefore, semi-confidentiality of a regular closed list is not much
> >>> worse than re-encrypting list. To get in-transit confidentiality
> >>> it will be much simpler just to configure the server to use and
> >>> accept only STARTTLS SMTP sessions. Very few servers don't offer the
> >>> functionality today - and most will use it when available. From my
> >>> experience, non-TLS session on a TLS-advertising server is an almost
> >>> sure indication of spam.
> >>=20
> >> I think there is a difference between the re-ecrypted and TLS protected
> >> messages. ISP's and anyone between the route is able to record messages
> >> and sell the content. That is what most of the companies do nowadays.
> >> Nobody would setup an encrypting mailing list to a server they don't
> >> trust.
> >=20
> > I agree with Piotr: TLS is a /requirement/ for any "secure" mailing lis=
t,
> > because TLS encryption starts at the connection with the MTA and theref=
ore
> > covers all of the headers as well as the body of the message.  The
> > wonderful thing about TLS in SMTP is that if it were /mandated/ for all
> > MTA transfers of a "secure" mailing list, the users don't have to do
> > anything -- no GPG required, no key signatures, passwords -- nothing
> > --from the user side it's dead simple.
> >=20
> > And thankfully I see the same thing Piotr does: TLS SMTP transfers are =
now
> > quite commonr.  There are unfortunately exceptions, so it's not quite
> > ubiquitous yet -- I'm looking forward to the day when it is.
>=20
> That depends entirely on your adversary! If you want privacy from big
> companies or intelligence agencies TLS does not offer you anything! It
> can't secure your connection to your bank nor to a mailing list! Any
> intance who has access to a root certificate can claim to be anybody.
>
> The problem does not lie within encryption. As you might have learned from
> Snowden but it lies within authetication. Also it lies within key exhange
> and key creation. This is a crucial part in securing your connection!

I agree that we'd /want/ this -- but how would you accomplish this without
CA-signed TLS certificates?  The whole CA system is screwed up and makes=20
things more difficult.

The DANE protocol requires DNSSEC and very few sites/MTAs are using it=20
(supposedly only about 20 so far from last I heard), and not all MTAs have =
the=20
feature yet -- Postfix does but Exim doesn't yet -- the Exim developers are=
=20
looking into it though.  But even with DANE, it's a LOT to expect for a sit=
e=20
to run DNSSEC, especially being that not all DNS servers support it.

So for now I think the best we can do is use /unauthenticated/ TLS --=20
purposefully -- so that at least the MTA transfers will be encrypted, even =

though they're not authenticated.

> Hopefully people will realice this some day. The main issue is in
> authentication. It is truely hard to be one 100% certain that someone is
> who he claims to be. The web-of-trust gives another and I would say a
> better approach to the chain-of-trust that has been the dominating way to
> do thigs.

The web-of-trust method is good for microcosms (such as the group of Debian=
=20
developers) but as a worldwide solution I think it's too easily manipulated.

> > But if you say set up a separate copy of an MTA on a dedicated IP where
> > the
> > MTA /mandates/ TLS transfers, that in itself should cover most of what
> > you'd need to allow running a "secure" mailing list with MLMMJ.
> >=20
> > At least ... almost this is where I currently have an issue with MLMMJ:
> > because I did this sort of "dual IP" setup (without mandating TLS
> > transfers), but MLMMJ currently doesn't have a facility to specify which
> > source IP to send email from, which makes the headers of the resulting
> > email "look wrong" because it's sourced from the wrong IP.  To fix that
> > in Exim4 I ended up having to make a "hack" whereby the
> > "received_header_text" is set
> > conditionally to remove the appearance of the "local MTA1" -> "local MT=
A2"
> > transfer.
> >=20
> > Creating the "source-IP" tunable is the facility I've been considering
> > working on.
>=20
> Using open source software and encrypting your emails is the only way have
> some privacy today. Who wants see Google read their emails? The only way
> for an mailing list to exist in an encrypting environment is that it
> re-encrypts everything. Do i require shuts privacy? No. But yes I would u=
se
> it if it were available and could be easily implemented.

Okay, I see what you mean.

There is another downside to GPG-encrypted email though; you can't search=20
through it easily for past content you're looking for.  [Well, you can, but=
 it=20
takes significant effort.]

However if you're looking for a Mailing List Manager that uses GPG, I belie=
ve=20
the 'schleuder' package can do that (it's one of the MLMs I looked at befor=
e=20
deciding to go with MLMMJ):

---------------------------------------------------------------------
$ apt-cache show schleuder

Package: schleuder
Version: 2.2.1-3
Installed-Size: 151
Maintainer: J=E9r=E9my Bobbio <lunar@debian.org>
Architecture: all
Depends: adduser, exim4 | mail-transport-agent, ruby1.8, ruby-tmail, ruby-
gpgme, ruby-magic, ruby-log4r, ruby-highline
Description-en: GnuPG enabled mailing list manager with remailer-capabiliti=
es
 Schleuder is designed as a tool for group communication: subscribers
 can communicate encrypted (and pseudonymously) among themselves, receive
 emails from non-subscribers and send emails to non-subscribers via the lis=
t.
 .
 Schleuder takes care of all decryption and encryption, stripping of header=
s,
 formatting conversions, etc. Schleuder can also send out its own public key
 upon request and process administrative commands by email.
Description-md5: 8480ae94adbe3ab75bd3e05d12375f2a
Homepage: http://schleuder.nadir.org/
Tag: implemented-in::ruby, interface::daemon, mail::list, mail::smtp,
 network::server, protocol::smtp, role::program, scope::application,
 security::authentication, security::cryptography, security::privacy,
 works-with::mail
---------------------------------------------------------------------



  -- Chris

--
Chris Knadle
Chris.Knadle@coredump.us

