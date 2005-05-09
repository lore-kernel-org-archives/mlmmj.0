From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 09 May 2005 12:48:38 +0000
Subject: Re: 1.2.6 released. No more queue littering ...
Message-Id: <20050509124838.GM87309@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20050508182645.GF87309@mmj.dk>
In-Reply-To: <20050508182645.GF87309@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Jakob Hirsch <jh@plonk.de> [May 09. 2005 14:47]:
> >+                               subject_present = 1;
> 
> It's there (a few lines below), but will only be done if the subject 
> contains the prefix, which is obiously wrong.
> sorry for that.

No worries--I've made .1 releases before :-)

> the extra setting of subject_present doesn't hurt, but for clarity, it's 
> better to remove it:
> 
> --- do_all_the_voodo_here.c   2005-05-08 18:18:02 +0200
> +++ do_all_the_voodo_here.c   2005-05-09 14:41:41 +0200
> @@ -153,7 +154,6 @@
>                                         myfree(subject);
>                                         myfree(hdrline);
>                                         myfree(unqp);
> -                                       subject_present = 1;
>                                         continue;
>                                 }
>                                 myfree(unqp);

Yeah.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
