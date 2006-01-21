From: Charlie Brady <charlieb@budge.apana.org.au>
Date: Sat, 21 Jan 2006 03:10:22 +0000
Subject: Treatment of Delivered-To headers (Re: mlmmj-recieve silently
Message-Id: <Pine.LNX.4.61.0601202202460.6540@e-smith.charlieb.ott.istop.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Fri, 20 Jan 2006, Morten K. Poulsen wrote:

> (now also sent to the list)
>
> Quoting Thomas Goirand <thomas@goirand.fr>:
>> Delivered-To: xen010503-gplhost-com-test-subscribe@xen010503.gplhost.com
> [snip]
>> Would it be possible that mlmmj discrads the message because of the 
>> Delivered-To:?
>
> Yes.
>
> Most likely because of this (mlmmj-process.c):
>
> 519         if(whichto && whichto->emaillist && whichto->emaillist[0]){
> 520                 recipextra = strstr(whichto->emaillist[0], 
> listdelim);
> 521                 if (recipextra)
> 522                         recipextra += strlen(listdelim);
> 523         } else
> 524                 recipextra = NULL;
> 525         myfree(listdelim);

And this:

...
         if(readhdrs[4].token) { /* Delivered-To: (envelope to) */
                 for(i = 0; i < readhdrs[4].valuecount; i++) {
                         find_email_adr(readhdrs[4].values[i], &dtoemails);
                 }
         }
...

The error here is that the Delivered-To header may not match the "envelope 
to", and in the case of virtual domains, it definitely won't. But there is 
no need to guess, just check $RECIPIENT in the environment.

Unless you tell me I'm way off track, I'll try to get a patch together. It 
should be safe to assume that $RECIPIENT won't be set under other MTAs. If 
you think it's not, then we could use a command line flag to only activate 
the environment check under qmail.
