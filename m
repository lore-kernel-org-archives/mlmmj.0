From: =?ISO-8859-1?Q?An=EDbal_Pacheco?= <apacheco@ladiaria.com.uy>
Date: Fri, 17 Jan 2014 15:30:37 +0000
Subject: Re: [mlmmj] Export lists subscribers
Message-Id: <CA+pf5N+p=R0-GbJwPY6gaUZZcCV_10N1FDJRKe3FbrYMwV-Csw@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="001a113499a4540f6604f02c39af"
List-Id: <mlmmj.mlmmj.org>
References: <CA+pf5NKFhJp2Uo7j-F5g=e+cJUt0PYSrML_4m4dSDqZNrv+19Q@mail.gmail.com>
In-Reply-To: <CA+pf5NKFhJp2Uo7j-F5g=e+cJUt0PYSrML_4m4dSDqZNrv+19Q@mail.gmail.com>
To: mlmmj@mlmmj.org

--001a113499a4540f6604f02c39af
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Good start :) thank you


On Fri, Jan 17, 2014 at 12:15 PM, Yuri D'Elia <wavexx@thregr.org> wrote:

> On 01/17/2014 12:08 AM, An=EDbal Pacheco wrote:
> > Hello, in our organization all the time people are asking who are the
> > subscribers of a list, which represent effort to our IT department. I
> want
> > to export this data from the server frequently and present it on a wiki
> or
> > plain HTML.
> > Is there a tool or script that already does that?
>
> Depends on the level of sophistication you need ;)
>
> =3D=3D=3D=3D
>
> #!/bin/sh
> list=3D"$1"
> echo '<html><body><ul>'
> cat /var/spool/mlmmj/$list/subscribers.d/* \
>   | sed -e 's/.*/<li><a href=3D"mailto:\0">\0<\/a>/'
> echo '</ul></body></html>'
>
> =3D=3D=3D=3D
>
>

--001a113499a4540f6604f02c39af
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Good start :) thank you<br></div><div class=3D"gmail_extra=
"><br><br><div class=3D"gmail_quote">On Fri, Jan 17, 2014 at 12:15 PM, Yuri=
 D&#39;Elia <span dir=3D"ltr">&lt;<a href=3D"mailto:wavexx@thregr.org" targ=
et=3D"_blank">wavexx@thregr.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On 0=
1/17/2014 12:08 AM, An=EDbal Pacheco wrote:<br>
&gt; Hello, in our organization all the time people are asking who are the<=
br>
&gt; subscribers of a list, which represent effort to our IT department. I =
want<br>
&gt; to export this data from the server frequently and present it on a wik=
i or<br>
&gt; plain HTML.<br>
&gt; Is there a tool or script that already does that?<br>
<br>
</div></div>Depends on the level of sophistication you need ;)<br>
<br>
=3D=3D=3D=3D<br>
<br>
#!/bin/sh<br>
list=3D&quot;$1&quot;<br>
echo &#39;&lt;html&gt;&lt;body&gt;&lt;ul&gt;&#39;<br>
cat /var/spool/mlmmj/$list/subscribers.d/* \<br>
=A0 | sed -e &#39;s/.*/&lt;li&gt;&lt;a href=3D&quot;mailto:\0&quot;&gt;\0&l=
t;\/a&gt;/&#39;<br>
echo &#39;&lt;/ul&gt;&lt;/body&gt;&lt;/html&gt;&#39;<br>
<br>
=3D=3D=3D=3D<br>
<br>
</blockquote></div><br></div>

--001a113499a4540f6604f02c39af--

