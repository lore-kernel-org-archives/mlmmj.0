From: Christian Laursen <xi@borderworlds.dk>
Date: Tue, 07 Sep 2004 08:51:41 +0000
Subject: Re: splitting configuration from the spool/queue
Message-Id: <86n002o40y.fsf@borg.borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20040907083520.GA70234@freesbee.wheel.dk>
In-Reply-To: <20040907083520.GA70234@freesbee.wheel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

S=F8ren Boll Overgaard <boll+mlmmj@fork.dk> writes:

> Is there any particular reason why the list configuration is situated in =
the
> same directory structure as the list queue and archive? According to the =
FHS[1],
> list configuration should be somewhere under /etc while the queue and arc=
hive
> should be somewhere under /var. This would have the added benefit that li=
st
> configuration could be stored on a read-only file system for added securi=
ty.

Personally I find it convenient to have everything related to a list located
under the same directory.

I don't see a problem in adding optional support for having the control dir
located in a seperate location but the current directory layout should cont=
inue
to be the default to avoid breaking existing configurations.

--=20
Christian Laursen
