From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 01 Feb 2005 18:51:38 +0000
Subject: Re: Feature Request / I'm missing something: reply2list?
Message-Id: <20050201185138.GK88505@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <1107280898.7622.111.camel@localhost.localdomain>
In-Reply-To: <1107280898.7622.111.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

* Mike Grice <Mike@MikeGrice.com> [Feb 01. 2005 19:01]:
> Hi all,
>=20
> I'm finding my feet with mlmmj, but I've just got a couple of questions:
>=20
> 1) Is there a tunable (or could one be added) where I can set the reply
> address of posts coming through the list to be the list address:  e.g.,
> for a list of foo@bar.com, can the reply-to: / from: address be set to
> foo@bar.com as opposed to the person who sent the message?

As said in TUNABLES:

   =B7 customheaders                (list)

   These headers are added to every mail coming through. This is the
   place you want to add Reply-To: header in case you want such.

So adding a line in control/customheaders saying:

   Reply-To: foo@bar.com

Will get you what you want.

> 2) If I have an account where I have multiple domains pointing to my
> email box, is there a way for mlmmj to recognise these?  e.g., the To:
> address could be "foo@bar.com" or "foo@baz.com", given that both domains
> are pointing to my same account?  I know I can set 'tocc' to make this
> work, but again this will open up the chance of BCC: style abuse.

Not yet possible. But it's doable. Any objections from people on the
list against having DIR/control/alternates with other list
emailaddresses? If not, I'll add it in an upcoming release.

--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
