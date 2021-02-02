From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Tue, 02 Feb 2021 07:36:49 +0000
Subject: Re: [mlmmj] mlmmj replication
Message-Id: <robbat2-20210202T061530-022641066Z@orbis-terrarum.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="UoTem5zSM3OmKYpM"
List-Id: <mlmmj.mlmmj.org>
References: <7c27eb47-7a10-cdc2-4e1b-d319aba01008@arctur.si>
In-Reply-To: <7c27eb47-7a10-cdc2-4e1b-d319aba01008@arctur.si>
To: mlmmj@mlmmj.org


--UoTem5zSM3OmKYpM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 01, 2021 at 01:03:50PM +0100, Piotr Auksztulewicz wrote:
> On Mon, Feb 01, 2021 at 11:52:35AM +0100, Rok Saksida wrote:
> > Now, I want to create HA system. Does mlmmj provides some way of
> > replication?
>=20
> As you've probably noticed, mlmmj is a very simple piece of software.
> It does not provide sophisticates features. You need to build your HA
> capability yourself.
>=20
> For my private small server, I have contenerized mlmmj, so I can bring
=2E..
> in its queue until I fire up the container on the other host.
How do you intend to handle the case where the failure might be after a
mail is delivered, index/sequence has incremented, but before the next
rsync cron has fired?

What about rsync scandir time for large archives?

I ask because I'm looking for improving the solutions for Gentoo's
deployment of mlmmj, specifically to handle potential hard failures.

The /archives/ directories are my largest concern, the largest of which
presently has 1.247M mails in a single directory.

If the /archives/ directory could be sharded, then it would be
significantly easier; possibly in conjunction with incron or other
inotify-based trigger for targeted replication.

--=20
Robin Hugh Johnson
Gentoo Linux: Dev, Infra Lead, Foundation Treasurer
E-Mail   : robbat2@gentoo.org
GnuPG FP : 11ACBA4F 4778E3F6 E4EDF38E B27B944E 34884E85
GnuPG FP : 7D0B3CEB E9B85B1F 825BCECF EE05E6F6 A48F6136

--UoTem5zSM3OmKYpM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Robbat2 @ Orbis-Terrarum Networks - The text below is a digital signature. If it doesn't make any sense to you, ignore it.

iQKTBAABCgB9FiEEveu2pS8Vb98xaNkRGTlfI8WIJsQFAmAZAQ1fFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEJE
RUJCNkE1MkYxNTZGREYzMTY4RDkxMTE5Mzk1RjIzQzU4ODI2QzQACgkQGTlfI8WI
JsT4dRAAnwHIhmpCZQNSTvmjy67f0saGxceh2uyWQQhffsLAcPniaVqNJFIUqS2x
x40DAzUde+HcFbBXHexqNnwz3QARPV1wBWYddydmj3pNbCCyNRDo5Aoun60OE0rv
TERnax1Uy+pVpI2m/znWiB5m9N4KYvb6k8dKTM31f5uknk+F20PcKWTANjkQlS4W
pqAuan4FsISqFeVZd40p2C2iOaDN037SdJ7khaLFafYx02pUU+ZhprlSNNdazPxy
A+mjelHTob4nYcQK/yf1VZjpOdS5448F/ifyLXNEKTmCJD6ilitwTRYw0Y1hWP2L
85SsP46KIy2aYjuD0rCzTeRYGqqNOKh6sETkjW9Jme+umL1HHTNQ+SeJnTSQea+c
+ilSCFzrwW0bVGroUvq787aC/x019g9sQrBrWxZddIMTIYg3bfF+X3h870HTvPF1
7F1PwEdtrqyjxAWV7N3r3AAlM6uvsNLE1HkxFoGoYO3tYTUC/eRfZGUgDC/m6RG8
ASzbfMMbWccqoluw7iQPwKYklyrVKTGYz6upaunJskmijQmt9mTBcZ4lMuMnePEs
fHjB1syiBtEzQGkxaeNbfsKYcO3TPBwYRmm4RFljNGa82DIAXNtFvrJFc/7Zpyvj
slQB1Ow3WP3Ejj7NSsy/EmunabA4mPLkdRWP14PBMTeR1Ws+4Kc=
=io74
-----END PGP SIGNATURE-----

--UoTem5zSM3OmKYpM--

