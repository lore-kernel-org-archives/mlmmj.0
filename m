From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 07 Sep 2004 09:34:00 +0000
Subject: Re: splitting configuration from the spool/queue
Message-Id: <20040907093400.GA82386@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20040907083520.GA70234@freesbee.wheel.dk>
In-Reply-To: <20040907083520.GA70234@freesbee.wheel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

* S=F8ren Boll Overgaard <boll+mlmmj@fork.dk> [Sep 07. 2004 11:09]:
> Well, making the symlinks from /var to /etc would break future
> introductions of calls to chroot(), so symlinks, if used, should
> probably be from /etc to /var, and not vice-versa.

If the symlinks go from /etc to /var, how can the config files be on a
read-only mounted filesystem?

--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
