From: Niki Guldbrand <niki@guldbrand.net>
Date: Sun, 19 Oct 2008 12:51:55 +0000
Subject: A php-webadmin fix and postfix pibe backend support.
Message-Id: <1224420715.7510.146.camel@niki-laptop>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-UJRMKhVG6OSVfc6s9bfb"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--=-UJRMKhVG6OSVfc6s9bfb
Content-Type: multipart/mixed; boundary="=-68o3JbegO3iuwFlfUIix"


--=-68o3JbegO3iuwFlfUIix
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi Folks.

My first post to this list, and it contains 2 patches ;-)
And I hope they will get accepted :-)

I struggled to get get the php-web-admin interface to work here in my
setup (deb/ubu) when ever I went to the list page where the options
should be, I only say the string "{ROWS}".
I found out after a little digging that it couldn't read the tunable
file because the web interface didn't use the complete path.
So I had to add $templatedir to the path for it to work, see the patch
attached.

My second patch is to make mlmmj support postfix's pipe backend, because
my setup here is virtual, I couldn't get postfix to use the alias
in /etc/aliases, so I added a Pipe Transport to deliver the mails to
mlmmj-receive, but that failed too.
After digging a little in the code for receive and process I ended up
adding two additional options -s and -e to mlmmj-receive.

-s specifies the sender address and -e specifies the extension.
-e isn't strictly needed, as mlmmj seemed to run fine without it, but I
just added it anyway.

So my setup is currently like this:

/etc/postfix/mlmmj_maillists:
xxx@guldbrand.net	ACCEPT

/etc/postfix/transport:
xxx@guldbrand.net	mlmmj-xxx:

/etc/postfix/master.cf:
mlmmj-familien unix - n n - - pipe
        flags=3DBFX
        user=3Dnobody:nogroup
        argv=3D/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/xxx -s ${sender} =
-e ${extension}

/etc/postfix/main.cf:
virtual_mailbox_maps =3D
        proxy:pgsql:/etc/postfix/pgsql/virtual-mailbox-maps.cf
        proxy:hash:/etc/postfix/mlmmj_maillists


I hope that this will be of use for others, and that some other out
there might want to help test this in other setup's than my own.

There may be other ways to do something similar, or I might have done
something wrong in my attempts, if so please speak up :-D


Thanks for your time and best regards

Niki Guldbrand

--=-68o3JbegO3iuwFlfUIix
Content-Disposition: attachment; filename="php-web-admin.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="php-web-admin.patch"; charset="UTF-8"

