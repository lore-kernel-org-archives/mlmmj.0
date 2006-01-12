From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 12 Jan 2006 10:08:49 +0000
Subject: Re: Is anyone using mlmmj with qmail?
Message-Id: <20060112100849.GB92183@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601112014230.3643@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601112014230.3643@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

* Charlie Brady <charlieb@budge.apana.org.au> [Jan 12. 2006 02:18]:
>=20
> I'm surprised by this step in the install instructions:
>=20
>  1) Make sure your mailserver accepts '+' as a recipient delimiter.
>=20
> It would seem to me that mlmmj is not "mail server independent" if it=20
> can't be used with an unmodified qmail installation.

That's actually wrong these days. mlmmj has configurable recipient
delimiter. I'll fix the README, thanks.

Quote from TUNABLES:

 =B7 delimiter                    (normal)

   This specifies what to use as recipient delimiter for the list.
   Default is "+".

--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
