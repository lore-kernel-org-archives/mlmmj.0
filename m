From: Wolf Bergenheim <wolf+mlmmj@bergenheim.net>
Date: Sun, 01 May 2022 09:16:51 +0000
Subject: Re: [mlmmj] server switch over
Message-Id: <CAJhTkW7=ekMiKi2xxGqER8ofgam3oiY_LBbg0Wx+iYLktCX6Vw@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="00000000000006afb405ddefbdd9"
List-Id: <mlmmj.mlmmj.org>
References: <20210125220841.qhrji7b77obenbu6@gpm.stappers.nl>
In-Reply-To: <20210125220841.qhrji7b77obenbu6@gpm.stappers.nl>
To: mlmmj@mlmmj.org

--00000000000006afb405ddefbdd9
Content-Type: text/plain; charset="UTF-8"

After sum huffing and puffing I have gotten the main site back up, and
also, most importantly, the mlmmj.org lists up and running again.

Thank you to all who helped!

There are still some sub--parts of the website not working quite correctly,
and here is where I'd like to know more from you. Is it worth fixing those,
or should I somehow (?) edit the website to point to the gitlab? Where is
development happening nowadays? Where are issues being tracked? Is it all
happening on gitlab?

Also if someone wants access to the web server reach out to me I can add
your ssh key to the mlmmj user so you can ssh into the server.

--Wolf

On Sat, 23 Apr 2022 at 05:04, Wolf Bergenheim <wolf+mlmmj@bergenheim.net>
wrote:

