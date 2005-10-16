From: Joel Aelwyn <joel@lightbearer.com>
Date: Sun, 16 Oct 2005 23:35:05 +0000
Subject: Re: mlmmj Spanish translation
Message-Id: <4352E3A9.10205@lightbearer.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------enig3D7083729FDAD22008865D14"
List-Id: <mlmmj.mlmmj.org>
References: <8511b92f05090806466e1c973d@mail.gmail.com>
In-Reply-To: <8511b92f05090806466e1c973d@mail.gmail.com>
To: mlmmj@mlmmj.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig3D7083729FDAD22008865D14
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Marcelo E. Magall=C3=B3n wrote:
> On 10/11/05, Mads Martin Joergensen <mmj@mmj.dk> wrote:
>=20
>>* Marcelo E. Magall=C3=B3n <marcelo.magallon@gmail.com> [Oct 11. 2005 1=
5:49]:
>>
>>>>The Danish and German translations don't use UTF-8 encoding for the
>>>>extended ASCII characters, so I didn't either.
>>>
>>>That's wrong.
>>>
>>>mlmmj won't do anything with the text it reads from the files
>>>coding-wise, so it's certain that using UTF-8 characters without
>>>including *some* header to that effect will break a system somewhere.
>>
>>That's why they're not UTF-8?
>=20
>=20
> I meant any non-ASCII characters.  Enrique's files are ISO-8859-1 (or
> -15, whatever) and they will lead to the same kind of trouble.  You
> need a header that states that the body of the email is binary-encoded
> and that the charset is ISO-8859-1.  The files I sent initially did
> exactly this because you can't rely on the MTA to add such headers.

Oy. Yes. Please, please, PLEASE. This is the entire reason for the variou=
s=20
standards that got written. If it's not US-ASCII, then it needs a Content=
-Type=20
which declares a charset (and potentially the supporting pieces). That=20
includes UTF-8 (which I prefer, strongly, but even so it needs to be decl=
ared;=20
the RFCs are fairly clear about this one, folks - no declaration means=20
US-ASCII, any character with the eighth bit set pretty much has an undefi=
ned=20
behavior, IE, the mailer can do anything it wants - throw it away, try to=
=20
autoconvert it, rearrange it into poetry...)

The correct answer is to use the MIME standards. That's why they were wri=
tten.=20
I know some people on here seem to be allergic to MIME, but honestly, if =
you=20
are? Write in US-ASCII. That's the price of wanting to avoid the=20
oh-so-terrible extra bits. It'll compress better anyway if someone ever=20
archives it, too. :)

> More problematic is this:
>=20
>     Subject: =C3=93rdenes disponibles para $listaddr$
>=20
> because the encoding of the subject has to be embedded in the subject
> line itself ... which is exactly what the files I sent did and Enrique
> dutyfully broke.

See above. There are standards covering this quite well, already. They sh=
ould=20
be used.

> Marcelo
>=20
> PS: I do have objections to the "improved" translation, but the crux
> of the them lies in the differences between Spanish as spoken in Spain
> and Spanish as spoken in the rest of the world, so I'll just let that
> one slip by.  Just as an example, the proper English translation for
> the subject line I'm quoting is "Available orders for $listaddr$"
> instead of "Available commands for $listaddr$".

This would be why es_ES and es_MX (what I've usually seen used to cover m=
ost=20
of the variants spoken in the Americas, since there isn't a country code =
for=20
'North and South America'...) exist, yes? Much like, oh, en_US and en_GB =
(and=20
en_CA and en_AU, eh, mate?)

The things listed under 'en' or 'es' should be as absolutely neutral as=20
possible, which generally means it will sound 'stilted' or 'simplified' t=
o the=20
speakers of *all* dialects of the language. "Under the hood" or "under th=
e=20
bonnet" is really "in the engine compartment", "the boot" or "the trunk" =
is=20
"the (luggage|cargo) area" or possibly "the rear of the vehicle" (which i=
s not=20
a "car", "lorrey", "cab", or "auto", and probably shouldn't be an "automo=
bile"=20
though that's more acceptable). And unless you're in San Francisco, a=20
"trolley" is also to be avoided.

You'd never guess that I was born in Texas, grew up in Kansas, lived in N=
orth=20
Carolina and California, and have roomed with Brits, Canadians, and=20
Australians, now would you? :) Seriously, though. If it's es_ES, call it =
that.=20
If it's es_MX, call it that. The generic 'es' (or 'en') is just that -=20
generic. It will sound 'bad' because it strips out all possible dialect=20
nuances, and those arise entirely because they represent meaningful=20
distinctions in that dialect. "Orders", "commands", "instructions",=20
"directions", and "directives" all mean subtly different things just in e=
n_US=20
(and usually several *other* subtly different things in other en_* dialec=
ts).=20
And, oddly enough, the use of 'commands' is sufficiently traditional *in =
a=20
technical vocabulary* that it can potentially override the normal word=20
selection simply by weight of it's own subcultural traditions - so the be=
st=20
answer might well be to use a literal analog of 'commands' even though it=
=20
isn't as graceful or sensible as some other alternatives in some language=
s.=20
After all, there are (arguably) more graceful or sensible alternatives in=
 it's=20
origin tongue. :)
--=20
Joel Aelwyn <joel@lightbearer.com>


--------------enig3D7083729FDAD22008865D14
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (MingW32)

iD8DBQFDUuOwlZCPwGNtWe4RAk43AJ9F3V354Tcs4efWyAww1j0RunPU6wCglhOl
AxNpGW2rrlJ7DYtcwbWCrUA=
=3p4F
-----END PGP SIGNATURE-----

--------------enig3D7083729FDAD22008865D14--
