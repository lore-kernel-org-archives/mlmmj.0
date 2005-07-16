From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sat, 16 Jul 2005 14:52:55 +0000
Subject: Re: Fw: footer isn't appended to multipart messages (part II: reality check!)
Message-Id: <20050716145255.GD26299@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <200507052130.02825.lists@seattleserver.com>
In-Reply-To: <200507052130.02825.lists@seattleserver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Jakob Hirsch <jh@plonk.de> [Jul 16. 2005 15:13]:
> Mads Martin Joergensen wrote:
> 
> > Thanks for the patch!
> 
> de nada.
> But better take the attached one. :)
> 
> > I'll have a look next week, when I'm back from vacation.
> 
> Have a nice holiday!

Thanks :-)

> --- mlmmj-1.2.8/src/do_all_the_voodo_here.c	2005-05-09 14:50:15.000000000 +0200
> +++ mlmmj-1.2.8-jh1/src/do_all_the_voodo_here.c	2005-07-16 13:53:00.000000000 +0200
> @@ -82,6 +82,9 @@
>  	char *hdrline, *subject, *unqp;
>  	int hdrsadded = 0;
>  	int subject_present = 0;
> +	int mime = 0;
> +	char *content_orig = NULL;  /* original content-type header */
> +	char *boundary = NULL;

Couldn't you read it from mlmmj-process.c ?

        struct mailhdr readhdrs[] = {
                { "From:", 0, NULL },
                { "To:", 0, NULL },
                { "Cc:", 0, NULL },
                { "Return-Path:", 0, NULL },
                { "Delivered-To:", 0, NULL },
                { NULL, 0, NULL }
        };

Just add it here, and you can access it directly. These headers are
collected anyway.

Have a look at main() in mlmmj-process.c.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
