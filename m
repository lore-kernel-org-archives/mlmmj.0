From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Tue, 07 Sep 2004 08:45:03 +0000
Subject: Re: splitting configuration from the spool/queue
Message-Id: <20040907084503.GB1623@mopo.tv2.local>
List-Id: <mlmmj.mlmmj.org>
References: <20040907083520.GA70234@freesbee.wheel.dk>
In-Reply-To: <20040907083520.GA70234@freesbee.wheel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Tue, Sep 07, 2004 at 10:35:20AM +0200, S=F8ren Boll Overgaard wrote:
> Is there any particular reason why the list configuration is situated
> in the same directory structure as the list queue and archive?

I think there where two reasons for this decision: The first is that
having the configuration in /etc would make a chroot'ed environment
impossible, and the second is to have each list in a single directory.

If you want to store it in /etc you can do so, and just make symlinks in
/var/spool/mlmmj.

Morten

--=20
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
