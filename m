From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Fri, 04 Jun 2004 22:11:40 +0000
Subject: Re: mlmmj-0.5.2
Message-Id: <20040604221140.GW36115@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20040529154106.GB36109@panther.mmj.dk>
In-Reply-To: <20040529154106.GB36109@panther.mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Christoph Thiel <ct@kki.org> [Jun 04. 2004 22:34]:
> > mlmmj-0.5.2 is out.
> 
> I just updated to 0.5.2... and it seems to be working as expected.

Sounds good.

> Btw: Wouldn't it be consequently to move listdir/moderators to
> listdir/control/moderators?
> 
> - --- mlmmj-process.c~    2004-06-04 22:29:09.000000000 +0200
> +++ mlmmj-process.c     2004-06-04 22:29:09.000000000 +0200
> @@ -61,7 +61,7 @@
>         }
>         free(randomstr);
>  
> - -       moderatorsfilename = concatstr(2, listdir, "/moderators");
> +       moderatorsfilename = concatstr(2, listdir, "/control/moderators");
>         if((moderatorsfile = fopen(moderatorsfilename, "r")) = NULL) {
>                 log_error(LOG_ARGS, "Could not open '%s'", moderatorsfilename);
>                 free(queuefilename);

Indeed it would. Thanks.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
