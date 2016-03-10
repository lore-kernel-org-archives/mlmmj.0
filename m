From: Sebastian Wolfgarten <sebastian@wolfgarten.com>
Date: Thu, 10 Mar 2016 21:56:12 +0000
Subject: [mlmmj] Diagnostic-Code: x-unix; internal software error / Command time limit exceeded: "/usr/local/
Message-Id: <266C729B-6A87-42DA-A5F3-AAB5827EE39E@wolfgarten.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail=_B14F62B5-B7E5-45EA-80AD-B1D471C78CA1"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--Apple-Mail=_B14F62B5-B7E5-45EA-80AD-B1D471C78CA1
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_AD674920-DAEA-4AA5-9178-F31662827A41"


--Apple-Mail=_AD674920-DAEA-4AA5-9178-F31662827A41
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi,

I am running mlmmi 1.2.17.1 on FreeBSD 10 and I have come across a very =
strange issue similar to the one described by a guy in December last =
year (see http://mlmmj.org/archive/mlmmj/2015-12/0000000.html =
<http://mlmmj.org/archive/mlmmj/2015-12/0000000.html>).

Basically I have a mailing list (besides many others that are working =
fine!) for which some people receive emails, others are not getting any =
messages. The moderators are sometimes also getting no messages to =
approve or they do receive the following error:

=E2=80=94

This is the mail system at host waldfest.wolfgarten.com.

I'm sorry to have to inform you that your message could not
be delivered to one or more recipients. It's attached below.

For further assistance, please send mail to postmaster.

If you do so, please include this problem report. You can
delete your own text from the attached returned message.

                   The mail system

<elsaalumni.de--newsletter+moderate-7d4f69f9439871f4@localhost.mlmmj>: =
Command
    time limit exceeded: "/usr/local/bin/mlmmj-recieve"

--

Alternatively I have had situations, in which I am getting the =
=E2=80=9Ex-unix; internal software error=E2=80=9C message - anyone seen =
the same?

In the logs I cannot find anything which looks like an error - any ideas =
on how to best troubleshoot this?

Thanks.

Best regards
Sebastian




--Apple-Mail=_AD674920-DAEA-4AA5-9178-F31662827A41
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D"">Hi,<div class=3D""><br class=3D""></div><div class=3D"">I am =
running mlmmi&nbsp;1.2.17.1 on FreeBSD 10 and I have come across a very =
strange issue similar to the one described by a guy in December last =
year (see <a href=3D"http://mlmmj.org/archive/mlmmj/2015-12/0000000.html" =
class=3D"">http://mlmmj.org/archive/mlmmj/2015-12/0000000.html</a>).</div>=
<div class=3D""><br class=3D""></div><div class=3D"">Basically I have a =
mailing list (besides many others that are working fine!) for which some =
people receive emails, others are not getting any messages. The =
moderators are sometimes also getting no messages to approve or they do =
receive the following error:</div><div class=3D""><br =
class=3D""></div><div class=3D"">=E2=80=94</div><div class=3D""><br =
class=3D""></div><div class=3D"">This is the mail system at host <a =
href=3D"http://waldfest.wolfgarten.com" =
class=3D"">waldfest.wolfgarten.com</a>.<br class=3D""><br class=3D"">I'm =
sorry to have to inform you that your message could not<br class=3D"">be =
delivered to one or more recipients. It's attached below.<br =
class=3D""><br class=3D"">For further assistance, please send mail to =
postmaster.<br class=3D""><br class=3D"">If you do so, please include =
this problem report. You can<br class=3D"">delete your own text from the =
attached returned message.<br class=3D""><br class=3D"">&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;The mail =
system<br class=3D""><br class=3D"">&lt;<a =
href=3D"mailto:elsaalumni.de--newsletter+moderate-7d4f69f9439871f4@localho=
st.mlmmj" =
class=3D"">elsaalumni.de--newsletter+moderate-7d4f69f9439871f4@localhost.m=
lmmj</a>&gt;: Command<br class=3D"">&nbsp; &nbsp; time limit exceeded: =
"/usr/local/bin/mlmmj-recieve"<br class=3D""><br class=3D"">--</div><div =
class=3D""><br class=3D""></div><div class=3D"">Alternatively I have had =
situations, in which I am getting the =E2=80=9Ex-unix; internal software =
error=E2=80=9C message - anyone seen the same?&nbsp;</div><div =
class=3D""><br class=3D""></div><div class=3D"">In the logs I cannot =
find anything which looks like an error - any ideas on how to best =
troubleshoot this?</div><div class=3D""><br class=3D""></div><div =
class=3D"">Thanks.</div><div class=3D""><br class=3D""></div><div =
class=3D"">Best regards</div><div class=3D"">Sebastian</div><div =
class=3D""><br class=3D""></div><div class=3D""><br class=3D""></div><div =
class=3D""><br class=3D""></div></body></html>=

--Apple-Mail=_AD674920-DAEA-4AA5-9178-F31662827A41--

--Apple-Mail=_B14F62B5-B7E5-45EA-80AD-B1D471C78CA1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW4e19AAoJEKIH+IvLUCrDQW0QAJ6I3h8lGkFqeUlOtFRcYmzn
hADq+rWC2LPdgI40BA/acWhQ40sPK3kz3o+KSHALvL9Gjm6fn0vJwlIgorSEd70w
LvZqHgLbi0suQp0tuRWRQk41equm+ri3Sq82ZAbqilbJCJv2uCxi7VJ84+J6uf+0
9quucXhZb0q7ZXaQpLOlSmEv20ZzgflCZC7vjumfyK/DqtloUfGQcX63m6RhztpT
Xi82O7rEkcy8upiYMV8Yteh/Pz/c/H01JK5cQaZMI8kOJfq4suS2hsTCWnQaSxB5
o8MPPfoGSVcieXILtyGSF19ulCOqRsfQZTXAughQhz4x+e1NR+RF/a0APjeigTYh
Tl8vx845HGSQuIw9tymOPdNqjg3EeM5I2YG87zE5xluBspcgLj+eg8P6elfCYT9N
IA8DLdD6bx4LR6deYq9vT1mgOYaKO02GeNWrF53rvwcCGTJz/xhuUVdZby3dhJyk
+8K64DfPc4HOa6isjmYxkmgUBY8Rv/PesL7t3Xjm7i/lh0QrjgEDsBoQ6jzuGvC7
D3MUZbV/W2tNjmr2v/Akdq5T82cxISpmexnfXsuQXlLPYK1iyDWsCuchQlkwnDOk
IbYMpSg4q/ZS4nszH3uOCLpEZQO32QpiklWKHgEJ+UvsUWh+56OqPposQNjC6PHw
AX0yX7PrPxLMlKrc5DYO
=wwbe
-----END PGP SIGNATURE-----

--Apple-Mail=_B14F62B5-B7E5-45EA-80AD-B1D471C78CA1--

