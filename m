From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 07 Sep 2004 09:19:54 +0000
Subject: Re: splitting configuration from the spool/queue
Message-Id: <20040907091954.GF80419@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20040907083520.GA70234@freesbee.wheel.dk>
In-Reply-To: <20040907083520.GA70234@freesbee.wheel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

* S=F8ren Boll Overgaard <boll+mlmmj@fork.dk> [Sep 07. 2004 11:09]:
> > > Is there any particular reason why the list configuration is
> > > situated in the same directory structure as the list queue and
> > > archive?
> >
> > I think there where two reasons for this decision: The first is that
> > having the configuration in /etc would make a chroot'ed environment
> > impossible, and the second is to have each list in a single
> > directory.
>
> Would you be interested in a patch for mlmmj-make-ml.sh which requires
> the user to decide if she wants to make links from
> /etc/mlmmj/lists/<listname> to /var/spool/mlmmj/control or some such?

I think such a patch belongs with the distributions, since FHS is Linux
specific, and mlmmj is not. It's just like the patch to mlmmj-make-ml.sh
to make it know where the listtexts are installed.

--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
