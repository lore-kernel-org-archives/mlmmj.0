From: Achilleas Pipinellis <axilleas@axilleas.me>
Date: Tue, 19 May 2015 10:26:11 +0000
Subject: [mlmmj] Duplicate e-mail entries in subscribers.d
Message-Id: <555B0FC3.6050907@axilleas.me>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

So every time I add an e-mail to a list with:

sudo -u mlmmj /usr/bin/mlmmj-sub -L /var/spool/mlmmj/list -a
mail@mail.com -sqf

and the e-mail exists, a duplicate entry gets written to the
subscribers.d/m file.

I searched in the docs but didn't find any info and the only relevant
post in the list is http://mlmmj.org/archive/mlmmj/2013-09/0000001.html.

Does this gets handled by mlmmj-maintd by any chance or is it a manual
process?

Thanks.


- -- 
GPG : 0x3A7DDABC985EDC6E
Blog: http://axilleas.me
-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJVWw/CAAoJEBTqGDGsMtXMzAIP/R8M6PCFo5qszrbzE1RdvtXp
nm7n71fXmVkSIIeD313/Y0cE4AnCg6BW7tsX7KVuvckNtAQhfPQjzbbWsdTTDT3G
LEzCz30T2xJUYJ+Sw/kkZteh0iAZOD3xvBNsymuRc+AwqDFME7DnNfXDWLQ0ILj2
xiVXoZXlM1PvcKQzwij9hsu5aXXw3htCTxMQwv4Ht2Z+mMNG8p6mSvWR/hD/Fu/P
SPsX0g62KnzCqaY5dJsdgoKo+Ccys8vtFm3/qxjiQiMZoV6YN96awq1RYvFfK2O7
KRKGUQuNaMy2fCXfk/B2gM8VxoT0BTK3a/znYV8QUPWnuV+1wf2u+Ek8ZRPd7mg/
+LY2RyhbMnRsMnIiqA7vxIh626Kzz65QDJbNLtiH1QGaaD7ScnNaSCJhSVHhw721
PtsyRzRIgvJVMeenWTdDartvzRnlB2n2XIHbT87nDu/v/2LqOfQInV3o8f5sGm84
VhrEKrrOsPGGYRlTsrdX07+taLgYzgrq49HKGIQPE2P14iu3A0Kw8NLMKbbWhN0x
Fn34Eq4M2REPNgB4Z05MwVgsiVr4NPWrfB4VCSNsPD/jqMwgkcfj4TVFFqZnInkW
3/r6OgxLWycGXbibfqaJe18oaj0rqWZJnHlN9S5QSsESaJjjjMbI+Jlr7UscyiUj
oGdEIJr3Y5PqnKryM7yl
=VcYv
-----END PGP SIGNATURE-----

