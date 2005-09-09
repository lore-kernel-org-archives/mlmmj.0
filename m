From: Jason Diamond <jason@diamond.name>
Date: Fri, 09 Sep 2005 14:50:31 +0000
Subject: Re: archive directory only has one message in it
Message-Id: <551ec88905090907506ce2dcca@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_Part_1731_26302321.1126277431794"
List-Id: <mlmmj.mlmmj.org>
References: <4320A09D.9060608@diamond.name>
In-Reply-To: <4320A09D.9060608@diamond.name>
To: mlmmj@mlmmj.org

------=_Part_1731_26302321.1126277431794
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 9/9/05, Joel Aelwyn <joel@lightbearer.com> wrote:
>=20
>=20
> My copy, from the same source but hand-built to handle a few other tweaks
> (like my variant of "support characters other than + as a separator",=20
> which I
> need to tweak slightly given something pointed out on the list), certainl=
y
> doesn't appear to have this issue. However, there is one thing you should
> probably check, given the description of the problem: make sure the=20
> 'index'
> file exists, and is writeable, since that appears to be what mlmmj uses t=
o
> keep track of the archive's last posting number (and thus, if it doesn't
> exist, it probably thinks that it should write out '0', and does so... an=
d=20
> if
> it can't create the index file, well... lather, rinse, repeat). Did you=
=20
> check
> your logfile to see if it reported anything?
>=20

I think this is the problem.

The index file does exist but it's owned by root:root (the user I was when =
I=20
ran mlmmj-make-ml) and not writable by anybody else.

I have exim launching the mlmmj-recieve program as nobody:nogroup since=20
that's what all of the files in my mailing list directory (except index)=20
were owned by. Could this be a bug in mlmmj-make-ml?

I didn't realize that index needed to be written to by the user running=20
mlmmj-receive. This is definitely good to know.

I only have two log files in my mailing list directory:=20
mlmmj-maintd.lastrun.log and mlmmj.operation.log. Neither of them mentions=
=20
not being able to write to index.

Thanks!

--=20
Jason

------=_Part_1731_26302321.1126277431794
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 9/9/05, <b class=3D"gmail_sendername">Joel Aelwyn</b> &lt;<a href=3D"mai=
lto:joel@lightbearer.com">joel@lightbearer.com</a>&gt; wrote:<div><span cla=
ss=3D"gmail_quote"></span><blockquote class=3D"gmail_quote" style=3D"border=
-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-lef=
t: 1ex;">
<br>My copy, from the same source but hand-built to handle a few other twea=
ks<br>(like my variant of &quot;support characters other than + as a separa=
tor&quot;, which I<br>need to tweak slightly given something pointed out on=
 the list), certainly
<br>doesn't appear to have this issue. However, there is one thing you shou=
ld<br>probably check, given the description of the problem: make sure the '=
index'<br>file exists, and is writeable, since that appears to be what mlmm=
j uses to
<br>keep track of the archive's last posting number (and thus, if it doesn'=
t<br>exist, it probably thinks that it should write out '0', and does so...=
 and if<br>it can't create the index file, well... lather, rinse, repeat). =
Did you check
<br>your logfile to see if it reported anything?<br></blockquote></div><br>
I think this is the problem.<br>
<br>
The index file does exist but it's owned by root:root (the user I was
when I ran mlmmj-make-ml) and not writable by anybody else.<br>
<br>
I have exim launching the mlmmj-recieve program as nobody:nogroup since
that's what all of the files in my mailing list directory (except
index) were owned by. Could this be a bug in mlmmj-make-ml?<br>
<br>
I didn't realize that index needed to be written to by the user running mlm=
mj-receive. This is definitely good to know.<br>
<br>
I only have two log files in my mailing list directory:
mlmmj-maintd.lastrun.log and mlmmj.operation.log. Neither of them
mentions not being able to write to index.<br>
<br>
Thanks!<br>
<br>
-- <br>
Jason<br>

------=_Part_1731_26302321.1126277431794--
