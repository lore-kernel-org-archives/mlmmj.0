From: martin f krafft <madduck@madduck.net>
Date: Mon, 20 Sep 2004 19:19:44 +0000
Subject: feature requests
Message-Id: <20040920191944.GA5112@cirrus.madduck.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="zhXaljGHf11kAtnf"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I am seeing your new mailing list manager and I am all excited
because I like ezmlm, want something not as bloated as mailman, and
given that mlmmj is still young, I hope I can contribute to get
important features in.

One such feature is the ability to add and remove mailing lists
without the need to edit /etc/aliases. The best way to do this would
be to provide transport/directors that take messages at stdin and
handle them accordingly. Then I could set, e.g. postfix to have
lists.my.domain use the mlmmj transport, which would be this script.

The next feature that I think is paramount is the ability to add
aliases to an account, like majordomo2. With subscriber-only lists,
it is a pain to be restricted to a single address for posting.
mailman "solves" this by allowing subscriptions to be NOMAIL. this
is also painful. majordomo2 is nice. you subscribe, then register
a bunch of aliases with your address, which can also post.

The last feature was sent to Mads privately. Here is is for
completeness. Not sure whether this can be done, or should rather be
done in a separate programme. But I think it's a cool idea (it's
mine...) ;^>

Here it is:

> Also, please make sure you implement a nice moderation interface
> as it's the only thing that mailman is lacking, really. i suggest
> an IMAP server with subfolders for accept, reject, discard. then
> you simply move messages in the queue accordingly. Only remaining
> problem: locking for multiple moderators, and the possibility to
> undo, or to do batched commits.

For your information, I am a mailing list administrator with quite
some experience in majordomo, ezmlm, and mailman, even with sympa...
I use mailman and I hate it. All the others are worse though. ezmlm
mainly because of its licence.

I am particularly looking for a special mailing list manager to
handle:

  http://marc.theaimsgroup.com/?l=3Dmailman-users&m=3D109508403307185&w=3D2

Maybe mlmmj can be made flexible enough from the start to be able to
support this.

Cheers,

--=20
martin;              (greetings from the heart of the sun.)
  \____ echo mailto: !#^."<*>"|tr "<*> mailto:" net@madduck
=20
invalid/expired pgp subkeys? use subkeys.pgp.net as keyserver!
spamtraps: madduck.bogus@madduck.net
=20
the only difference between a car salesman and a computer salesman
is that the car salesman knows he's lying.

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBTy1QIgvIgzMMSnURAlZIAJ41GQB77xSB477h1wq2KIkAwY9JhwCghtfm
mXF6GNP++0dYqXn5NaIcB2c=
=wgeA
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
