From: Sebastian Wolfgarten <sebastian@wolfgarten.com>
Date: Wed, 16 Mar 2016 20:22:54 +0000
Subject: Re: [mlmmj] Diagnostic-Code: x-unix; internal software error / Command time limit exceeded: "/usr/lo
Message-Id: <C19659E5-A54B-43D4-8EFB-A83313DCFACD@wolfgarten.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail=_611E3FD0-0270-45E4-AB3D-AFD6EFC93FDB"
List-Id: <mlmmj.mlmmj.org>
References: <266C729B-6A87-42DA-A5F3-AAB5827EE39E@wolfgarten.com>
In-Reply-To: <266C729B-6A87-42DA-A5F3-AAB5827EE39E@wolfgarten.com>
To: mlmmj@mlmmj.org


--Apple-Mail=_611E3FD0-0270-45E4-AB3D-AFD6EFC93FDB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Dear Ben,

thanks for listening and following up! I am happy to contribute to =
finding the root cause of this (potential) issue.

Here is a quick overview of what I have:

FreeBSD 10.1 (AMD64)
Postfix 3.1.0
mlmmj 1.2.17.1

So overall, pretty standard and nothing extraordinary I would say. Here =
is an overview of my config (basically taken from =
http://mlmmj.org/docs/readme-postfix/):

=E2=80=94

1) Create mlmmi user
# id mlmmj
uid=3D1021(mlmmj) gid=3D1021(mlmmj) groups=3D1021(mlmmi)

2) Create home dir and give it to mlmmi user

# ls -la /var/spool
(=E2=80=A6)
drwxr-xr-x  33 mlmmj  mlmmj   45 21 Okt 22:38 mlmmj

3) Amend configuration of Postfix's master.cf

# grep mlmmj /etc/postfix/master.cf
# mlmmj mailing lists
mlmmj   unix  -       n       n       -       -       pipe
   flags=3DDORhu user=3Dmlmmj argv=3D/usr/local/bin/mlmmj-recieve -F -L =
/var/spool/mlmmj/$nexthop

4) Amend main.cf of Postfix

# grep mlmmj /etc/postfix/main.cf
virtual_alias_maps =3D =
hash:/etc/postfix/virtual,hash:/var/spool/mlmmj/virtual,mysql:/etc/postfix=
/mysql_virtual_alias_maps.cf
transport_maps =3D =
regexp:/etc/postfix/transport,hash:/var/spool/mlmmj/transport
mlmmj_destination_recipient_limit =3D 1
recipient_delimiter =3D +

5) Create file system structure for mailing list (flat file structure):

# ls -la /var/spool/mlmmj/newsletter
total 77
drwxr-xr-x  15 mlmmj  mlmmj    17  8 Nov 15:14 .
drwxr-xr-x  33 mlmmj  mlmmj    45 21 Okt 22:38 ..
drwxr-xr-x   2 mlmmj  mlmmj    14 11 Jan 18:06 archive
drwxr-xr-x   2 mlmmj  mlmmj   140  4 M=C3=A4r 22:04 bounce
drwxr-xr-x   2 mlmmj  mlmmj     7 28 Sep 22:39 control
drwxr-xr-x   2 mlmmj  mlmmj     2  7 Sep  2015 digesters.d
drwxr-xr-x   2 mlmmj  mlmmj     2 10 M=C3=A4r 21:26 incoming
-rw-r--r--   1 mlmmj  mlmmj     2  4 M=C3=A4r 21:33 index
-rw-------   1 mlmmj  mlmmj  1234  4 M=C3=A4r 21:33 mlmmj.operation.log
drwxr-xr-x   2 mlmmj  mlmmj    12 10 M=C3=A4r 21:26 moderation
drwxr-xr-x   2 mlmmj  mlmmj     2  7 Sep  2015 nomailsubs.d
drwxr-xr-x   3 mlmmj  mlmmj     3 10 M=C3=A4r 21:26 queue
drwxr-xr-x   2 mlmmj  mlmmj     2  7 Sep  2015 requeue
drwxr-xr-x   2 mlmmj  mlmmj     2  7 Sep  2015 subconf
drwxr-xr-x   2 mlmmj  mlmmj    27  7 M=C3=A4r 06:13 subscribers.d
drwxr-xr-x   2 mlmmj  mlmmj    36  7 Sep  2015 text
drwxr-xr-x   2 mlmmj  mlmmj     2  7 Sep  2015 unsubconf

Note: In the operation.log there is nothing to suggest why the mailing =
list is malfunctioning sometimes.

6) Creation/amendment of transport and virtual file for mlmmj and =
Postfix integration:

# grep newsletter /var/spool/mlmmj/transport
elsaalumni.de--newsletter@localhost.mlmmj   mlmmj:newsletter

# grep newsletter /var/spool/mlmmj/virtual
newsletter@elsaalumni.de    elsaalumni.de--newsletter@localhost.mlmmj

7) Postmapping and then postfix restart

