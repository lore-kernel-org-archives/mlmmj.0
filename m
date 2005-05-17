From: =?iso-8859-1?Q?S=F8ren?= Boll Overgaard <boll+mlmmj@fork.dk>
Date: Tue, 17 May 2005 12:30:05 +0000
Subject: Re: Is possible change /etc/mlmmj location?
Message-Id: <20050517123005.GA26932@freesbee.wheel.dk>
List-Id: <mlmmj.mlmmj.org>
References: <1116328716.13494.2.camel@zion>
In-Reply-To: <1116328716.13494.2.camel@zion>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hello,

On Tue, May 17, 2005 at 01:20:37PM +0200, Mads Martin Joergensen wrote:
> * Lupin3rd <lupin3rd@gmx.it> [May 17. 2005 13:17]:
> > Hi,
> > i use Debian and mlmmj debian package.
> > I want to know if there is a way to change the location that mlmmj use
> > for his config file... i don't want use /etc/mlmmj but i would use
> > /usr/share/dtc/etc (in this way i can integrate mlmmj with the GPL
> > panle DTC, and DTC can write mlmmj config files).
>=20
> Isn't the way it's done on Debian just a matter of symlinks in the list
> directory, so just changing those symlinks should suffice?
>=20
> I don't know for sure, the Debian maintainer will know for sure.

Yes, I use symlinks to keep configuration files in /etc:

boll@griswold:/var/spool/mlmmj/mlmmj-test$ ls -la
total 17
drwxr-xr-x  13 nobody nogroup 1024 2005-05-17 14:00 .
drwxr-xr-x   4 root   root    1024 2005-01-27 21:48 ..
drwxr-xr-x   2 nobody nogroup 1024 2005-04-28 19:03 archive
drwxr-xr-x   2 nobody nogroup 1024 2005-01-27 21:48 bounce
lrwxrwxrwx   1 nobody nogroup   35 2005-01-27 21:48 control ->
/etc/mlmmj/lists/mlmmj-test/control
drwxr-xr-x   2 nobody nogroup 1024 2005-01-27 21:48 digesters.d
drwxr-xr-x   2 nobody nogroup 1024 2005-04-28 19:03 incoming
-rw-r--r--   1 nobody nogroup    1 2005-04-28 19:03 index
-rw-------   1 nobody nogroup   13 2005-05-12 20:00 lastdigest
-rw-------   1 nobody root     618 2005-05-17 14:00 mlmmj-maintd.lastrun.log
-rw-------   1 nobody nogroup  612 2005-04-28 19:02 mlmmj.operation.log
drwxr-xr-x   2 nobody nogroup 1024 2005-01-27 21:48 moderation
drwxr-xr-x   2 nobody nogroup 1024 2005-01-27 21:48 nomailsubs.d
drwxr-xr-x   3 nobody nogroup 1024 2005-04-28 20:00 queue
drwxr-xr-x   2 nobody nogroup 1024 2005-01-27 21:48 requeue
drwxr-xr-x   2 nobody nogroup 1024 2005-02-21 21:21 subconf
drwxr-xr-x   2 nobody nogroup 1024 2005-02-21 21:21 subscribers.d
lrwxrwxrwx   1 nobody nogroup   32 2005-01-27 21:48 text ->
/etc/mlmmj/lists/mlmmj-test/text
drwxr-xr-x   2 nobody nogroup 1024 2005-02-28 22:00 unsubconf
boll@griswold:/var/spool/mlmmj/mlmmj-test$=20

Moving control/ and text/ somewhere else is obviously a matter of changing a
couple of symlinks. Debian however, normally does not allow configuration f=
iles
to be stored outside /etc.

--=20
S=F8ren O.                                           ,''`.
                                                  : :' :
GPG key id: 0x1EB2DE66                            `. `'
GPG signed mail preferred.                          `-
