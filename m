From: "Christoph Wilke" <chris@filmkreis.tu-darmstadt.de>
Date: Fri, 10 Nov 2006 15:28:30 +0000
Subject: mlmmj-process dies with "free(): invalid next size"
Message-Id: <3629.130.83.236.83.1163172510.squirrel@130.83.185.210>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_20061110162830_39329"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

------=_20061110162830_39329
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: 8bit

Hej!

As stated in the subject mlmmj-process dies with an
memory error, if the subject line of the mailfile
contains an equal sign ( = ).

After I found the error in my logs, I tried to run the
process by hand:

# ~/mlmmj/mlmmj-1.2.12-RC4/src/mlmmj-process -L /var/spool/mlmmj/test \
-m /var/spool/mlmmj/test/incoming/647f4170739768df
*** glibc detected *** free(): invalid next size (fast): 0x08054a40 ***
Aborted
#

I tested it with the attached mailfile -- error
the same file, but without the equal signs -- no error
the same file, but only an equal sign as subject -- error.

Further testing/checking showed, the bug was introduced in
RC3, because RC2 runs just fine.

Ciao
Chris

ps. The versions I used to test weren't patched.
------=_20061110162830_39329
Content-Type: application/octet-stream; name="647f4170739768df"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="647f4170739768df"

RnJvbSBjaHJpc0BmaWxta3JlaXMudHUtZGFybXN0YWR0LmRlICBUdWUgTm92ICA3IDExOjA5OjA3
IDIwMDYKUmV0dXJuLVBhdGg6IDxjaHJpc0BmaWxta3JlaXMudHUtZGFybXN0YWR0LmRlPgpYLU9y
aWdpbmFsLVRvOiB0ZXN0QHBjMS5maWxta3JlaXMudHUtZGFybXN0YWR0LmRlCkRlbGl2ZXJlZC1U
bzogdGVzdEBwYzEuZmlsbWtyZWlzLnR1LWRhcm1zdGFkdC5kZQpSZWNlaXZlZDogZnJvbSBsb2Nh
bGhvc3QgKGxvY2FsaG9zdCBbMTI3LjAuMC4xXSkKCWJ5IHBjMS5maWxta3JlaXMudHUtZGFybXN0
YWR0LmRlIChQb3N0Zml4KSB3aXRoIEVTTVRQIGlkIDYzRjI5OTQ2Cglmb3IgPHRlc3RAcGMxLmZp
bG1rcmVpcy50dS1kYXJtc3RhZHQuZGU+OyBUdWUsICA3IE5vdiAyMDA2IDExOjA5OjA3ICswMTAw
IChDRVQpClJlY2VpdmVkOiBmcm9tIHBjMS5maWxta3JlaXMudHUtZGFybXN0YWR0LmRlIChbMTI3
LjAuMC4xXSkKCWJ5IGxvY2FsaG9zdCAocGMxLmZpbG1rcmVpcy50dS1kYXJtc3RhZHQuZGUgWzEy
Ny4wLjAuMV0pIChhbWF2aXNkLW5ldywgcG9ydCAxMDAyNCkKCXdpdGggRVNNVFAgaWQgQ2NtRXR6
UEFlZ0hCCglmb3IgPHRlc3RAcGMxLmZpbG1rcmVpcy50dS1kYXJtc3RhZHQuZGU+OwoJVHVlLCAg
NyBOb3YgMjAwNiAxMTowOTowNyArMDEwMCAoQ0VUKQpTdWJqZWN0OiA/aXNvLTg4NTktMT9RPzMw
X01pbnV0ZW5fdW5kXzFfTXVza2Vsa2F0ZXJfc3A9RTR0ZXI/CkRhdGU6IFR1ZSwgNyBOb3YgMjAw
NiAxMDo1NjozMCArMDEwMApNZXNzYWdlLUlEOiA8QUQ0RkQyNjBGNDc3Rjg0ODhCQ0ZGQzRERDQ5
QjA2NDMzM0UyN0ZAYmxhLmxvY2FsPgpGcm9tOiA8Y2hyaXNAZmlsbWtyZWlzLnR1LWRhcm1zdGFk
dC5kZT4KVG86IDx0ZXN0QHBjMS5maWxta3JlaXMudHUtZGFybXN0YWR0LmRlPgoKdGVzdAo=
------=_20061110162830_39329--

