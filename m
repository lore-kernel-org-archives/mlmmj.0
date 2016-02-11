From: Steffen Nurpmeso <steffen@sdaoden.eu>
Date: Thu, 11 Feb 2016 15:21:00 +0000
Subject: [mlmmj] Empty messages not delivered unless memorymailsize tunable set to 0
Message-Id: <20160211152100.BbiKJhbv_%steffen@sdaoden.eu>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello!

I'm about to setup MLs for the first time in my life and you got
me going in an hour thanks to this program and the READMEs.
That is well worth a big THANKS!

(I took me quite some time to actually understand why VERP wasn't
working with Postfix, but it is actually stated in the README if
you listen closely enough, what i rarely do.  (Sigh))

However i have found a crash (but which may be platform related),
an inconsistency and a feature request, which is why i am actually
writing this.  Have i yet stated that i really like this program??

. A reproducable SIGSEGV crash when sending a mail to LIST+list;
  "full" bug report in [1], snippet:

    * []# printf 'From:root@sdaoden.eu\nTo: mltest+list@sdaoden.eu\n\n'|
      /usr/bin/mlmmj-receive -F -L /var/spool/mlmmj/mltest/
    Segmentation fault

    [1] http://bugs.alpinelinux.org/issues/5104

. You can't send an empty message to a list managed by mlmmj
  unless memorymailsize is forced to be 0.  The reason is that
  mail-functions.c:get_preppedhdrs_from_map() searches for \n\n
  via strstr() which fails for messages without a body.  I think
  allowing empty messages is a good thing :) and often the subject
  says it all, anyway.

. It would actually be cool to have a nodigest tunable.
  A different possibility would possibly be something like the
  (untested) hunk below.

Thanks!! and ciao

diff --git a/src/mlmmj-maintd.c b/src/mlmmj-maintd.c
index 02cfd16..3532ccb 100644
--- a/src/mlmmj-maintd.c
+++ b/src/mlmmj-maintd.c
@@ -828,7 +828,8 @@ int run_digests(const char *listdir, const char *mlmmjsend)
        int fd, indexfd, lock;
        size_t lenbuf, lenstr;
 
-       if (statctrl(listdir, "noarchive")) {
+       if (statctrl(listdir, "nodigestsub") ||
+                       statctrl(listdir, "noarchive")) {
                return 0;
        }


--steffen

