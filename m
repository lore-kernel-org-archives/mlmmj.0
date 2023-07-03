From: Baptiste Daroussin <bapt@nours.eu>
Date: Mon, 03 Jul 2023 07:26:23 +0000
Subject: Re: SOLVED: [mlmmj] make check fail for 1.4.0.a2
Message-Id: <t5psz3pfiku273z2zy54tdvskslhbzibask5yijxly6xo7macx@qpdkzycgcpzr>
List-Id: <mlmmj.mlmmj.org>
References: <d59ddb9d-a113-5225-f26e-c24d42134ff4@andreasschulze.de>
In-Reply-To: <d59ddb9d-a113-5225-f26e-c24d42134ff4@andreasschulze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Mon, Jul 03, 2023 at 09:03:12AM +0200, Baptiste Daroussin wrote:
> On Sun, Jul 02, 2023 at 07:46:45PM +0200, Franky Van Liedekerke wrote:
> > My tests still fail on 4 checks:
> >=20
> > mlmmj:generate_subconfirm=A0 ->=A0 failed: atf-c/utils.c:81: Cannot open
> > atf_utils_fork_out.txt=A0 [0.048s]
> > mlmmj:generate_subscription=A0 ->=A0 failed: atf-c/utils.c:81: Cannot o=
pen
> > atf_utils_fork_out.txt=A0 [0.049s]
> > mlmmj:notify_sub=A0 ->=A0 failed: atf-c/utils.c:81: Cannot open
> > atf_utils_fork_out.txt=A0 [0.047s]
> > mlmmj:send_help=A0 ->=A0 failed: atf-c/utils.c:81: Cannot open
> > atf_utils_fork_out.txt=A0 [0.052s]
> >=20
> > Running on latest fedora 38, all updates installed (not running as root=
 as
> > well, but a regular user account used for compiling)
> >=20
> > After running make check via strace, it seems atf fails because of nope=
nope
> > not existing. I never heard of this program, but then I found this in
> > ./tests/mlmmj.c:
> >=20
> > =A0./tests/mlmmj.c:=A0=A0=A0 =A0=A0=A0 exec_or_die("/usr/bin/nopenope",=
 NULL);
> > ./tests/mlmmj.c:=A0=A0=A0 atf_utils_wait(p, 1, "", "mlmmj: Execution fa=
iled for
> > '/usr/bin/nopenope': No such file or directory\n");
> > ./tests/mlmmj.c:=A0=A0=A0 int val =3D exec_and_wait("/usr/bin/nopenope"=
, NULL);
> >=20
> > I don't know why tests/mlmmj.c searches for this weird command :-)
>=20
> here we are testing a non existing command execution, so what you see is
> expected.
>=20
> there are 4 unit tests not working on fedora 37 according to my CI, I am
> investigating them:
>=20
> https://builds.sr.ht/~bapt/job/1017633
>=20
> Best regards,
> Bapt
>=20
>=20

Self replying because my memory is... bad. I already worked on the issue: on
fedora kyua is too old, I have pinged a couple of month ago the maintainer =
to upgrade it
from 0.13 to 0.21, which he did in fedora 39 if I trust

https://bodhi.fedoraproject.org/updates/?packages=3Dkyua

Best regards,
Bapt

