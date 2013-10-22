From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 22 Oct 2013 06:01:15 +0000
Subject: Re: [mlmmj] Msg "bounces"  from ml
Message-Id: <526614AB.8060109@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <5AA1B1D9-AEA9-4AC0-B9DC-3D3291F70CEB@gmail.com>
In-Reply-To: <5AA1B1D9-AEA9-4AC0-B9DC-3D3291F70CEB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi, Ravi!

At first glance, it seems to me that nothing is wrong. Mlmmj uses VERP
to facilitate automatic bounce processing. If you Google 'VERP' you can
find out more about it, and also see the 'verp' tunable in the
documentation (about 2/3 of the way through
http://mlmmj.org/docs/tunables/). It is only the 'envelope from' that
contains this 'bounces' address, not the 'from' header. When users hit
reply, their reply will go to the original sender. If you set up
appropriate List-* headers (see the 'customheaders' tunable), the user
can also hit 'reply list' to send a reply to the list. If the mail
system encounters an error, however, it will report the error to Mlmmj
through the 'bounces' address (rather than the original sender, which
would be annoying for the sender, and possibly a breach of the privacy
of the user whose email address is bouncing). If problems persist, Mlmmj
will unsubscribe the user, saving resources.

I hope this helps.

Ben.



On 22/10/13 2:20 PM, Ravi Chandran. S wrote:
> Hello,
>
>   I have setup a mlmmj ml on centos 6.4.
>
> Many of the messages reach subscribers with From:
> listname+bounces-xx-subscriber=domain.org@server.org
> <mailto:listname+bounces-xx-subscriber=domain.org@server.org>
>
> Part of message body is shown below.
>
> MIME-Version: 1.0
> To: "list name"<listname@server.org <mailto:rt95@rt95.org>>
> From: Name <xxxx@yyyyy.org <mailto:xxxx@yyyyy.org>>
> Subject: RE: [listname] Test ~ photo attachment
> Date: Mon, 21 Oct 2013 15:21:17 +0530
> Content-Type: multipart/mixed;
>     boundary="_9554DF7C-9E7E-4F2C-9064-156C4B549D21_"
>
> --_9554DF7C-9E7E-4F2C-9064-156C4B549D21_
> Content-Type: multipart/alternative;
>     boundary="_3472992B-84C1-4194-A618-CAFF272BEA0E_"
>
> --_3472992B-84C1-4194-A618-CAFF272BEA0E_
> Content-Transfer-Encoding: quoted-printable
> Content-Type: text/plain; charset="utf-8"
>
>
>
> Pointers to solve this problem will be appreciated.
>
> TIA
> --
> Regards,
> Ravi

