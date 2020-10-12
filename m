From: Marcus MERIGHI <mcmer-mlmmj@tor.at>
Date: Mon, 12 Oct 2020 06:55:42 +0000
Subject: Re: [mlmmj] Problems with spam filters
Message-Id: <20201012065542.GK76113@tor.at>
List-Id: <mlmmj.mlmmj.org>
References: <640117cb-85da-7b62-6a6e-7066f6f3ec94@black-sheep-research.com>
In-Reply-To: <640117cb-85da-7b62-6a6e-7066f6f3ec94@black-sheep-research.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

martin@black-sheep-research.com (Martin Brampton), 2020.10.11 (Sun) 21:25 (=
CEST):
> Thanks. I don't understand why your rspamd says black-sheep-research.com =
has
> no valid SPF.

Because the IP of the sending server (mlmmj list server at
198.101.246.47) is not in the SPF-published "allowed sender" IP list:

$ echo black-sheep-research.com | smtpctl spf walk
79.79.41.36
164.90.179.118
45.55.101.18
205.201.128.0/20
198.2.128.0/18
148.105.8.0/21
207.58.142.208/29
207.58.147.64/28
216.22.15.224/27
43.228.184.0/22
103.47.204.0/22
103.36.108.0/22
103.2.140.0/22
203.31.36.0/22
66.128.144.88/29
198.74.56.28

(smtpctl ist a tool on OpenBSD)

Marcus
=20
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
>=20
>=20
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

