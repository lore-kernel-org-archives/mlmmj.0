From: "Morten K. Poulsen" <mopo@fabletech.com>
Date: Tue, 07 Jul 2009 18:50:43 +0000
Subject: Re: moderation only by sender
Message-Id: <1246992643.4080.39.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <5e77c93d0907031333q4cba6335ib8f8622a40518edf@mail.gmail.com>
In-Reply-To: <5e77c93d0907031333q4cba6335ib8f8622a40518edf@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Tue, 2009-07-07 at 20:19 +0200, Mads Martin Joergensen wrote:
> On 03/07/2009, at 23.29, Mads Martin J=C3=B8rgensen wrote:
> http://mmj.dk/~mmj/ifmodsendonlymodmoderate.diff
>=20
> It's totally untested and needs someone to try it out, look at it, =20
> etc. Yes, yes, I'm damn lazy, but this is a team effort, you know :)
>=20
> (What the above really means is: Moooorteeeen. Would you pretty please =20
> with sugar on top, tell me what I forgot?

From the patch:
+	tmp =3D concatstr(2, efromsender, "\n");
+	if(ifmodsendonlymodmoderate && strcasestr(moderators, tmp)) {

This substring matching will fail in some corner cases, like me being a
moderator with mortenp+mlmmj@mmj.dk and you sending a mail from
mmj@mmj.dk.

Also, your patch only changes the text in the moderation mail, not the
actual dissemination, which is done in mlmmj-send.c:

        case '2': /* Moderators */
                subfilename =3D concatstr(2, listdir,
"/control/moderators");

> You know I cannot code anymore...)

I hope you like being a manager ;-)


Morten

--=20
Morten K. Poulsen <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/



