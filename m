From: Nudge <stappers@stappers.nl>
Date: Mon, 12 Oct 2020 05:12:45 +0000
Subject: Re: [mlmmj] Problems with spam filters
Message-Id: <20201012051245.uquc5fyafjzhfdea@gpm.stappers.nl>
List-Id: <mlmmj.mlmmj.org>
References: <640117cb-85da-7b62-6a6e-7066f6f3ec94@black-sheep-research.com>
In-Reply-To: <640117cb-85da-7b62-6a6e-7066f6f3ec94@black-sheep-research.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Sun, Oct 11, 2020 at 08:25:47PM +0100, Martin Brampton wrote:
> On 11/10/2020 15:55, Marcus MERIGHI wrote:
> > SPF does not go along too well with traditional mailing lists:
> > (thats why more and more mailing lists rewrite the From:)
> >=20
> > $ dig +short black-sheep-research.com mx
> > 100 mx.yorkshiremail.com.
> >=20
> > $ dig +short black-sheep-research.com txt
> > "v=3Dspf1 include:yorkshiremail.com ~all"
> >=20
> > $ dig +short yorkshiremail.com mx
> > 100 mx.yorkshiremail.com.
> >=20
> > $ dig +short mx.yorkshiremail.com
> > 164.90.179.118
> >=20
> > $ dig +short yorkshiremail.com txt
> > "v=3Dspf1 a ip4:79.79.41.36 ip4:164.90.179.118 include:spf.smtp2go.com =
include:servers.mcsv.net ?all"
> >=20
> > ... but I get your mail, via the mlmmj list from this IP:
> >=20
> > Received: from adhara.zumppe.net (adhara.zumppe.net [198.101.246.47])
> >=20
> > This is why my rspamd gives your mail 3 spammy points:
> >=20
> > R_DKIM_REJECT(1.00)[smtpcorp.com:s=A1-4,black-sheep-research.com:s=3Ds1=
51337];
> > DMARC_POLICY_REJECT(2.00)[black-sheep-research.com : No valid SPF,rejec=
t];
>=20
> Thanks. I don't understand why your rspamd says black-sheep-research.com =
has
> no valid SPF.
>=20
> Your "digs" show that it has an include for yorkshiremail.com, which in t=
urn
> specifies both my own mail server (mx.yorkshiremail.com) and smpt2go.com
> which is the mail relay that I use for general mail sending.
>=20
> Where is there an SPF problem?
>=20
> I don't either understand why your rspamd doesn't like the DKIM signature
> added by the mail relay (smtp2go.com) if that is what it is complaining
> about.

Acknowledge



