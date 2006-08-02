From: =?iso-8859-1?Q?S=F8ren?= Boll Overgaard <boll+mlmmj@fork.dk>
Date: Wed, 02 Aug 2006 09:15:27 +0000
Subject: Re: mlmmj-send.c:840
Message-Id: <20060802091527.GC76865@freesbee.wheel.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20060802054000.2343490B3B@smtp1-g19.free.fr>
In-Reply-To: <20060802054000.2343490B3B@smtp1-g19.free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hello,

On Wed, Aug 02, 2006 at 07:40:02AM +0200, Christophe GALLIENNE wrote:
>=20
> I have a lot of :=20
>=20
> Jul 31 11:06:17 cgy /usr/bin/mlmmj-send[31161]: mlmmj-send.c:840: Not
> preparing in memory. Mail is 38758 bytes: Success
>=20
> In my /var/log/mail.err (postfix is used), does anyone know why ?

Try looking at http://mlmmj.mmj.dk/files/TUNABLES , specifically under the =

heading "memorymailsize".

Default max size of mails prepared in memory is 16384 bytes.

So, either send smaller emails, or adjust the appropriate tunable.

I hope this helps.

--=20
S=F8ren O.

"Oh, bother" said the Borg, "we've assimilated Pooh".
