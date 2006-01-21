From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sat, 21 Jan 2006 08:44:34 +0000
Subject: Re: Treatment of Delivered-To headers (Re: mlmmj-recieve silently discarding messagesail?)
Message-Id: <20060121084434.GB58097@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601202202460.6540@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601202202460.6540@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Charlie Brady <charlieb@budge.apana.org.au> [Jan 21. 2006 04:10]:
> >Quoting Thomas Goirand <thomas@goirand.fr>:
> >>Delivered-To: xen010503-gplhost-com-test-subscribe@xen010503.gplhost.com
> >[snip]
> >>Would it be possible that mlmmj discrads the message because of the 
> >>Delivered-To:?
> >
> >Yes.
> >
> >Most likely because of this (mlmmj-process.c):
> >
> >519         if(whichto && whichto->emaillist && whichto->emaillist[0]){
> >520                 recipextra = strstr(whichto->emaillist[0], 
> >listdelim);
> >521                 if (recipextra)
> >522                         recipextra += strlen(listdelim);
> >523         } else
> >524                 recipextra = NULL;
> >525         myfree(listdelim);
> 
> And this:
> 
> ...
>         if(readhdrs[4].token) { /* Delivered-To: (envelope to) */
>                 for(i = 0; i < readhdrs[4].valuecount; i++) {
>                         find_email_adr(readhdrs[4].values[i], &dtoemails);
>                 }
>         }
> ...
> 
> The error here is that the Delivered-To header may not match the "envelope 
> to", and in the case of virtual domains, it definitely won't. But there is 
> no need to guess, just check $RECIPIENT in the environment.
> 
> Unless you tell me I'm way off track, I'll try to get a patch together. It 
> should be safe to assume that $RECIPIENT won't be set under other MTAs. If 
> you think it's not, then we could use a command line flag to only activate 
> the environment check under qmail.

I would love a patch doing this, with a a commandline option to
configure it. No need to read environment variables anywhere else than
qmail AFAIK.

But I've to admit, that when I wrote this, I deliberately always had in
mind that I ever would need to support qmail. My rationale was that if
one's using qmail, one would just use ezmlm anyway...

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
