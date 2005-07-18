From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 18 Jul 2005 18:12:40 +0000
Subject: Re: Fw: footer isn't appended to multipart messages (part II: reality check!)
Message-Id: <20050718181240.GF83227@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <200507052130.02825.lists@seattleserver.com>
In-Reply-To: <200507052130.02825.lists@seattleserver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Jakob Hirsch <jh@plonk.de> [Jul 18. 2005 14:20]:
> >>--- mlmmj-1.2.8/src/do_all_the_voodo_here.c	2005-05-09 14:50:15.000000000 +0200
> >>+	int mime = 0;
> >>+	char *content_orig = NULL;  /* original content-type header */
> >>+	char *boundary = NULL;
> > Couldn't you read it from mlmmj-process.c ?
> 
> I'm not sure if I understand what you mean.
> 
> I have to modify the Content-Type header and parts of the message, which
> can only be done in do_all_the_voodo_here(), AFAICT. The Content-Type is
> not needed outside of do_all_the_voodo_here(), so I did not mess with it
> in mlmmj-process.c.
> 
> Or did I miss something here?

You're right. I was thinking somewhere else in the code--but indeed; in
do_all_the_voodo_here() is when that stuff is read.

Is it just me, or is the second patch much better than the first one?

How much testing have this seen?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
