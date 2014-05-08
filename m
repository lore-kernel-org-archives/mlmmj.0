From: Emil Hemdal <emil.hemdal.em@gmail.com>
Date: Thu, 08 May 2014 06:25:49 +0000
Subject: Re: [mlmmj] Using mlmmj with Postfix using non-virtual aliases ERROR: unknown user
Message-Id: <CAO8L7B7iGk01=LEt2RG3FzDDtgMvdP7=HKFXh+7kYYnaMR4jbA@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="047d7b5d5b0a2323c604f8dd8fc6"
List-Id: <mlmmj.mlmmj.org>
References: <53663582.4080307@gmail.com>
In-Reply-To: <53663582.4080307@gmail.com>
To: mlmmj@mlmmj.org

--047d7b5d5b0a2323c604f8dd8fc6
Content-Type: text/plain; charset=UTF-8

Hello,

I followed the README instead of the README.postfix and it solved my
problem!

Thanks for the help!

/Emil


2014-05-07 23:34 GMT+02:00 Ben Schmidt <mail_ben_schmidt@yahoo.com.au>:

>  May  4 13:37:19 mydomain postfix/local[7254]: EED2181041:
>> to=<list_info+subscribe@localhost.mlmmj>,
>> orig_to=<list_info+subscribe@mydomain.tld>, relay=local, delay=0.14,
>> delays=0.08/0.02/0/0.04, dsn=5.1.1, status=bounced (unknown user:
>> "list_info+subscribe")
>>
> ...
>
>  My transport file contains:
>> mydomain.tld--list_info@localhost.mlmmj mlmmj:mydomain.tld/list_info
>>
>> My aliases file contains:
>> list_info:              list_info@localhost.mlmmj
>>
>
> After a very quick look, I think the transport file should read:
>
> list_info@localhost.mlmmj mlmmj:list_info
>
> I.e. if you're not using virtual domains, no need to include
> mydomain.tld. The important thing is that the left hand side of
> transport matches the right hand side of aliases
> (list_info@loclahost.mlmmj) and the part after mlmmj: matches the name
> of the list directory (relative to the list spool directory).
>
> Ben.
>
>
>
>

--047d7b5d5b0a2323c604f8dd8fc6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hello,<br><br>I followed the README instead of t=
he README.postfix and it solved my problem!<br><br></div>Thanks for the hel=
p!<br><br></div>/Emil<br></div><div class=3D"gmail_extra"><br><br><div clas=
s=3D"gmail_quote">

2014-05-07 23:34 GMT+02:00 Ben Schmidt <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:mail_ben_schmidt@yahoo.com.au" target=3D"_blank">mail_ben_schmidt@yahoo=
.com.au</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<div class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">
May =C2=A04 13:37:19 mydomain postfix/local[7254]: EED2181041:<br>
to=3D&lt;list_info+subscribe@<u></u>localhost.mlmmj&gt;,<br>
orig_to=3D&lt;list_info+subscribe@<u></u>mydomain.tld&gt;, relay=3Dlocal, d=
elay=3D0.14,<br>
delays=3D0.08/0.02/0/0.04, dsn=3D5.1.1, status=3Dbounced (unknown user:<br>
&quot;list_info+subscribe&quot;)<br>
</blockquote></div>
...<div class=3D""><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
My transport file contains:<br>
mydomain.tld--list_info@<u></u>localhost.mlmmj mlmmj:mydomain.tld/list_info=
<br>
<br>
My aliases file contains:<br>
list_info: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_info@localh=
ost.mlmmj<br>
</blockquote>
<br></div>
After a very quick look, I think the transport file should read:<br>
<br>
list_info@localhost.mlmmj mlmmj:list_info<br>
<br>
I.e. if you&#39;re not using virtual domains, no need to include<br>
mydomain.tld. The important thing is that the left hand side of<br>
transport matches the right hand side of aliases<br>
(list_info@loclahost.mlmmj) and the part after mlmmj: matches the name<br>
of the list directory (relative to the list spool directory).<span class=3D=
"HOEnZb"><font color=3D"#888888"><br>
<br>
Ben.<br>
<br>
<br>
<br>
</font></span></blockquote></div><br></div>

--047d7b5d5b0a2323c604f8dd8fc6--