# postmap /var/spool/mlmmj/virtual
# postmap /var/spool/mlmmj/transport
# postfix reload

--

First question: I assume the config is correct, right?

Secondly, yes I checked all file permissions and they should be fine =
too.

Now the question is: How can I best troubleshoot the issue? Any further =
suggestions on where to look for a root cause? My mail logs did not =
really contain any further information.

Many thanks.

Best regards
Sebastian

> Am 14.03.2016 um 03:35 schrieb Ben Schmidt =
<mail_ben_schmidt@yahoo.com.au>:
>=20
> I'm listening, I'm just a bit stumped.
>=20
> I feel like if this was an Mlmmj bug, it would've manifested long ago. =
Nothing I know of has changed Mlmmj-wise, but this problem has just =
appeared in the last three months or so.
>=20
> I wonder if something has changed recently in a relevant platform or =
MTA.
>=20
> Could you confirm your Mlmmj, OS and MTA versions, and anything else =
you feel might be relevant about your environment?
>=20
> It seems that something is enforcing a command time limit. Not sure if =
it's via the kernel or not, but I guess it's initiated if not enforced =
by the shell or MTA.
>=20
> Ben
>=20
>=20
>=20
> On 14/03/2016 6:45 am, sebastian@wolfgarten.com wrote:
>> (Resending message to see whether there is anyone who has seen this =
issue before
>> or can tell me how to troubleshoot this - thanks. And sorry for the =
double-posting.)
>>=20
>> Hi,
>>=20
>> I am running mlmmi 1.2.17.1 on FreeBSD 10 and I have come across a =
very strange
>> issue similar to the one described by a guy in December last year =
(see
>> http://mlmmj.org/archive/mlmmj/2015-12/0000000.html).
>> Basically I have a mailing list (besides many others that are working =
fine!) for
>> which some people receive emails, others are not getting any =
messages. The
>> moderators are sometimes also getting no messages to approve or they =
do receive
>> the following error:
>> =E2=80=94
>> This is the mail system at host waldfest.wolfgarten.com
>> <http://waldfest.wolfgarten.com>.
>>=20
>> I'm sorry to have to inform you that your message could not
>> be delivered to one or more recipients. It's attached below.
>>=20
>> For further assistance, please send mail to postmaster.
>>=20
>> If you do so, please include this problem report. You can
>> delete your own text from the attached returned message.
>>=20
>>                    The mail system
>>=20
>> <elsaalumni.de--newsletter+moderate-7d4f69f9439871f4@localhost.mlmmj
>> =
<mailto:elsaalumni.de--newsletter+moderate-7d4f69f9439871f4@localhost.mlmm=
j>>: Command
>>     time limit exceeded: "/usr/local/bin/mlmmj-recieve"
>>=20
>> --
>> Alternatively I have had situations, in which I am getting the =
=E2=80=9Ex-unix; internal
>> software error" message - anyone seen the same?
>> In the logs I cannot find anything which looks like an error - any =
ideas on how to
>> best troubleshoot this?
>> Thanks.
>> Best regards
>> Sebastian


--Apple-Mail=_611E3FD0-0270-45E4-AB3D-AFD6EFC93FDB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW6cCfAAoJEKIH+IvLUCrDKt4P+wQerhbbanwLaze1Ww0cGkB1
jqFWMxuyogqiVhEndK+Zd5B2llZJI2UEFHR+14SiiHLvfGtKHcxzDvFU0dEs1VNu
JYUt4N8WD1tmZ0qAq1e3DuXi7lqW0sXjZeGZQBLpEANSWP49tE2qq4WbYJ5b2ul7
aeAVDQiTgAKh/HbtAVs2/trzvf0oYHfc8Hxgh+04EIypjRmDCt+V33uBy8Fv/KMP
K2yHw10QJRjhOb0yJs5iDnf3r8WxFG8GMVRHIihQpAiriSlajd1JeUriMelz9fyB
HIIMFvfyv+9iqQgRXBdu8BsJoFOfO2+YpywBcqgvAJ45Na9rle7V3OXQ1pw9de/Z
I3d08AYLaOb5K8pLM7bLxt38VjUJthaFP3pX7uHkS7YgYzyOOWVg3WISWiWQ0SeD
gW74R/er/UFGXnoSe/GXLTQ1Hwk+7Mpsvr59YAyA4v9svvYKgiOPy/xS9MjdmGFO
GazpZ7vkATVyV9kZR6dWRfwgzCRIMxjlaIaPKHvrkMNUea+xoSymksjV/2iTX3MN
PZj3ocHEMnTro5q8c1U9/UQwbSXFFgh9ViEVe+ycVMC/7AP7IQPZBadLKouYKLLP
ygqzcU4zoUCp0b8w1CxhQ8q3fyKYSdV7zwU4+rGIBExTPfKlsrAm5VaGdm7YNQaW
vKDKoyuq16eb14RpGDNF
=w+xk
-----END PGP SIGNATURE-----

--Apple-Mail=_611E3FD0-0270-45E4-AB3D-AFD6EFC93FDB--

