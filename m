From: Joel Aelwyn <joel@lightbearer.com>
Date: Thu, 15 Sep 2005 05:35:50 +0000
Subject: Bad free() call
Message-Id: <43290836.70000@lightbearer.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------enig93E71E50E692797132E13488"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig93E71E50E692797132E13488
Content-Type: multipart/mixed;
 boundary="------------090209060907070508090507"

This is a multi-part message in MIME format.
--------------090209060907070508090507
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

While poking around at writing a patch that supports per-list recipient 
delimiters (basically done, but needs testing under 'live fire' still), I came 
across a free() call that should be myfree() in prepstdreply.c (it isn't 
caught due to the fact that prepstdreply.c doesn't have any reason to #include 
mlmmj.h, where the automated warning about this lives). It's minor, but I 
figure that also makes it easy to apply until 1.2.9 comes out, for anyone that 
cares; patch attached.

Actually, having looked over prepstdreply.c further, I think I see quite a few 
memory leaks in the form of not calling myfree() at all, when something has 
been allocated, but several of them would be best handled (or at least, most 
simply handled) by rearranging the logic to not allocate things until needed - 
however, I don't feel competent enough with the codebase yet to try something 
of quite that magnitude. Well, not and post it in public without more testing 
than I have time to do right now, anyway...
-- 
Joel Aelwyn <joel@lightbearer.com>

--------------090209060907070508090507
Content-Type: text/plain;
 name="myfree_biscuit.patch"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="myfree_biscuit.patch"

ZGlmZiAtdXJOYWQgc3JjL3ByZXBzdGRyZXBseS5jLm9yaWcgc3JjL3ByZXBzdGRyZXBseS5j
Ci0tLSBzcmMvcHJlcHN0ZHJlcGx5LmMub3JpZwkyMDA1LTAxLTE1IDEwOjQ2OjI0LjAwMDAw
MDAwMCArMDAwMAorKysgc3JjL3ByZXBzdGRyZXBseS5jCTIwMDUtMDktMDkgMjA6MTg6MzIu
MDAwMDAwMDAwICswMDAwCkBAIC0xODEsNyArMTgxLDcgQEAKIAlpZihyZXBseXRvKSB7CiAJ
CW15cmVwbHl0byA9IHN1YnN0aXR1dGUocmVwbHl0bywgbGlzdGFkZHIsIHRva2VuY291bnQs
IGRhdGEpOwogCQl0bXAgPSBjb25jYXRzdHIoMywgIlJlcGx5LVRvOiAiLCBteXJlcGx5dG8s
ICJcbiIpOwotCQlmcmVlKG15cmVwbHl0byk7CisJCW15ZnJlZShteXJlcGx5dG8pOwogCQlt
eXJlcGx5dG8gPSB0bXA7CiAJfSBlbHNlCiAJCW15cmVwbHl0byA9IE5VTEw7Cg==
--------------090209060907070508090507--

--------------enig93E71E50E692797132E13488
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (MingW32)

iD8DBQFDKQg2lZCPwGNtWe4RAktHAJ9Ysz5u47nsKa6W7cEDnocIWb5b0gCeLipe
VV+QZfCOCprKeYVQRjvaycs=
=xTks
-----END PGP SIGNATURE-----

--------------enig93E71E50E692797132E13488--
