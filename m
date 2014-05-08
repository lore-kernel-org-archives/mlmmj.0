From: Emil Hemdal <emil.hemdal.em@gmail.com>
Date: Thu, 08 May 2014 10:17:21 +0000
Subject: Re: [mlmmj] Using mlmmj with Postfix using non-virtual aliases ERROR: unknown user
Message-Id: <CAO8L7B6XxKmhyduY3pgTQxexaawUygUW=07wyVzUqZRvOapHcg@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="047d7bdc9e023747b104f8e0cb68"
List-Id: <mlmmj.mlmmj.org>
References: <53663582.4080307@gmail.com>
In-Reply-To: <53663582.4080307@gmail.com>
To: mlmmj@mlmmj.org

--047d7bdc9e023747b104f8e0cb68
Content-Type: text/plain; charset=UTF-8

Ah, that the transport solves the permission issue so that mlmmj is run
with the mlmmj user.

/Emil


2014-05-08 10:53 GMT+02:00 Ben Schmidt <mail_ben_schmidt@yahoo.com.au>:

> OK, cool.
>
> Just be aware of the possible security problems detailed in README.postfix
> if you don't use a transport or similarly secure mechanism with Postfix.
> They might not matter in your setup, but you should at least be aware of
> them.
>
> Smiles,
>
> Ben.
>
>
>
>
> On 8/05/14 4:25 PM, Emil Hemdal wrote:
>
>> Hello,
>>
>> I followed the README instead of the README.postfix and it solved my
>> problem!
>>
>> Thanks for the help!
>>
>> /Emil
>>
>>
>> 2014-05-07 23:34 GMT+02:00 Ben Schmidt <mail_ben_schmidt@yahoo.com.au
>> <mailto:mail_ben_schmidt@yahoo.com.au>>:
>>
>>
>>         May  4 13:37:19 mydomain postfix/local[7254]: EED2181041:
>>         to=<list_info+subscribe@__localhost.mlmmj>,
>>         orig_to=<list_info+subscribe@__mydomain.tld>, relay=local,
>> delay=0.14,
>>
>>         delays=0.08/0.02/0/0.04, dsn=5.1.1, status=bounced (unknown user:
>>         "list_info+subscribe")
>>
>>     ...
>>
>>         My transport file contains:
>>         mydomain.tld--list_info@__localhost.mlmmj
>> mlmmj:mydomain.tld/list_info
>>
>>
>>         My aliases file contains:
>>         list_info:              list_info@localhost.mlmmj
>>
>>
>>     After a very quick look, I think the transport file should read:
>>
>>     list_info@localhost.mlmmj mlmmj:list_info
>>
>>     I.e. if you're not using virtual domains, no need to include
>>     mydomain.tld. The important thing is that the left hand side of
>>     transport matches the right hand side of aliases
>>     (list_info@loclahost.mlmmj) and the part after mlmmj: matches the
>> name
>>     of the list directory (relative to the list spool directory).
>>
>>     Ben.
>>
>>
>>
>>
>>

--047d7bdc9e023747b104f8e0cb68
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Ah, that the transport solves the permission issue so=
 that mlmmj is run with the mlmmj user.</div><div><br></div><div>/Emil</div=
></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">2014-0=
5-08 10:53 GMT+02:00 Ben Schmidt <span dir=3D"ltr">&lt;<a href=3D"mailto:ma=
il_ben_schmidt@yahoo.com.au" target=3D"_blank">mail_ben_schmidt@yahoo.com.a=
u</a>&gt;</span>:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">OK, cool.<br>
<br>
Just be aware of the possible security problems detailed in README.postfix =
if you don&#39;t use a transport or similarly secure mechanism with Postfix=
. They might not matter in your setup, but you should at least be aware of =
them.<br>


<br>
Smiles,<br>
<br>
Ben.<div><br>
<br>
<br>
<br>
On 8/05/14 4:25 PM, Emil Hemdal wrote:<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;p=
adding-left:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;bo=
rder-left-style:solid"><div>
Hello,<br>
<br>
I followed the README instead of the README.postfix and it solved my proble=
m!<br>
<br>
Thanks for the help!<br>
<br>
/Emil<br>
<br>
<br>
2014-05-07 23:34 GMT+02:00 Ben Schmidt &lt;<a href=3D"mailto:mail_ben_schmi=
dt@yahoo.com.au" target=3D"_blank">mail_ben_schmidt@yahoo.com.au</a><br></d=
iv>
&lt;mailto:<a href=3D"mailto:mail_ben_schmidt@yahoo.com.au" target=3D"_blan=
k">mail_ben_schmidt@<u></u>yahoo.com.au</a>&gt;&gt;:<div><br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 May =C2=A04 13:37:19 mydomain postfix/local[725=
4]: EED2181041:<br></div>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 to=3D&lt;list_info+subscribe@__<u></u>localhost=
.mlmmj&gt;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 orig_to=3D&lt;list_info+subscribe@_<u></u>_mydo=
main.tld&gt;, relay=3Dlocal, delay=3D0.14,<div><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 delays=3D0.08/0.02/0/0.04, dsn=3D5.1.1, status=
=3Dbounced (unknown user:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;list_info+subscribe&quot;)<br>
<br>
=C2=A0 =C2=A0 ...<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 My transport file contains:<br></div>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mydomain.tld--list_info@__<u></u>localhost.mlmm=
j mlmmj:mydomain.tld/list_info<div><br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 My aliases file contains:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 list_info: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0list_info@localhost.mlmmj<br>
<br>
<br>
=C2=A0 =C2=A0 After a very quick look, I think the transport file should re=
ad:<br>
<br>
=C2=A0 =C2=A0 list_info@localhost.mlmmj mlmmj:list_info<br>
<br>
=C2=A0 =C2=A0 I.e. if you&#39;re not using virtual domains, no need to incl=
ude<br>
=C2=A0 =C2=A0 mydomain.tld. The important thing is that the left hand side =
of<br>
=C2=A0 =C2=A0 transport matches the right hand side of aliases<br>
=C2=A0 =C2=A0 (list_info@loclahost.mlmmj) and the part after mlmmj: matches=
 the name<br>
=C2=A0 =C2=A0 of the list directory (relative to the list spool directory).=
<br>
<br>
=C2=A0 =C2=A0 Ben.<br>
<br>
<br>
<br>
<br>
</div></blockquote>
</blockquote></div><br></div>

--047d7bdc9e023747b104f8e0cb68--

