From: Piotr Auksztulewicz <mlmmj-listrcpt@hasiok.net>
Date: Mon, 15 Feb 2021 14:52:36 +0000
Subject: [mlmmj] [PATCH] Selective 'notmetoo'
Message-Id: <20210215145236.GV20431@bonclok.hasiok.net>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Fri, Feb 12, 2021 at 11:53:07AM +0100, Piotr Auksztulewicz wrote:
> I looked at the mlmmj code yesterday and made a first attempt at it. I need
> to test it somehow though. Since the problem just went away, I would need to
> setup some artificial environment...

I have tested my patch by setting up a few local addresses, creating a test
list, subscribing that addresses and then sending emails from them, while
tweeking my new notmeetoo tunable. Seems to work fine.

The new version of notmetoo tunable is backwards-compatible. If it's unset
(file doesn't exists), mlmmj sends copies to all originators when they post
to the list. If it is an empty file, mlmmj does not send copies to any
originator. The new functionality is, when you put some email addresses in
the file (one per line), copies are sent to all originators except those listed.

This may work fine if you only have a few exceptions, but may be a bit
troublesome if you have a lot of them. Subscribers lists are segmented by
the initial letter, so it's a bit lighter on the filesystem, but not too much.
Anyway, implementing per-subscriber tunables would be a huge update and
probably not worth the effort for just this purpose.

I include the patch below. I was struggling to show some love for mlmmj on
Valentine's day, but I was so busy with my real life Valentines yesterday.
Sorry, mlmmj.


diff --git a/src/mlmmj-process.c b/src/mlmmj-process.c
index 82e4d04..785aadd 100644
--- a/src/mlmmj-process.c
+++ b/src/mlmmj-process.c
@@ -477,6 +477,7 @@ int main(int argc, char **argv)
        struct email_container ccemails = { 0, NULL };
        struct email_container rpemails = { 0, NULL };
        struct email_container dtemails = { 0, NULL };
+       struct strlist *notmetooaddrs = NULL;
        struct strlist *access_rules = NULL;
        struct strlist *delheaders = NULL;
        struct strlist allheaders;
@@ -1118,7 +1119,22 @@ int main(int argc, char **argv)
                }
        }

-       notmetoo = statctrl(listdir, "notmetoo");
+       if (statctrl(listdir, "notmetoo")) {
+               notmetooaddrs = ctrlvalues(listdir, "notmetoo");
+               if (notmetooaddrs->count > 0) {
+                       for (i = 0; i < notmetooaddrs->count; ++i) {
+                               if (strcasecmp(posteraddr, notmetooaddrs->strs[i]) = 0) {
+                                       notmetoo = 1;
+                               }
+                       }
+               } else {
+                       notmetoo = 1;
+               }
+               for(i = 0; i < notmetooaddrs->count; i++)
+                       myfree(notmetooaddrs->strs[i]);
+               myfree(notmetooaddrs->strs);
+               myfree(notmetooaddrs);
+       }

        if(moderated) {
                mqueuename = concatstr(3, listdir, "/moderation/",

-- 
Piotr "Malgond" Auksztulewicz                     firstname@lastname.net

