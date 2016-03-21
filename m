From: Sebastian Wolfgarten <sebastian@wolfgarten.com>
Date: Mon, 21 Mar 2016 21:07:34 +0000
Subject: Re: [mlmmj] Diagnostic-Code: x-unix; internal software error / Command time limit exceeded: "/usr/lo
Message-Id: <1F39E8AA-0ACA-4FA2-9F26-B9F32AFF2FDF@wolfgarten.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail=_CE566239-0796-4AE6-9803-DE1F02A64142"
List-Id: <mlmmj.mlmmj.org>
References: <266C729B-6A87-42DA-A5F3-AAB5827EE39E@wolfgarten.com>
In-Reply-To: <266C729B-6A87-42DA-A5F3-AAB5827EE39E@wolfgarten.com>
To: mlmmj@mlmmj.org


--Apple-Mail=_CE566239-0796-4AE6-9803-DE1F02A64142
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Dear Ben,

many thanks for following this up - I have largely increased the =
command_time_limit to 3000s, let=E2=80=99s see whether this fixes the =
issue. However I am confident it does.

Again, many thanks.

Best regards
Sebastian

> Am 20.03.2016 um 23:52 schrieb Ben Schmidt =
<mail_ben_schmidt@yahoo.com.au>:
>=20
> Hi, Sebastian,
>=20
> Yes, your config looks OK.
>=20
> I think your answer might be here:
>=20
> http://www.postfix.org/postconf.5.html#command_time_limit
>=20
> A default of 1000 seconds would correspond roughly to Christian's =
report of "20 minutes later" as 1000 seconds is 16m40s.
>=20
> Perhaps have a look with `postconf' to see if that value is still in =
place.
>=20
> It can be overridden in a transport-specific way, too:
>=20
> http://www.postfix.org/postconf.5.html#transport_time_limit
>=20
> (I guess this means the directive would be mlmmj_time_limit in your =
case.)
>=20
> Again, perhaps check with postconf.
>=20
> I would expect you to see *something* in your mail.log about this. =
Perhaps grep it for "time limit exceeded" because I believe it might be =
just hidden at the end of a line about an attempted delivery, e.g. I =
found a similar report at =
<http://www-01.ibm.com/support/docview.wss?uid=3Dswg21503353> where the =
log line in question was
>=20
> Jun 20 09:39:18 postfix/pipe[11451]: 6ED022391325: =
to=3D<recipient@example.com>, relay=3Dfilter, delay=3D302, =
status=3Dbounced (Command time limit exceeded: =
"/tmp/etc/postfix/wvpostqfilter")
>=20
> It would probably be worth having a bit of a fish around to see if you =
can find those messages, though I doubt they give all that much =
additional information above what you already know.
>=20
> Perhaps a next step would be to see if (in a dummy list and/or with a =
dummy transport) you can make it worse and get the same result if you =
decrease the configuration.
>=20
> You may also want to ask the question as to whether your list is large =
enough and your system loaded enough that it warrants such a large =
delivery time. Perhaps something unrelated is going on on the server =
that is causing it to be slower than it should be and some general =
monitoring is in order.
>=20
> Does that help?
>=20
> Ben
>=20
>=20
>=20
> On 17/03/2016 7:22 am, Sebastian Wolfgarten wrote:
>> Dear Ben,
>>=20
>> thanks for listening and following up! I am happy to contribute to =
finding the root cause of this (potential) issue.
>>=20
>> Here is a quick overview of what I have:
>>=20
>> FreeBSD 10.1 (AMD64)
>> Postfix 3.1.0
>> mlmmj 1.2.17.1
>>=20
>> So overall, pretty standard and nothing extraordinary I would say. =
Here is an overview of my config (basically taken from =
http://mlmmj.org/docs/readme-postfix/):
>>=20
>> =E2=80=94
>>=20
>> 1) Create mlmmi user
>> # id mlmmj
>> uid=3D1021(mlmmj) gid=3D1021(mlmmj) groups=3D1021(mlmmi)
>>=20
>> 2) Create home dir and give it to mlmmi user
>>=20
>> # ls -la /var/spool
>> (=E2=80=A6)
>> drwxr-xr-x  33 mlmmj  mlmmj   45 21 Okt 22:38 mlmmj
>>=20
>> 3) Amend configuration of Postfix's master.cf
>>=20
>> # grep mlmmj /etc/postfix/master.cf
>> # mlmmj mailing lists
>> mlmmj   unix  -       n       n       -       -       pipe
>>    flags=3DDORhu user=3Dmlmmj argv=3D/usr/local/bin/mlmmj-recieve -F =
-L /var/spool/mlmmj/$nexthop
>>=20
>> 4) Amend main.cf of Postfix
>>=20
>> # grep mlmmj /etc/postfix/main.cf
>> virtual_alias_maps =3D =
hash:/etc/postfix/virtual,hash:/var/spool/mlmmj/virtual,mysql:/etc/postfix=
/mysql_virtual_alias_maps.cf
>> transport_maps =3D =
regexp:/etc/postfix/transport,hash:/var/spool/mlmmj/transport
>> mlmmj_destination_recipient_limit =3D 1
>> recipient_delimiter =3D +
>>=20
>> 5) Create file system structure for mailing list (flat file =
structure):
>>=20
>> # ls -la /var/spool/mlmmj/newsletter
>> total 77
>> drwxr-xr-x  15 mlmmj  mlmmj    17  8 Nov 15:14 .
>> drwxr-xr-x  33 mlmmj  mlmmj    45 21 Okt 22:38 ..
>> drwxr-xr-x   2 mlmmj  mlmmj    14 11 Jan 18:06 archive
>> drwxr-xr-x   2 mlmmj  mlmmj   140  4 M=C3=A4r 22:04 bounce
>> drwxr-xr-x   2 mlmmj  mlmmj     7 28 Sep 22:39 control
>> drwxr-xr-x   2 mlmmj  mlmmj     2  7 Sep  2015 digesters.d
>> drwxr-xr-x   2 mlmmj  mlmmj     2 10 M=C3=A4r 21:26 incoming
>> -rw-r--r--   1 mlmmj  mlmmj     2  4 M=C3=A4r 21:33 index
>> -rw-------   1 mlmmj  mlmmj  1234  4 M=C3=A4r 21:33 =
mlmmj.operation.log
>> drwxr-xr-x   2 mlmmj  mlmmj    12 10 M=C3=A4r 21:26 moderation
>> drwxr-xr-x   2 mlmmj  mlmmj     2  7 Sep  2015 nomailsubs.d
>> drwxr-xr-x   3 mlmmj  mlmmj     3 10 M=C3=A4r 21:26 queue
>> drwxr-xr-x   2 mlmmj  mlmmj     2  7 Sep  2015 requeue
>> drwxr-xr-x   2 mlmmj  mlmmj     2  7 Sep  2015 subconf
>> drwxr-xr-x   2 mlmmj  mlmmj    27  7 M=C3=A4r 06:13 subscribers.d
>> drwxr-xr-x   2 mlmmj  mlmmj    36  7 Sep  2015 text
>> drwxr-xr-x   2 mlmmj  mlmmj     2  7 Sep  2015 unsubconf
>>=20
>> Note: In the operation.log there is nothing to suggest why the =
mailing list is malfunctioning sometimes.
>>=20
>> 6) Creation/amendment of transport and virtual file for mlmmj and =
Postfix integration:
>>=20
>> # grep newsletter /var/spool/mlmmj/transport
>> elsaalumni.de--newsletter@localhost.mlmmj   mlmmj:newsletter
>>=20
>> # grep newsletter /var/spool/mlmmj/virtual
>> newsletter@elsaalumni.de    elsaalumni.de--newsletter@localhost.mlmmj
>>=20
>> 7) Postmapping and then postfix restart
>>=20
>> # postmap /var/spool/mlmmj/virtual
>> # postmap /var/spool/mlmmj/transport
>> # postfix reload
>>=20
>> --
>>=20
>> First question: I assume the config is correct, right?
>>=20
>> Secondly, yes I checked all file permissions and they should be fine =
too.
>>=20
>> Now the question is: How can I best troubleshoot the issue? Any =
further suggestions on where to look for a root cause? My mail logs did =
not really contain any further information.
>>=20
>> Many thanks.
>>=20
>> Best regards
>> Sebastian
>>=20
>>> Am 14.03.2016 um 03:35 schrieb Ben Schmidt =
<mail_ben_schmidt@yahoo.com.au>:
>>>=20
>>> I'm listening, I'm just a bit stumped.
>>>=20
>>> I feel like if this was an Mlmmj bug, it would've manifested long =
ago. Nothing I know of has changed Mlmmj-wise, but this problem has just =
appeared in the last three months or so.
>>>=20
>>> I wonder if something has changed recently in a relevant platform or =
MTA.
>>>=20
>>> Could you confirm your Mlmmj, OS and MTA versions, and anything else =
you feel might be relevant about your environment?
>>>=20
>>> It seems that something is enforcing a command time limit. Not sure =
if it's via the kernel or not, but I guess it's initiated if not =
enforced by the shell or MTA.
>>>=20
>>> Ben
>>>=20
>>>=20
>>>=20
>>> On 14/03/2016 6:45 am, sebastian@wolfgarten.com wrote:
>>>> (Resending message to see whether there is anyone who has seen this =
issue before
>>>> or can tell me how to troubleshoot this - thanks. And sorry for the =
double-posting.)
>>>>=20
>>>> Hi,
>>>>=20
>>>> I am running mlmmi 1.2.17.1 on FreeBSD 10 and I have come across a =
very strange
>>>> issue similar to the one described by a guy in December last year =
(see
>>>> http://mlmmj.org/archive/mlmmj/2015-12/0000000.html).
>>>> Basically I have a mailing list (besides many others that are =
working fine!) for
>>>> which some people receive emails, others are not getting any =
messages. The
>>>> moderators are sometimes also getting no messages to approve or =
they do receive
>>>> the following error:
>>>> =E2=80=94
>>>> This is the mail system at host waldfest.wolfgarten.com
>>>> <http://waldfest.wolfgarten.com>.
>>>>=20
>>>> I'm sorry to have to inform you that your message could not
>>>> be delivered to one or more recipients. It's attached below.
>>>>=20
>>>> For further assistance, please send mail to postmaster.
>>>>=20
>>>> If you do so, please include this problem report. You can
>>>> delete your own text from the attached returned message.
>>>>=20
>>>>                    The mail system
>>>>=20
>>>> =
<elsaalumni.de--newsletter+moderate-7d4f69f9439871f4@localhost.mlmmj
>>>> =
<mailto:elsaalumni.de--newsletter+moderate-7d4f69f9439871f4@localhost.mlmm=
j>>: Command
>>>>     time limit exceeded: "/usr/local/bin/mlmmj-recieve"
>>>>=20
>>>> --
>>>> Alternatively I have had situations, in which I am getting the =
=E2=80=9Ex-unix; internal
>>>> software error" message - anyone seen the same?
>>>> In the logs I cannot find anything which looks like an error - any =
ideas on how to
>>>> best troubleshoot this?
>>>> Thanks.
>>>> Best regards
>>>> Sebastian
>>=20
>=20
>=20


--Apple-Mail=_CE566239-0796-4AE6-9803-DE1F02A64142
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW8GKXAAoJEKIH+IvLUCrDXxwP/imA1gy98Gfkac4illjC7pJN
1SS84KYVmzaRP1cAN0LXS/Tj7e26IvSy+9k1wQwQGa4XhjNZzewTu1FbRilNSLlW
HlzbWAMxDzkGVRVtXFYc+P8l+Nr7KI5pGbySV9mf199XJpj/lQgGyK6juf712m8C
XazXfjIceME2edUXFLEJHKAUrH16oINy1PCyd51AxuQK4bHHTRfOuzefe3dg9+Kk
0hv7G5Mm2cflj10kGtGlV7OCmBcX3t5jn3kDtvmfWVEUC+QHrP7DBtnd9dTsvX+i
UTSc7Wx7V1Pdz1bF6tmSgXeWyi5cjb7Q9mdQ8YzWWNWxEll3Ct314vVpZss3acv9
CCmfbB7/9PIww8e9ntv/z5qu+dyw0JItkWWdhLmhL01Qj0UCQtHSleOGxlP72MxA
n0SDt84WcmtRLTkHEdLw25K0OwDUGse1lscEMeyKPH/Yex99k6tgOGBLl/S4wKTD
uOxF5s+h6y5upASAsjAnoCaJAp239jShxT+QHtGvsZn/4fmzB6asRqPDeoq7DzaW
Q4WZR/prqf0pXSt+kvkj2LSeLzWAN+lP/LI78cAYHK8pxlKfNJrvIomIcElkPF8H
NzgN9yRwMp5lr9bwaaLE9Tjxu435K55dMBE87xdwyDnydeUqlVd3I4UGOGL6VPse
tiOKh94NliIflIs+iVVs
=/+LC
-----END PGP SIGNATURE-----

--Apple-Mail=_CE566239-0796-4AE6-9803-DE1F02A64142--