> An update:
>
> In the end I'm migrating to a new server. Rackspace's fanatical support
> turns out to be less than advertised... :(
>
> @Christian, would you be able to update the DNS records if I give you the
> new IP address of the server?
> I'm also happy to take on managing the DNS records on linode.
>
> I'm setting up a dedicated mlmmj VM on linode in Germany, and as it is a
> new instance it is running a more modern software (in this case Debian 11).
> This has caused some issues with getting the website back up, but as of
> now I have succeeded \o/ (all content should be there)
>
> Over the weekend I'll set up exim4 and mlmmj and hopefully that will be
> that, and we can have all systems restored.
>
> The nice thing about this being a dedicated mlmmj machine is that I can
> drop a lot of the complexity around mail routing and can look at setting up
> an HTTPS site too, if we want.
>
> --Wolf
>
>
> On Thu, 21 Apr 2022 at 14:25, Wolf Bergenheim <wolf+mlmmj@bergenheim.net>
> wrote:
>
>> Ohh I now remember I'm handling mail for mlmmj.org too... so adding
>> directs here to this thread
>>
>> I'm currently working or rebuilding the server from the rescued drive.
>>
>>
>> --Wolf
>>
>>
>> On Thu, 21 Apr 2022 at 12:31, Wolf Bergenheim <wolf+mlmmj@bergenheim.net>
>> wrote:
>>
>>> Hi, all
>>>
>>> Maintainer of the mlmmj.org webserver here. Last night the server had a
>>> critical issue and is currently down. I'm working on restoring it but
>>> rackspace crew is not really being helpful, but I'm hopeful I can get the
>>> system up and running today. Will post an update when I know more.
>>>
>>> However we might have to change the IP address. Who is the owner of the
>>> DNS?
>>>
>>> --
>>>
>>> --Wolf
>>>
>>>
>>> On Wed, 27 Jan 2021 at 10:18, Christof Thalhofer <chrisml@deganius.de>
>>> wrote:
>>>
>>>> Am 26.01.21 um 09:26 schrieb Christof Thalhofer:
>>>>
>>>> > But i can do no webdesign, maintenance of the mailinglist etc. I also
>>>> > don't want to be the owner of mlmmj.org.
>>>>
>>>> What i forgot: We can also transfer the domain to Hostsharing that it
>>>> can be registered there and the DNS is done by HS. This would be
>>>> convenient because then the DNS Zonefiles could be altered/adapted
>>>> easily. Think of SPF entries or subdomains for instance. A domain at HS
>>>> costs 20 EUR/year. But we also can create the webspace with the
>>>> domainname at another DNS service pointing to the IP at HS. It would be
>>>> simply less convenient.
>>>>
>>>> Alles Gute
>>>>
>>>> Christof Thalhofer
>>>>
>>>> --
>>>> Dies ist keine Signatur
>>>>
>>>>

--00000000000006afb405ddefbdd9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">After sum huffing and puffing I have gott=
en the main site back up, and also, most importantly, the <a href=3D"http:/=
/mlmmj.org">mlmmj.org</a> lists up and running again.<div><br></div><div>Th=
ank you to all who helped!<br><div><br></div><div>There are still some sub-=
-parts of the website not working quite correctly, and here is where I&#39;=
d like to know more from you. Is it worth fixing those, or should I somehow=
 (?) edit the website to point to the gitlab? Where is development happenin=
g nowadays? Where are issues being tracked? Is it all happening on gitlab?<=
/div><div><br></div><div>Also if someone wants access to the web server rea=
ch out to me I can add your ssh key to the mlmmj user so you can ssh into t=
he server.</div><div><br></div><div><div><div dir=3D"ltr" class=3D"gmail_si=
gnature" data-smartmail=3D"gmail_signature">--Wolf</div></div></div></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Sat, 23 Apr 2022 at 05:04, Wolf Bergenheim &lt;<a href=3D"mailto:wolf%2Bm=
lmmj@bergenheim.net">wolf+mlmmj@bergenheim.net</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">An update:<d=
iv><br></div><div>In the end I&#39;m migrating to a new server. Rackspace&#=
39;s fanatical support turns out to be less than advertised... :(</div><div=
><br></div><div>@Christian, would you be able to update the DNS records if =
I give you the new IP address of the server?</div><div>I&#39;m also happy t=
o take on managing the DNS records on linode.</div><div><br></div><div>I&#3=
9;m setting up a dedicated mlmmj VM on linode in Germany, and as it is a ne=
w instance it is running a more modern software (in this case Debian 11).</=
div><div>This has caused some issues with getting the website back up, but =
as of now I have succeeded \o/ (all content should be there)</div><div><br>=
</div><div>Over the weekend I&#39;ll set up exim4 and mlmmj and hopefully t=
hat will be that, and we can have all systems restored.</div><div><div><div=
 dir=3D"ltr"><div><br></div><div>The nice thing about this being a dedicate=
d mlmmj machine is that I can drop a lot of the complexity around mail rout=
ing and can look at setting up an HTTPS site too, if we want.</div><div>=C2=
=A0</div>--Wolf<br></div></div><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 21 Apr 2022 at 14:25, Wolf=
 Bergenheim &lt;<a href=3D"mailto:wolf%2Bmlmmj@bergenheim.net" target=3D"_b=
lank">wolf+mlmmj@bergenheim.net</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr">Ohh I now remember I&#39;=
m handling mail for <a href=3D"http://mlmmj.org" target=3D"_blank">mlmmj.or=
g</a> too... so adding directs here to this thread<div><br></div><div>I&#39=
;m currently working or rebuilding the server from the rescued drive.</div>=
<div>=C2=A0<br></div><div><div><div dir=3D"ltr"><div><br></div>--Wolf<br></=
div></div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Thu, 21 Apr 2022 at 12:31, Wolf Bergenheim &lt;<a hr=
ef=3D"mailto:wolf%2Bmlmmj@bergenheim.net" target=3D"_blank">wolf+mlmmj@berg=
enheim.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr">Hi, all<div><br></div><div>Maintainer of the <a=
 href=3D"http://mlmmj.org" target=3D"_blank">mlmmj.org</a> webserver here. =
Last night the server had a critical issue and is currently down. I&#39;m w=
orking on restoring it but rackspace crew is not really being helpful, but =
I&#39;m hopeful I can get the system up and running today. Will post an upd=
ate when I know more.</div><div><br></div><div>However we might have to cha=
nge the IP address. Who is the owner of the DNS?</div><div><br clear=3D"all=
"><div><div dir=3D"ltr"><div>--=C2=A0</div><div><br></div>--Wolf<br></div><=
/div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, 27 Jan 2021 at 10:18, Christof Thalhofer &lt;<a hre=
f=3D"mailto:chrisml@deganius.de" target=3D"_blank">chrisml@deganius.de</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am 26=
.01.21 um 09:26 schrieb Christof Thalhofer:<br>
<br>
&gt; But i can do no webdesign, maintenance of the mailinglist etc. I also<=
br>
&gt; don&#39;t want to be the owner of <a href=3D"http://mlmmj.org" rel=3D"=
noreferrer" target=3D"_blank">mlmmj.org</a>.<br>
<br>
What i forgot: We can also transfer the domain to Hostsharing that it<br>
can be registered there and the DNS is done by HS. This would be<br>
convenient because then the DNS Zonefiles could be altered/adapted<br>
easily. Think of SPF entries or subdomains for instance. A domain at HS<br>
costs 20 EUR/year. But we also can create the webspace with the<br>
domainname at another DNS service pointing to the IP at HS. It would be<br>
simply less convenient.<br>
<br>
Alles Gute<br>
<br>
Christof Thalhofer<br>
<br>
-- <br>
Dies ist keine Signatur<br>
<br>
</blockquote></div>
</blockquote></div>
</blockquote></div>
</blockquote></div></div>

--00000000000006afb405ddefbdd9--

