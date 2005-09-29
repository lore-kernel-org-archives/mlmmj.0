From: =?iso-8859-1?Q?S=F8ren?= Boll Overgaard <boll+mlmmj@fork.dk>
Date: Thu, 29 Sep 2005 11:12:05 +0000
Subject: Re: silently discarded post
Message-Id: <20050929111205.GD73616@freesbee.wheel.dk>
List-Id: <mlmmj.mlmmj.org>
References: <003f01c5c4e1$dbd80420$6664a8c0@stnick>
In-Reply-To: <003f01c5c4e1$dbd80420$6664a8c0@stnick>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Thu, Sep 29, 2005 at 12:50:24PM +0200, Mads Martin Joergensen wrote:
> * Patrick Bennett <patrick@pebcomputing.com> [Sep 29. 2005 12:47]:
> > I have a mlmmj 1.2.4-1 mailing list running on a debian+postfix host
> > and one particular user is having trouble posting to it.  Every mail
> > he sends is silently filed away into queue/discarded.  The address he
> > is emailing from is properly subscribed to the "nomail" part of the
> > list.  There is no control/access file.  Others, both on the
> > mail-receipt and noreciept lists, are able to post to the list
> > successfully.
> >=20
> > Below is a copy of one of the mails that ended up in queue/discarded.
> > Two things catch my eye, I wonder if either of them has something to
> > do with it: 1) his "from" address has a 3-part domain; 2) the "to"
> > address has single quotes around it (he seems to be unable to prevent
> > this in his mailer, and at any rate, postfix was obviously able to
> > handle it...).
>=20
> Can you try and reproduce with mlmmj-1.2.8?

The 1.2.4-1 version of mlmmj is the one currently in the stable branch of
Debian, and the 1.2.8-7 version in unstable probably won't install on a host
running stable.

If it would help, I will be happy to provide a backported version of 1.2.8 =
that works on Debian stable.

--=20
S=F8ren O.                                           ,''`.
                                                  : :' :
GPG key id: 0x1EB2DE66                            `. `'
GPG signed mail preferred.                          `-
