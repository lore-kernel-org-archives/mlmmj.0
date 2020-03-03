From: Christof Thalhofer <chrisml@deganius.de>
Date: Tue, 03 Mar 2020 00:36:18 +0000
Subject: Re: [mlmmj] DMARC
Message-Id: <a8d444ec-286f-afba-b038-6de073cf97c7@deganius.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="IdxAucuQIokUsZD2Jdy5BNSjSh4uXirlr"
List-Id: <mlmmj.mlmmj.org>
References: <S84ae4fccdLists@Torrens.org>
In-Reply-To: <S84ae4fccdLists@Torrens.org>
To: mlmmj@mlmmj.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IdxAucuQIokUsZD2Jdy5BNSjSh4uXirlr
Content-Type: multipart/mixed; boundary="OvDhTePYxyA21n38k7UTAc5eWkGSw17cV"

--OvDhTePYxyA21n38k7UTAc5eWkGSw17cV
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 02.03.20 um 12:13 schrieb Richard Torrens (lists):

> The member concerned is @casema.nl=20
>=20
> Other members postings nerver bounce for that reason. It's clear that
> casema.nl must have a stringent policy, but I cannot find out what is
> causing the problem.
>=20
> Has anyone any hints or suggestions?

Please have a look at the nameserver TXT reponse for _dmarc.casema.nl:

> dig -t TXT  _dmarc.casema.nl=20
>=20
> ; <<>> DiG 9.11.3-1ubuntu1.11-Ubuntu <<>> -t TXT _dmarc.casema.nl
> ;; global options: +cmd
> ;; Got answer:
> ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 47619
> ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1
>=20
> ;; OPT PSEUDOSECTION:
> ; EDNS: version: 0, flags:; udp: 512
> ;; QUESTION SECTION:
> ;_dmarc.casema.nl.		IN	TXT
>=20
> ;; ANSWER SECTION:
> _dmarc.casema.nl.	3600	IN	TXT	"v=3DDMARC1; p=3Dreject; rua=3Dmailto:jn2=
qdxcl@ag.dmarcian.eu; ruf=3Dmailto:jn2qdxcl@fr.dmarcian.eu; fo=3D1; adkim=
=3Ds; aspf=3Ds;"

They say, reject every mail that is supposed to come from casema.nl but
was sent from a server not being part of this domain.

The user xyz@casema.nl sent a mail to the mailinglist, the ML server
sends the mail to various recipients. The ML server is not part of
casema.nl.

The receiving mailservers ask the nameservers of casema.nl who is
allowed to send mails in the name of casema.nl. Because the mailserver
of the mailinglist is not, they reject the mail.


Alles Gute

Christof Thalhofer

--=20
Dies ist keine Signatur


--OvDhTePYxyA21n38k7UTAc5eWkGSw17cV--

--IdxAucuQIokUsZD2Jdy5BNSjSh4uXirlr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEp/QSihTiBGN70hb+5r9EJtW1vzUFAl5dpoIACgkQ5r9EJtW1
vzWP5xAAuZaqvLRN3/HoEl4/+5Zc1goN6aqbGuddb//sTkIIjif4XXJB46kyEUJw
UDXFvaD3JFDn5WCFV8a1aDip38H5C0ttzV3oKNQkuXQXZx01fcxTDdxqrHoxDGxh
kEH9mAH89O7m6bEhrWC8bJ5PlVS+Il7hc0h7LUizFtuf3SNe3qwUbJ/3IfBsUs1d
UJX8a+l0fAJJjBSvxajX6AAm6WRGZd2b/p0twXAgCz6+4E+ndFk+PATOwATp09pE
AQz9GVmbiWoQgVf9V8CAST2ZHytvWBeKhpPPCPXiURNVRwhYqLLDQw8GhF67EaC2
i4fRQ+0OU0wm4XAMTTxNJxnSoZpoHio21moAJkXvU/ENmE+QM9QMZyCVBX3OR8Ct
qhpDJej+O6XOBQya3g9YJpLhM8mo3aVXiOaWfGWdz54GY2G7SKn5QRQbtVyVzC9U
l+RMmbvtC0awT9nMU/SLxwLaIMvuvjPdWjkgAu6b3xZmEOpNXxEKmDa3bCBrsBJf
dpmx8dCWP855777XgYGu3ByPlk4wY4IPWaoG3xuduQQkwMT3Hjh0M2jaFOJA/tHu
Uij18RYu7kvI/8c3+Nbh/ac39R7oUH193CS2SU6ptkl3JvoGuQCuzpMZqms2EG0B
MgIhYRB7FVOrnRO6xAz261HwAUIjI1hV2aPxPRsOliB0okOE4pQ=
=7eIM
-----END PGP SIGNATURE-----

--IdxAucuQIokUsZD2Jdy5BNSjSh4uXirlr--

