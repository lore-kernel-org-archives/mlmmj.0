From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Wed, 08 Feb 2023 11:03:32 +0000
Subject: Re: [mlmmj] Candidate for an 1.4.0.a1, glad for the work
Message-Id: <f926ab624b21795a61220649ae6600e6b1d0aad8.camel@telenet.be>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-HYZ1zK/QCdXswGnWTOR4"
List-Id: <mlmmj.mlmmj.org>
References: <572dfe82-87b0-f959-f174-0944c5658199@coredump.us>
In-Reply-To: <572dfe82-87b0-f959-f174-0944c5658199@coredump.us>
To: mlmmj@mlmmj.org

--=-HYZ1zK/QCdXswGnWTOR4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For those interested: I updated the php interface to work with 8.* ,
and added small extra functionality:
- edit the text files
- see the log
- use 2 extra configs to limit the people who can access the php admin
itf and/or who can manage the subscribers

I also did my interpretation of an archiver, simple but it works (on
linux) using mhonarc and php (control file 'webarchive' to activate
archiving per list), and 'webarchiveprotected' to limit who can access
the archive. A small demo:=C2=A0https://lists.belnet.be/archive/

Franky

On Wed, 2023-02-08 at 07:44 +0000, Chris Knadle wrote:
> Greetings.
>=20
> I want to give anyone working on the 1.4.0.a1 mlmmj candidate my
> thanks, it's=20
> good to see that this work is going on, and I'm looking forward to
> packaging it=20
> and other pieces for it for Debian when it's in a semi-stable/usable
> state.
>=20
> I'm personally interested in an mlmmj-archiver web indexing program,
> because=20
> I've had difficulties with other mailing list archivers. Lurker works
> but seemed=20
> relatively inflexible, and Mhonarc required a fair bit of
> configuration and I=20
> never did figure out its configuration language. Debian mailing lists
> are=20
> archived in Mhonarc but I don't currently have access to the
> configuration used=20
> for those.
>=20
> Re: using the mlmmj name, my only thought is perhaps a minor addition
> to the=20
> name to distinguish the fork, such as mlmmj-ng (next-generation) or
> mlmmj2. It's=20
> not a requirement, it's just mentioning what I typically see other
> projects do.=20
> I think the idea is to cover the possibility of upstream picking up
> their old=20
> project again and/or avoiding old/new naming clashes. If the old/same
> name is=20
> stuck with I don't have any objection.
>=20
> Just in case I don't check the mailing list often enough: when you
> think the=20
> program is in a buildable/usable enough state for being packaged and
> uploaded to=20
> Debian, please ping me via email.
>=20
> Thanks
> =C2=A0=C2=A0=C2=A0 -- Chris
>=20
> --=20
> Chris Knadle
> Chris.Knadle@coredump.us
>=20
> Baptiste Daroussin:
> > Hello everyone,
> >=20
> > A 1.5 years ago, I migrated FreeBSD's mailing list to mlmmj. So far
> > so good we
> > are very happy with it.
> >=20
> > Since that date I have been working on modernizing mlmmj codebase,
> > integrate our
> > patches etc. While the work is clearly not done, I think it is
> > advanced enough
> > for it to be shared.
>=20
>=20
>=20

--=-HYZ1zK/QCdXswGnWTOR4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>For those interested: I updated the php inter=
face to work with 8.* , and added small extra functionality:</div><div>- ed=
it the text files</div><div>- see the log</div><div>- use 2 extra configs t=
o limit the people who can access the php admin itf and/or who can manage t=
he subscribers</div><div><br></div><div>I also did my interpretation of an =
archiver, simple but it works (on linux) using mhonarc and php (control fil=
e 'webarchive' to activate archiving per list), and 'webarchiveprotected' t=
o limit who can access the archive. A small demo:&nbsp;<a href=3D"https://l=
ists.belnet.be/archive/">https://lists.belnet.be/archive/</a></div><div><sp=
an></span></div><div><br></div><div>Franky</div><div><br></div><div>On Wed,=
 2023-02-08 at 07:44 +0000, Chris Knadle wrote:</div><blockquote type=3D"ci=
te" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:=
1ex"><div>Greetings.<br></div><div><br></div><div>I want to give anyone wor=
king on the 1.4.0.a1 mlmmj candidate my thanks, it's <br></div><div>good to=
 see that this work is going on, and I'm looking forward to packaging it <b=
r></div><div>and other pieces for it for Debian when it's in a semi-stable/=
usable state.<br></div><div><br></div><div>I'm personally interested in an =
mlmmj-archiver web indexing program, because <br></div><div>I've had diffic=
ulties with other mailing list archivers. Lurker works but seemed <br></div=
><div>relatively inflexible, and Mhonarc required a fair bit of configurati=
on and I <br></div><div>never did figure out its configuration language. De=
bian mailing lists are <br></div><div>archived in Mhonarc but I don't curre=
ntly have access to the configuration used <br></div><div>for those.<br></d=
iv><div><br></div><div>Re: using the mlmmj name, my only thought is perhaps=
 a minor addition to the <br></div><div>name to distinguish the fork, such =
as mlmmj-ng (next-generation) or mlmmj2. It's <br></div><div>not a requirem=
ent, it's just mentioning what I typically see other projects do. <br></div=
><div>I think the idea is to cover the possibility of upstream picking up t=
heir old <br></div><div>project again and/or avoiding old/new naming clashe=
s. If the old/same name is <br></div><div>stuck with I don't have any objec=
tion.<br></div><div><br></div><div>Just in case I don't check the mailing l=
ist often enough: when you think the <br></div><div>program is in a buildab=
le/usable enough state for being packaged and uploaded to <br></div><div>De=
bian, please ping me via email.<br></div><div><br></div><div>Thanks<br></di=
v><div>&nbsp;&nbsp;&nbsp; -- Chris<br></div><div><br></div><div>-- <br></di=
v><div>Chris Knadle<br></div><div><a href=3D"mailto:Chris.Knadle@coredump.u=
s">Chris.Knadle@coredump.us</a><br></div><div><br></div><div>Baptiste Darou=
ssin:<br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border=
-left:2px #729fcf solid;padding-left:1ex"><div>Hello everyone,<br></div><di=
v><br></div><div>A 1.5 years ago, I migrated FreeBSD's mailing list to mlmm=
j. So far so good we<br></div><div>are very happy with it.<br></div><div><b=
r></div><div>Since that date I have been working on modernizing mlmmj codeb=
ase, integrate our<br></div><div>patches etc. While the work is clearly not=
 done, I think it is advanced enough<br></div><div>for it to be shared.<br>=
</div></blockquote><div><br></div><div><br></div><div><br></div></blockquot=
e></body></html>

--=-HYZ1zK/QCdXswGnWTOR4--