ZGlmZiAtTmF1ciBtbG1tai0xLjIuMTUub3JpZy9jb250cmliL3dlYi9waHAtYWRtaW4vaHRkb2Nz
L2VkaXQucGhwIG1sbW1qLTEuMi4xNS9jb250cmliL3dlYi9waHAtYWRtaW4vaHRkb2NzL2VkaXQu
cGhwDQotLS0gbWxtbWotMS4yLjE1Lm9yaWcvY29udHJpYi93ZWIvcGhwLWFkbWluL2h0ZG9jcy9l
ZGl0LnBocAkyMDA1LTA1LTA5IDE2OjM2OjA5LjAwMDAwMDAwMCArMDIwMA0KKysrIG1sbW1qLTEu
Mi4xNS9jb250cmliL3dlYi9waHAtYWRtaW4vaHRkb2NzL2VkaXQucGhwCTIwMDgtMTAtMTkgMTQ6
MTc6NDIuMDAwMDAwMDAwICswMjAwDQpAQCAtMTE0LDggKzExNCw4IEBADQogDQogJHRwbC0+YXNz
aWduKGFycmF5KCJMSVNUIiA9Pmh0bWxlbnRpdGllcygkbGlzdCkpKTsNCiANCi0kaGFuZGxlID0g
Zm9wZW4oIi4uL2NvbmYvdHVuYWJsZXMucGwiLCAiciIpOw0KLSR0dW5hYmxlcyA9IGZyZWFkKCRo
YW5kbGUsIGZpbGVzaXplKCIuLi9jb25mL3R1bmFibGVzLnBsIikpOw0KKyRoYW5kbGUgPSBmb3Bl
bigiJHRlbXBsYXRlZGlyLy4uL2NvbmYvdHVuYWJsZXMucGwiLCAiciIpOw0KKyR0dW5hYmxlcyA9
IGZyZWFkKCRoYW5kbGUsIGZpbGVzaXplKCIkdGVtcGxhdGVkaXIvLi4vY29uZi90dW5hYmxlcy5w
bCIpKTsNCiBmY2xvc2UoJGhhbmRsZSk7DQogDQogZXZhbCgkdHVuYWJsZXMpOw0KZGlmZiAtTmF1
ciBtbG1tai0xLjIuMTUub3JpZy9jb250cmliL3dlYi9waHAtYWRtaW4vaHRkb2NzL3NhdmUucGhw
IG1sbW1qLTEuMi4xNS9jb250cmliL3dlYi9waHAtYWRtaW4vaHRkb2NzL3NhdmUucGhwDQotLS0g
bWxtbWotMS4yLjE1Lm9yaWcvY29udHJpYi93ZWIvcGhwLWFkbWluL2h0ZG9jcy9zYXZlLnBocAky
MDA1LTA1LTA5IDE2OjM2OjA5LjAwMDAwMDAwMCArMDIwMA0KKysrIG1sbW1qLTEuMi4xNS9jb250
cmliL3dlYi9waHAtYWRtaW4vaHRkb2NzL3NhdmUucGhwCTIwMDgtMTAtMTkgMTQ6MTc6MjguMDAw
MDAwMDAwICswMjAwDQpAQCAtODUsOCArODUsOCBAQA0KICR0cGwtPmRlZmluZShhcnJheSgibWFp
biIgPT4gInNhdmUuaHRtbCIpKTsNCiAkdHBsLT5hc3NpZ24oYXJyYXkoIkxJU1QiID0+IGh0bWxl
bnRpdGllcygkbGlzdCkpKTsNCiANCi0kaGFuZGxlID0gZm9wZW4oIi4uL2NvbmYvdHVuYWJsZXMu
cGwiLCAiciIpOw0KLSR0dW5hYmxlcyA9IGZyZWFkKCRoYW5kbGUsIGZpbGVzaXplKCIuLi9jb25m
L3R1bmFibGVzLnBsIikpOw0KKyRoYW5kbGUgPSBmb3BlbigiJHRlbXBsYXRlZGlyLy4uL2NvbmYv
dHVuYWJsZXMucGwiLCAiciIpOw0KKyR0dW5hYmxlcyA9IGZyZWFkKCRoYW5kbGUsIGZpbGVzaXpl
KCIkdGVtcGxhdGVkaXIvLi4vY29uZi90dW5hYmxlcy5wbCIpKTsNCiBmY2xvc2UoJGhhbmRsZSk7
DQogDQogZXZhbCgkdHVuYWJsZXMpOw0K


--=-68o3JbegO3iuwFlfUIix
Content-Disposition: attachment; filename="mlmmj-recieve.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="mlmmj-recieve.patch"; charset="UTF-8"

