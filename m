From: Thomas Goirand <thomas@goirand.fr>
Date: Fri, 20 Jan 2006 02:47:47 +0000
Subject: Re: mlmmj-recieve silently discarding messages (Re: Is anyone	using
Message-Id: <43D04F53.9030807@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Morten K. Poulsen wrote:

> (now also sent to the list)
>
> Quoting Thomas Goirand <thomas@goirand.fr>:
>
>> Delivered-To: xen010503-gplhost-com-test-subscribe@xen010503.gplhost.com
>
> [snip]
>
>> Would it be possible that mlmmj discrads the message because of the 
>> Delivered-To:?
>
>
> Yes.
>
> Most likely because of this (mlmmj-process.c):
>
>   519         if(whichto && whichto->emaillist && whichto->emaillist[0]){
>   520                 recipextra = strstr(whichto->emaillist[0], 
> listdelim);
>   521                 if (recipextra)
>   522                         recipextra += strlen(listdelim);
>   523         } else
>   524                 recipextra = NULL;
>   525         myfree(listdelim);
>
> It will find the delimiter "-" and try to use the rest 
> ("gplhost-com-test-subscribe") as a command, where it should only have 
> used "subscribe". I cannot see how we can change this in mlmmj. You 
> should change your mail server configuration.
>
> Morten

What I can do is change the begining of the user aliasing to something 
else, but the problem is that Qmail will add a delimiter between the 
virtual domain and the mail user.

Currently, in /var/qmail/control/virtualdomains, I have the following:
xen010503.gplhost.com:xen010503-gplhost-com

I can change it to something like this:
xen010503.gplhost.com:xen010503gplhostcom

But then, the mail would still be delivered to 
xen010503gplhostcom-test-subscribe@xen010503.gplhost.com. I even tried 
to add the address xen010503-gplhost-com-test@xen010503.gplhost.com in 
the tunable listaddress but it had no effect either...

This is the way Qmail works at the very begining if using in single 
UID/GID + virtual domains, so if you want to have mlmmj working with 
stock Qmail, something else has to be done.

Thomas

