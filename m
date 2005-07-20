From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 20 Jul 2005 06:29:24 +0000
Subject: Re: recipdelim patch
Message-Id: <20050720062924.GU83227@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <42D3CDD00000B1FA@ims3a.cp.tin.it>
In-Reply-To: <42D3CDD00000B1FA@ims3a.cp.tin.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* fifadd@tin.it <fifadd@tin.it> [Jul 19. 2005 18:08]:
> >This is bad, since this stop reacting to the Delivered-To: header,
> >and instead startsa only using the To: header. But the whichto will
> >point to the To: header in case there's no Delivered-To:. And in case
> >someone sends a subscribe request with the sendmail command, there's
> >no To: header on qmail.
> >
> >Why not just change it to use strstr()? Now we're talking about
> >strstr, why not just use strchr, but do it on RECIPDELIM[0]. Since it
> >can only be one character big, it should have the same effect, no?
>
> It's not a problem related strstr here. Let me to explain you. I have
> used toemails.emaillist[0] because qmail places before the domain
> name, the address list, as you can see in this example (I have deleted
> the unusefull headers to make it more simple):
>
> >From fifadd@tin.it Sat Jul 16 18:12:01 2005
> Return-Path: <fifadd@tin.it>
> Delivered-To: programmazione.it-mytest-subscribe@programmazione.it
> Received: (qmail 22421 invoked by uid 530); 16 Jul 2005 20:12:01 +0200
> Date: Sat, 16 Jul 2005 20:24:52 +0200
> To: mytest-subscribe@programmazione.it
> From: Filippo Fadda <fifadd@tin.it>
>
> As you can see "Delivered-To" contains my domain name just before the
> list name. So the original code does not work. We need some hack here.
> Perhaps we have to use "To" as default header, and "Delivered-To" only
> if "To" is not present.

Do you use a patched qmail? The qmail installation I can test on, has a
proper Delivered-To:.

Did you try doing: sendmail fifadd@tin.it < /dev/null on your qmail
machine? This sends a mail with no To: header. And I know of people who
have done sendmail mlmmj+subscribe@mmj.dk < /dev/null in the past.

> >You don't need the mystrdup there, since concatstr will return an
> >allocated string already.
>
> It's a cut and paste error that I have brought forward, sorry.

No problem.

--
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
