From: fifadd@tin.it
Date: Tue, 19 Jul 2005 16:07:58 +0000
Subject: Re: recipdelim patch
Message-Id: <42D3CDD00000D0E0@ims3a.cp.tin.it>
List-Id: <mlmmj.mlmmj.org>
References: <42D3CDD00000B1FA@ims3a.cp.tin.it>
In-Reply-To: <42D3CDD00000B1FA@ims3a.cp.tin.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

>-       if(whichto && whichto->emaillist && whichto->emaillist[0])
>-               recipdelim = strchr(whichto->emaillist[0], RECIPDELIM);
>-       else
>-               recipdelim = NULL;
>+        if(toemails.emaillist && toemails.emaillist[0])
>+                recipdelim = strstr(toemails.emaillist[0], RECIPDELIM);
>+        else
>+                recipdelim = NULL;
>+
>
>This is bad, since this stop reacting to the Delivered-To: header, and
>instead startsa only using the To: header. But the whichto will point to
>the To: header in case there's no Delivered-To:. And in case someone
>sends a subscribe request with the sendmail command, there's no To:
>header on qmail.
>
>Why not just change it to use strstr()? Now we're talking about strstr,
>why not just use strchr, but do it on RECIPDELIM[0]. Since it can only
>be one character big, it should have the same effect, no?

It's not a problem related strstr here. Let me to explain you. I have used
toemails.emaillist[0] because qmail places before the domain name, the address
list, as you can see in this example (I have deleted the unusefull headers
to make it more simple):

From fifadd@tin.it Sat Jul 16 18:12:01 2005
Return-Path: <fifadd@tin.it>
Delivered-To: programmazione.it-mytest-subscribe@programmazione.it
Received: (qmail 22421 invoked by uid 530); 16 Jul 2005 20:12:01 +0200
Date: Sat, 16 Jul 2005 20:24:52 +0200
To: mytest-subscribe@programmazione.it
From: Filippo Fadda <fifadd@tin.it>

As you can see "Delivered-To" contains my domain name just before the list
name. So the original code does not work. We need some hack here. Perhaps
we have to use "To" as default header, and "Delivered-To" only if "To" is
not present.

>You don't need the mystrdup there, since concatstr will return an
>allocated string already.

It's a cut and paste error that I have brought forward, sorry.

Ok I'm waiting your feedback and then I will send the patch with all the
corrections.

Bye

-Filippo


