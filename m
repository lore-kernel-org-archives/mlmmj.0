From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sun, 27 Jun 2004 21:34:58 +0000
Subject: Re: mlmmj-0.8.1
Message-Id: <20040627213458.GC30978@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20040625082942.GG10372@panther.mmj.dk>
In-Reply-To: <20040625082942.GG10372@panther.mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Mads Martin Joergensen <mmj@mmj.dk> [Jun 25. 2004 10:29]:
> 0.8.1
>  o Go through all open() calls and retry in case we (allthough it's extremely
>    unlikely) did get EEXIST

This caused a nasty bug to appear in the function preparing standard
replies. Apply this patch or just grab mlmmj-0.8.1.1.

--- mlmmj-0.8.1/src/prepstdreply.c
+++ mlmmj-0.8.1/src/prepstdreply.c
@@ -64,18 +64,17 @@
 	myfree(tmp);
 
 	do {
-                tmp = random_str();
+		tmp = random_str();
 		myfree(retstr);
 		retstr = concatstr(3, listdir, "/queue/", tmp);
 		myfree(tmp);
 
-                outfd = open(filename, O_RDWR|O_CREAT|O_EXCL,
-				       S_IRUSR|S_IWUSR);
+		outfd = open(retstr, O_RDWR|O_CREAT|O_EXCL, S_IRUSR|S_IWUSR);
 
 	} while ((outfd < 0) && (errno = EEXIST));
 	
 	if(outfd < 0) {
-		log_error(LOG_ARGS, "Could not open std mail %s", tmp);
+		log_error(LOG_ARGS, "Could not open std mail %s", retstr);
 		myfree(str);
 		return NULL;
 	}

Thanks to Christian Laursen for finding.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
