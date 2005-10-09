From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sun, 09 Oct 2005 14:31:58 +0000
Subject: Re: RECIPDELIM patch, italian lists texts, qmail how-to and some issues
Message-Id: <20051009143158.GS78143@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <6.2.3.4.2.20051004222158.03132540@postino.programmazione.it>
In-Reply-To: <6.2.3.4.2.20051004222158.03132540@postino.programmazione.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Joel Aelwyn <joel@lightbearer.com> [Oct 05. 2005 02:17]:
> >-       if(whichto && whichto->emaillist && whichto->emaillist[0])
> >-                recipdelim = strchr(whichto->emaillist[0], RECIPDELIM);
> >-       else
> >-                recipdelim = NULL;
> >+        if(toemails.emaillist && toemails.emaillist[0])
> >+                recipdelim = strstr(toemails.emaillist[0], RECIPDELIM);
> >+        else
> >+                recipdelim = NULL;

A normal qmail sets Delivered-To: and mlmmj in case it wont find a
Delivered-To: will fall back to To:, hence the whichto variable.

Is vpopmail mangling Delivered-To:?

Normal qmail does set Delivered-To: correctly AFAICT.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
