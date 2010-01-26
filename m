From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Tue, 26 Jan 2010 13:43:59 +0000
Subject: Re: Web-based membership management
Message-Id: <60567dcc1001260543k2a90e78fr56696a60318d451d@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0015173fe862598295047e117a5d"
List-Id: <mlmmj.mlmmj.org>
References: <4B5EEC4B.20404@yahoo.com.au>
In-Reply-To: <4B5EEC4B.20404@yahoo.com.au>
To: mlmmj@mlmmj.org

--0015173fe862598295047e117a5d
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 26, 2010 at 2:21 PM, Ben Schmidt
<mail_ben_schmidt@yahoo.com.au>wrote:

> Hi, once again!
>
> The final two things on my wish list for now are to do with membership
> management. This is the first.
>
> I'd like a web interface to allow membership management. I can easily write
> something in PHP to do this and have it join the other web interfaces in
> contrib.
>
> However, it is a bit more involved than the other interfaces. Control files
> are easy to fiddle with as they can be changed to have permissions writable
> by the webserver. Moderation is bearable, as emails can be sent that just do
> the job. For subscription and unsubscription, though, more care is needed.
> Permissions can't just be changed, as subscription/unsubscription by email
> would be affected. Mail can't simply be sent to do the job, as confirmation
> requests and so on would be generated undesirably.
>
> So...I'd like to propose an extension to subscription handling, where the
> subject line of mails to +subscribe or +unsubscribe can contain the
> commandline options of mlmmj-sub or mlmmj-unsub (as appropriate), excluding
> -L. The argument for -L would be implied by the address the mail was sent
> to, of course. Different addresses to the address the mail came from could
> easily be (un)subscribed by using the -a argument: in fact, it would be
> required to be the beginning of the subject line in order for the mechanism
> to be activated. To be secure, it would require the email to come from the
> list owner or someone listed in submod.
>
> A web interface could easily generate such emails to do required list
> admin.
>
> Perhaps for added security it could be required to be turned on with a
> tunable.
>
>
Hi Ben,

I like all the other stuff you proposed, but not this one :-)
From-addresses can be faked easily by script, so to just base yourself on
the sender as security mechanism is imho a no-no.
If I'm not mistaken, you don't like the other interfaces since they require
certain parts of the mail-list data to be web-writeable, correct? I'm
thinking that apache authentication/authorization is sufficient to protect
whatever part you want, and by limiting the files writeable by the webserver
to eg. just the subscribtion data, you're good to go, no?
What you're requiring is automatic mail-based list actions and to be honest,
I trust my webserver more than a from-address :-)

Franky

--0015173fe862598295047e117a5d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Jan 26, 2010 at 2:21 PM, Ben Schmidt <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:mail_ben_schmidt@yahoo.com.au">mail_be=
n_schmidt@yahoo.com.au</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt =
0pt 0.8ex; padding-left: 1ex;">
Hi, once again!<br>
<br>
The final two things on my wish list for now are to do with membership mana=
gement. This is the first.<br>
<br>
I&#39;d like a web interface to allow membership management. I can easily w=
rite something in PHP to do this and have it join the other web interfaces =
in contrib.<br>
<br>
However, it is a bit more involved than the other interfaces. Control files=
 are easy to fiddle with as they can be changed to have permissions writabl=
e by the webserver. Moderation is bearable, as emails can be sent that just=
 do the job. For subscription and unsubscription, though, more care is need=
ed. Permissions can&#39;t just be changed, as subscription/unsubscription b=
y email would be affected. Mail can&#39;t simply be sent to do the job, as =
confirmation requests and so on would be generated undesirably.<br>

<br>
So...I&#39;d like to propose an extension to subscription handling, where t=
he subject line of mails to +subscribe or +unsubscribe can contain the comm=
andline options of mlmmj-sub or mlmmj-unsub (as appropriate), excluding -L.=
 The argument for -L would be implied by the address the mail was sent to, =
of course. Different addresses to the address the mail came from could easi=
ly be (un)subscribed by using the -a argument: in fact, it would be require=
d to be the beginning of the subject line in order for the mechanism to be =
activated. To be secure, it would require the email to come from the list o=
wner or someone listed in submod.<br>

<br>
A web interface could easily generate such emails to do required list admin=
.<br>
<br>
Perhaps for added security it could be required to be turned on with a tuna=
ble.<br>
<br></blockquote><div><br>Hi Ben,<br><br>I like all the other stuff you pro=
posed, but not this one :-)<br>From-addresses can be faked easily by script=
, so to just base yourself on the sender as security mechanism is imho a no=
-no.<br>
If I&#39;m not mistaken, you don&#39;t like the other interfaces since they=
 require certain parts of the mail-list data to be web-writeable, correct? =
I&#39;m thinking that apache authentication/authorization is sufficient to =
protect whatever part you want, and by limiting the files writeable by the =
webserver to eg. just the subscribtion data, you&#39;re good to go, no?<br>
What you&#39;re requiring is automatic mail-based list actions and to be ho=
nest, I trust my webserver more than a from-address :-)<br><br>Franky <br><=
/div></div><br>

--0015173fe862598295047e117a5d--

