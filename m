From: Andrew Kohlsmith <akohlsmith-mlmmj@benshaw.com>
Date: Mon, 18 Oct 2004 14:00:30 +0000
Subject: SOLVED: mail accepted but not retransmitted?
Message-Id: <200410181000.30302.akohlsmith-mlmmj@benshaw.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Ok wrapping mlmmj-recieve (that is spelled wrong btw, "receive" is how to=20
spell it in English) and drilling down into the strace output I see what is=
=20
happenning.

- mlmmj-recieve gets called, places mail into incoming queue
- mlmmj-recieve calls mlmmj-process which does its magic and places mail in=
to=20
outgoing queue
- mlmmj-process calls mlmmj-send which takes the queued message and segfaul=
ts.

The exact command that is being executed is
/usr/local/bin/mlmmj-send -L /var/spool/mlmmj/mlmmj-test/=20
-m /var/spool/mlmmj/mlmmj-test//queue/72e1474456fce86a

I can run that manually and get a segmentation fault.  The strace output sh=
ows=20
that mlmmj-send segfaults after trying to do some network calls:

connect(6, {sa_family=AF_INET, sin_port=3Dhtons(53),=20
sin_addr=3Dinet_addr("192.168.1.1")}, 28) =3D 0
send(6, "#D\1\0\0\1\0\0\0\0\0\0\6gromit\7mixdown\2ca\0\0"..., 35, 0) =3D 35
gettimeofday({1098107544, 338999}, NULL) =3D 0
poll([{fd=3D6, events=3DPOLLIN, revents=3DPOLLIN}], 1, 5000) =3D 1
ioctl(6, FIONREAD, [35])                =3D 0
recvfrom(6, "#D\201\203\0\1\0\0\0\0\0\0\6gromit\7mixdown\2ca\0\0"..., 1024,=
 0,=20
{sa_family=AF_INET, sin_port=3Dhtons(53), sin_addr=3Dinet_addr("192.168.1.1=
")},=20
[16]) =3D 35
close(6)                                =3D 0
socket(PF_INET, SOCK_DGRAM, IPPROTO_IP) =3D 6
connect(6, {sa_family=AF_INET, sin_port=3Dhtons(53),=20
sin_addr=3Dinet_addr("192.168.1.1")}, 28) =3D 0
send(6, "#E\1\0\0\1\0\0\0\0\0\0\6gromit\0\0\1\0\1", 24, 0) =3D 24
gettimeofday({1098107544, 342537}, NULL) =3D 0
poll([{fd=3D6, events=3DPOLLIN, revents=3DPOLLIN}], 1, 5000) =3D 1
ioctl(6, FIONREAD, [24])                =3D 0
recvfrom(6, "#E\201\203\0\1\0\0\0\0\0\0\6gromit\0\0\1\0\1", 1024, 0,=20
{sa_family=AF_INET, sin_port=3Dhtons(53), sin_addr=3Dinet_addr("192.168.1.1=
")},=20
[16]) =3D 24
close(6)                                =3D 0
--- SIGSEGV (Segmentation fault) @ 0 (0) ---
+++ killed by SIGSEGV +++

Drilling down a little more, I see that my /etc/hosts entry for this machin=
e=20
is wrong.  I had renamed the machine but did not update /etc/hosts.

Fixing this such that

127.0.0.1  localhost
127.0.0.1  gromit.mixdown.ca gromit

was in there corrected the SIG11 and the list is now sending.

I am shortly going to submit a patch to mlmmj-1.0.0 which uses the RECIPDEL=
IM=20
define throughout; right now only about 1/3 of the code uses it.  :-)

Thank you all for your help in tracking this problem down.  It was a real b=
ear=20
of a problem and should probably make its way into a FAQ or README somewher=
e.

-A.
