From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 09 May 2005 07:16:02 +0000
Subject: Re: 1.2.6 released. No more queue littering ...
Message-Id: <20050509071601.GI87309@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20050508182645.GF87309@mmj.dk>
In-Reply-To: <20050508182645.GF87309@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Mads Martin Joergensen <mmj@mmj.dk> [May 08. 2005 20:26]:
>  o If prefix but no Subject: header is present, add one (Jakob Hirsch)

There's a bug here. In case we meet a subject already we forget to clear
the flag. This patch should fix it, so that no 2 subjects are present:

--- do_all_the_voodo_here.c     8 May 2005 16:18:02 -0000       1.24
+++ do_all_the_voodo_here.c     9 May 2005 07:13:51 -0000
@@ -142,6 +142,7 @@
                /* Add Subject: prefix if wanted */
                if(prefix) {
                        if(strncasecmp(hdrline, "Subject:", 8) = 0) {
+                               subject_present = 1;
                                unqp = cleanquotedp(hdrline + 8);
                                if(strstr(hdrline + 8, prefix) = NULL &&
                                   strstr(unqp, prefix) = NULL) {


-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
