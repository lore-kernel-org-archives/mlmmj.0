From: Baptiste Daroussin <bapt@nours.eu>
Date: Mon, 03 Jul 2023 07:03:12 +0000
Subject: Re: SOLVED: [mlmmj] make check fail for 1.4.0.a2
Message-Id: <yhxd24yiny5xm6qk5hd2mntvk2d3d5vastqhgcb4z4wqayfnxy@kv6td2v6lph7>
List-Id: <mlmmj.mlmmj.org>
References: <d59ddb9d-a113-5225-f26e-c24d42134ff4@andreasschulze.de>
In-Reply-To: <d59ddb9d-a113-5225-f26e-c24d42134ff4@andreasschulze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Sun, Jul 02, 2023 at 07:46:45PM +0200, Franky Van Liedekerke wrote:
> My tests still fail on 4 checks:
>=20
> mlmmj:generate_subconfirm=A0 ->=A0 failed: atf-c/utils.c:81: Cannot open
> atf_utils_fork_out.txt=A0 [0.048s]
> mlmmj:generate_subscription=A0 ->=A0 failed: atf-c/utils.c:81: Cannot open
> atf_utils_fork_out.txt=A0 [0.049s]
> mlmmj:notify_sub=A0 ->=A0 failed: atf-c/utils.c:81: Cannot open
> atf_utils_fork_out.txt=A0 [0.047s]
> mlmmj:send_help=A0 ->=A0 failed: atf-c/utils.c:81: Cannot open
> atf_utils_fork_out.txt=A0 [0.052s]
>=20
> Running on latest fedora 38, all updates installed (not running as root as
> well, but a regular user account used for compiling)
>=20
> After running make check via strace, it seems atf fails because of nopeno=
pe
> not existing. I never heard of this program, but then I found this in
> ./tests/mlmmj.c:
>=20
> =A0./tests/mlmmj.c:=A0=A0=A0 =A0=A0=A0 exec_or_die("/usr/bin/nopenope", N=
ULL);
> ./tests/mlmmj.c:=A0=A0=A0 atf_utils_wait(p, 1, "", "mlmmj: Execution fail=
ed for
> '/usr/bin/nopenope': No such file or directory\n");
> ./tests/mlmmj.c:=A0=A0=A0 int val =3D exec_and_wait("/usr/bin/nopenope", =
NULL);
>=20
> I don't know why tests/mlmmj.c searches for this weird command :-)

here we are testing a non existing command execution, so what you see is
expected.

there are 4 unit tests not working on fedora 37 according to my CI, I am
investigating them:

https://builds.sr.ht/~bapt/job/1017633

Best regards,
Bapt

