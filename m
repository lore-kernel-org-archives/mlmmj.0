From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 14 Sep 2006 18:18:31 +0000
Subject: Re: submod tunable not working for me.. ?
Message-Id: <20060914181830.GG2175@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <D47D1D36-3230-4FA0-B78E-8A7227FFD553@gmail.com>
In-Reply-To: <D47D1D36-3230-4FA0-B78E-8A7227FFD553@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Nate,

Thanks for catching this before 1.2.12 final!

* Nate Beaty <natebeaty@gmail.com> [Sep 14. 2006 19:28]:
> On Sep 14, 2006, at 2:20 AM, Mads Martin Joergensen wrote:
>=20
> >This has nothing to do with subscriber moderation, since it's a
> >confirmation of subscription issue.
>=20
> I would agree except when I remove the submod tunable from control/, =20
> there is no Mail Delivery failure, and the user is able to confirm =20
> their subscription just fine.

Hu, that does indeed sound weird.

> >Subscriber moderation code doesn't kick in before after the subscriber
> >have acknowledged it's his/hers emailaddress.
>=20
> Well it seems mlmmj is getting the confirmation email, as it shows in =20
> Exim's log and the file is removed from subconf/ and a file is =20
> created in moderation/.
>=20
> What is supposed to happen at that point? The email listed in submod =20
> (or owner if it's empty) gets a confirmation email much like the =20
> user's? And then the file disappears from moderation/ and the email =20
> is moved to subscribers.d/, correct?
>=20
> >What mailserver etc.? Did previous mlmmj versions work?
>=20
> Sorry, I meant to include that in my first email. I'm on an up-to-=20
> date Ubuntu Dapper box with Exim 4.60. I have been happily using =20
> mlmmj 1.2.11 for quite a few months now with announce-only lists. =20
> This is the first discussion list I've set up, and the owner asked =20
> for subscription moderation. I had previously been using the debian-=20
> packaged mlmmj, but compiled 1.2.12 for the submod capability.
>=20
> My control/ dir:
>=20
> > /var/spool/mlmmj/comix/control$ la
> -rw-r--r-- 1 Debian-exim Debian-exim   7 2006-08-25 19:01 bouncelife
> -rw-r--r-- 1 Debian-exim Debian-exim 323 2006-08-25 19:02 customheaders
> -rw-r--r-- 1 Debian-exim Debian-exim 127 2006-08-25 19:01 footer
> -rw-r--r-- 1 Debian-exim Debian-exim  23 2006-08-25 19:01 listaddress
> -rw-r--r-- 1 Debian-exim Debian-exim  16 2006-09-13 23:18 moderators
> -rw-r--r-- 1 Debian-exim Debian-exim  16 2006-09-13 23:37 owner
> -rw-r--r-- 1 Debian-exim Debian-exim  12 2006-08-25 19:02 prefix
> -rw-r--r-- 1 Debian-exim Debian-exim  16 2006-09-13 23:24 submod
> -rw-r--r-- 1 Debian-exim Debian-exim   0 2006-08-25 19:01 subonlypost
> -rw-r--r-- 1 Debian-exim Debian-exim   0 2006-08-25 19:01 verp
> > /var/spool/mlmmj/comix/control$ more submod
> nate@clixel.com
>=20
> When I send a message to comix+subscribe@lists.clixel.com, I see in =20
> subconf/
>=20
> > /var/spool/mlmmj/comix$ la subconf
> -rw------- 1 Debian-exim Debian-exim 19 2006-09-14 09:59 =20
> c033b9b4a8ac676-natebeaty=3Dgmail.com
>=20
> I reply to the confirmation email, and this shows in moderation/
>=20
> > /var/spool/mlmmj/comix$ la moderation/
> -rw------- 1 Debian-exim Debian-exim 31 2006-09-14 09:59 =20
> subscribe5cda896c3c73687f
>=20
> This is from my Exim mainlog:
>=20
> 2006-09-14 09:59:56 1GNuZ9-0005pg-US SA: Debug: SAEximRunCond expand =20
> returned: '1'
> 2006-09-14 09:59:56 1GNuZ9-0005pg-US SA: Debug: check succeeded, =20
> running spamc
> 2006-09-14 09:59:57 1GNuZ9-0005pg-US SA: Action: scanned but message =20
> isn't spam: score=3D-2.1 required=3D5.0 (scanned in 1/1 secs | Message-=20
> Id: 5792A5BF-5E42-4065-9E0A-7FEA4E108E24@gmail.com). From =20
> <natebeaty@gmail.com> (host=3Dnz-out-0102.google.com [64.233.162.204]) =20
> for comix+confsub-c033b9b4a8ac676-natebeaty=3Dgmail.com@lists.clixel.com
> 2006-09-14 09:59:57 1GNuZ9-0005pg-US <=3D natebeaty@gmail.com H=3Dnz-=20
> out-0102.google.com [64.233.162.204] P=3Desmtp S'64 =20
> idW92A5BF-5E42-4065-9E0A-7FEA4E108E24@gmail.com
> 2006-09-14 09:59:57 1GNuZ9-0005pg-US ** comix@lists.clixel.com <comix=20
> +confsub-c033b9b4a8ac676-natebeaty=3Dgmail.com@lists.clixel.com> =20
> R=3Dmlmmj_router T=3Dmlmmj_transport: Child process of mlmmj_transport =20
> transport returned 1 from command: /usr/bin/mlmmj-recieve
> 2006-09-14 09:59:57 1GNuZB-0005po-9J SA: Debug: SAEximRunCond expand =20
> returned: '0'
> 2006-09-14 09:59:57 1GNuZB-0005po-9J SA: Action: Not running SA =20
> because SAEximRunCond expanded to false (Message-Id: =20
> 1GNuZB-0005po-9J). From <> (local) for natebeaty@gmail.com
> 2006-09-14 09:59:57 1GNuZB-0005po-9J <=3D <> R=3D1GNuZ9-0005pg-US =20
> U=DEbian-exim P=3Dlocal S807
> 2006-09-14 09:59:57 1GNuZ9-0005pg-US Completed
> 2006-09-14 09:59:58 1GNuZB-0005po-9J =3D> natebeaty@gmail.com =20
> R=3Ddnslookup T=3Dremote_smtp H=3Dgmail-smtp-in.l.google.com [72.14.205.2=
7]
> 2006-09-14 09:59:58 1GNuZB-0005po-9J Completed
>=20
> I'm guessing this is important: "Child process of mlmmj_transport =20
> transport returned 1 from command: /usr/bin/mlmmj-recieve" since I =20
> don't see it for confirmation on my other lists...

Hmmm, I wonder why it would return 1 and not report anything in the
logs... weird indeed.

It's the exact same with an empty submod file, but something in owner
instead?

--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
