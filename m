From: Per Jessen <per@opensuse.org>
Date: Tue, 16 Jun 2020 09:19:05 +0000
Subject: Re: [mlmmj] access::Deny seems to have stopped working ?
Message-Id: <5EE88E89.4040704@opensuse.org>
List-Id: <mlmmj.mlmmj.org>
References: <rc5bj1$gl8$1@saturn.local.net>
In-Reply-To: <rc5bj1$gl8$1@saturn.local.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Roderick wrote:

> On Tue, 16 Jun 2020, Per Jessen wrote:
>=20
>> This morning I added some debug output to mlmmj-process - the reason
>> the "deny" above isn't working is simply that MIME headers in the email
>> body are not being tested :-)
>>
>> I guess our many 'deny' rules (to refuse various attachments) quite
>> simply _never_ worked.
>=20
> Is that really the case?=20

As far as I can tell from the source code and my debugging, yes - headers a=
re=20
only collected until the empty line between header and body.

I don't know if there is any other way.


--=20
Per Jessen, Z=FCrich (19.2=B0C)
Member, openSUSE Heroes


