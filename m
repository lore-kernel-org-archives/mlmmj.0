From: =?ISO-8859-1?Q?Mads_Martin_J=F8rgensen?= <mmj@mmj.dk>
Date: Sun, 26 Sep 2010 19:08:11 +0000
Subject: Re: [mlmmj] Cannot remove mail adress
Message-Id: <AANLkTi=hSgB736hF+MZoFErL0F8ZwbX4uWrr7f_p-TK2@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <1285524372.2905.16.camel@cg-desktop>
In-Reply-To: <1285524372.2905.16.camel@cg-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Sun, Sep 26, 2010 at 8:06 PM, Christian Gleerup
<christian.gleerup@swn.nu> wrote:
> I have a server that uses mlmmj, but now I have the problem, that some
> email address cannot be deleted.
>
> for instance, I have this problem with my own, but the applikation user
> has repported that she had th eproblem several times, so people simply
> can't unsubscribe!
>
> see the following,
>
> /$ sudo mlmmj-list -L /var/spool/mlmmj/nyhedsbrev/ | grep cromozon
> cromozon@swn.nu
> /$ sudo /usr/bin/mlmmj-unsub -L /var/spool/mlmmj/nyhedsbrev/ -a
> cromozon@swn.nu -s
> Changing to uid 65534, owner of /var/spool/mlmmj/nyhedsbrev/.
> /$ sudo mlmmj-list -L /var/spool/mlmmj/nyhedsbrev/ | grep cromozon
> cromozon@swn.nu
>
> As you can see, the mail adress is not deleted after the unsub command,
> but in most cases, it works, what can be wrong?

Have a look at the owner and permissions of the files - it looks to me as i=
f the
one in question is owned by someone other than it should.

--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
=A0and totally illogical, with just a little bit more effort?"
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 -- A. P.=
 J.


