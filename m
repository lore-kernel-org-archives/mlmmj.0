From: =?iso-8859-1?Q?S=F8ren?= Boll Overgaard <boll+mlmmj@fork.dk>
Date: Tue, 07 Sep 2004 08:35:20 +0000
Subject: splitting configuration from the spool/queue
Message-Id: <20040907083520.GA70234@freesbee.wheel.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hi,

This may or may not have been covered earlier, but I couldn't seem to find
anything in the list archive, so here goes.

Is there any particular reason why the list configuration is situated in the
same directory structure as the list queue and archive? According to the FH=
S[1],
list configuration should be somewhere under /etc while the queue and archi=
ve
should be somewhere under /var. This would have the added benefit that list
configuration could be stored on a read-only file system for added security.

Comments? Thoughts? Flames?

[1] http://www.pathname.com/fhs/


--=20
S=F8ren O.                                           ,''`.
                                                   : :' :
GPG key id: 0x1EB2DE66                             `. `'
GPG signed mail preferred.                           `-
