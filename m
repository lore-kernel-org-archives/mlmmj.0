From: Jakob Hirsch <jh@plonk.de>
Date: Mon, 09 May 2005 12:47:02 +0000
Subject: Re: 1.2.6 released. No more queue littering ...
Message-Id: <427F5BC6.7040907@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <20050508182645.GF87309@mmj.dk>
In-Reply-To: <20050508182645.GF87309@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Mads Martin Joergensen wrote:

>> o If prefix but no Subject: header is present, add one (Jakob Hirsch)
> There's a bug here. In case we meet a subject already we forget to clear
> the flag. This patch should fix it, so that no 2 subjects are present:

> +                               subject_present = 1;

It's there (a few lines below), but will only be done if the subject 
contains the prefix, which is obiously wrong.
sorry for that.

the extra setting of subject_present doesn't hurt, but for clarity, it's 
better to remove it:

--- do_all_the_voodo_here.c   2005-05-08 18:18:02 +0200
+++ do_all_the_voodo_here.c   2005-05-09 14:41:41 +0200
@@ -153,7 +154,6 @@
                                         myfree(subject);
                                         myfree(hdrline);
                                         myfree(unqp);
-                                       subject_present = 1;
                                         continue;
                                 }
                                 myfree(unqp);