LS0tIG1sbW1qLTEuMi4xNS5vcmlnL3NyYy9tbG1tai1yZWNpZXZlLmMJMjAwNi0wNC0yNSAxNDoz
MDoxMS4wMDAwMDAwMDAgKzAyMDANCisrKyBtbG1tai0xLjIuMTUvc3JjL21sbW1qLXJlY2lldmUu
YwkyMDA4LTEwLTE5IDE0OjEwOjU3LjAwMDAwMDAwMCArMDIwMA0KQEAgLTQyLDEwICs0MiwxMiBA
QA0KIA0KIHN0YXRpYyB2b2lkIHByaW50X2hlbHAoY29uc3QgY2hhciAqcHJnKQ0KIHsNCi0gICAg
ICAgIHByaW50ZigiVXNhZ2U6ICVzIC1MIC9wYXRoL3RvL2xpc3RkaXIgWy1oXSBbLVZdIFstUF0g
Wy1GXVxuIg0KKyAgICAgICAgcHJpbnRmKCJVc2FnZTogJXMgLUwgL3BhdGgvdG8vbGlzdGRpciBb
LXMgc2VuZGVyQGRvbWFpbi50bGRdIFstZSBleHRlbnNpb25dIFstaF0gWy1WXSBbLVBdIFstRl1c
biINCiAJICAgICAgICIgLWg6IFRoaXMgaGVscFxuIg0KIAkgICAgICAgIiAtRjogRG9uJ3QgZm9y
ayBpbiB0aGUgYmFja2dyb3VuZFxuIg0KIAkgICAgICAgIiAtTDogRnVsbCBwYXRoIHRvIGxpc3Qg
ZGlyZWN0b3J5XG4iDQorCSAgICAgICAiIC1zOiBTcGVjaWZ5IHNlbmRlciBhZGRyZXNzXG4iDQor
CSAgICAgICAiIC1lOiBUaGUgZm9vIHBhcnQgb2YgdXNlcitmb29AZG9tYWluLnRsZFxuIg0KIAkg
ICAgICAgIiAtUDogRG9uJ3QgZXhlY3V0ZSBtbG1tai1wcm9jZXNzXG4iDQogCSAgICAgICAiIC1W
OiBQcmludCB2ZXJzaW9uXG4iLCBwcmcpOw0KIAlleGl0KEVYSVRfU1VDQ0VTUyk7DQpAQCAtNjks
NyArNzEsNyBAQA0KIAltbG1tanByb2Nlc3MgPSBjb25jYXRzdHIoMiwgYmluZGlyLCAiL21sbW1q
LXByb2Nlc3MiKTsNCiAJbXlmcmVlKGJpbmRpcik7DQogCQ0KLQl3aGlsZSAoKG9wdCA9IGdldG9w
dChhcmdjLCBhcmd2LCAiaFBWTDpGIikpICE9IC0xKSB7DQorCXdoaWxlICgob3B0ID0gZ2V0b3B0
KGFyZ2MsIGFyZ3YsICJoUFZMOnM6ZTpGIikpICE9IC0xKSB7DQogCQlzd2l0Y2gob3B0KSB7DQog
CQljYXNlICdoJzoNCiAJCQlwcmludF9oZWxwKGFyZ3ZbMF0pOw0KQEAgLTc3LDYgKzc5LDEyIEBA
DQogCQljYXNlICdMJzoNCiAJCQlsaXN0ZGlyID0gb3B0YXJnOw0KIAkJCWJyZWFrOw0KKwkJY2Fz
ZSAncyc6DQorCQkJc2V0ZW52KCJTRU5ERVIiLCBvcHRhcmcsIDEpOw0KKwkJCWJyZWFrOw0KKwkJ
Y2FzZSAnZSc6DQorCQkJc2V0ZW52KCJFWFRFTlNJT04iLCBvcHRhcmcsIDEpOw0KKwkJCWJyZWFr
Ow0KIAkJY2FzZSAnUCc6DQogCQkJbm9wcm9jZXNzID0gMTsNCiAJCQlicmVhazsNCg==


--=-68o3JbegO3iuwFlfUIix--

--=-UJRMKhVG6OSVfc6s9bfb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iQIcBAABAgAGBQJI+y1nAAoJEAPdccyjg/+FqBAP/2o7pCoGlgEtT/3SAVni7DPY
UEqyHfPKLt3eeqON1u5bPivDEfw1JhBWVDYo1e3cZmAulBUYtsaLNKKVZrmaZ5Js
ChR386gQpZwayLUYLWY7Xh3Wq6HpGxDpkgGcqryToLNBvvD/BPBl12wCTv5noz4u
UE5dJttiyaBddduUXanNlYH1TQOrEUbl3Fodd3VHxoRroGXZwGEG1Qx0LxW4ZDzK
fAlV4ZnRU3s3+tu1xga39hwQN34ctIe2iroUchG9Krp9pwXi+BI3q9U61fd46MpL
5G6GwIg/OgslN39sqZv/UB4z42m9Cv9PqC21LJU6iuiaIkqC3wdb2x+h6mvSFed9
adVpwpbRSug7qVJJ4ft/5+X4KiiYFXDPfbJ6YS2fU3RNXiQRe+nvH8HUrnSjmx09
qWvPseT1zRzG9pKE3JE516rgLLji9Ac6tJjxmLHWPKldeeJ5R2LSpWlzGyWahqbv
7qZVZwabAXgVtaTDZ3zSKnsMhr5R7Z7/OxupPqK/qKs7m8EgEQsg3shfOEuPRocc
YYAkSBAOISfXqPviXNCI6z1T+/wfHjiSEwmiITrOcaPT9ysQJ83JPfiCqF8FFJLH
SJiUbYIbGSjsAn5gEc+OJ87VqgrlvY5Rvj+UcpdeaMwPZQnHICpxctk8WlBKFJ+w
RlfLtkrV9hE41g0isAS6
=PFN4
-----END PGP SIGNATURE-----

--=-UJRMKhVG6OSVfc6s9bfb--

