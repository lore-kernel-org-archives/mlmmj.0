From: "Steffen (Daode) Nurpmeso" <steffen@sdaoden.eu>
Date: Thu, 25 Feb 2016 15:38:25 +0000
Subject: [mlmmj] A small set of patches (Was: Empty messages not delivered unless memorymailsize tunable set 
Message-Id: <cover.1456413512.git.steffen@sdaoden.eu>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello Mr. Big Ben,

whereas possibly not truly meaningful ;) i have found / stumbled
upon some oddities that this patch series against the 1.2.19
tarball should fix.  Maybe some of them are of interest anyway.

The 1.2.18.0 problem with a leading space in headers (as in
"Subject:=?utf-8?q?_Post_" instead of "=?utf-8?q?Frequent") seems
to be fixed in 1.2.19 (not in ChangeLog though).

Ciao.

Steffen (Daode) Nurpmeso (6):
  mlmmj-send.c:main(): reject empty messages (early)
  mlmmj-send.c:main():memorymailsize: handle
    sizeof(long)!=sizeof(ssize_t) cases
  Replace get_prepped*_from_map() series..
  listcontrol(): be aware that ctrlvalues() can return NULL
  mlmmj-sub.c:moderate_sub(): be aware that ctrlvalues() can return NULL
  mlmmj-process.c:newmoderated: do not crash for empty "moderators"

 include/mail-functions.h |  15 +++-
 src/listcontrol.c        |  19 ++---
 src/mail-functions.c     | 176 ++++++++++++++++++++++++++++++-----------------
 src/mlmmj-process.c      |  10 ++-
 src/mlmmj-send.c         |  28 ++++++--
 src/mlmmj-sub.c          |  16 +++--
 6 files changed, 174 insertions(+), 90 deletions(-)

--
2.7.1

