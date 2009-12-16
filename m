From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Wed, 16 Dec 2009 02:04:35 +0000
Subject: requeued mail files going missing from archive/
Message-Id: <20091216020435.GE29609@orbis-terrarum.net>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Lately I've had a lot of mail be requeued, and I'm running into some of the
requeue subdirectories existing, but the original mail that goes with them
going missing after being delivered only to some users.

mlmmj-maintd runs every 2 hours per the README doc.
This is with Postfix, and maxverprecip00.

# ls -lad */requeue/[0-9]*
drwx------ 2 mail mail 80 Dec 16 01:03 gentoo-dev-announce/requeue/798
drwx------ 2 mail mail 80 Nov 29 22:11 gentoo-dev/requeue/38621
drwx------ 2 mail mail 80 Dec 15 08:07 gentoo-dev/requeue/38754
drwx------ 2 mail mail 80 Dec  9 16:01 gentoo-hardened/requeue/2794
drwx------ 2 mail mail 80 Nov 14 08:16 gentoo-pr/requeue/194
drwx------ 2 mail mail 80 Nov 16 08:08 gentoo-user-ru/requeue/7742
drwx------ 2 mail mail 80 Nov 18 10:02 gentoo-user/requeue/104073
drwx------ 2 mail mail 80 Nov 20 00:04 gentoo-user/requeue/104170
drwx------ 2 mail mail 80 Nov 20 22:04 gentoo-user/requeue/104216
drwx------ 2 mail mail 80 Nov 28 12:01 gentoo-user/requeue/104460
drwx------ 2 mail mail 80 Nov 30 00:02 gentoo-user/requeue/104539
drwx------ 2 mail mail 80 Dec  2 20:06 gentoo-user/requeue/104699
drwx------ 2 mail mail 80 Dec 16 01:01 gentoo-user/requeue/105222

# wc -l */requeue/[0-9]*/sub*
   484 gentoo-dev-announce/requeue/798/subscribers
  1000 gentoo-dev/requeue/38621/subscribers
  1000 gentoo-dev/requeue/38754/subscribers
   997 gentoo-hardened/requeue/2794/subscribers
   147 gentoo-pr/requeue/194/subscribers
   401 gentoo-user-ru/requeue/7742/subscribers
  1000 gentoo-user/requeue/104073/subscribers
  1000 gentoo-user/requeue/104170/subscribers
  1000 gentoo-user/requeue/104216/subscribers
  1000 gentoo-user/requeue/104460/subscribers
  1000 gentoo-user/requeue/104539/subscribers
  1170 gentoo-user/requeue/104699/subscribers
  2000 gentoo-user/requeue/105222/subscribers
 12199 total

# for i in */requeue/[0-9]* ; do b=$(basename $i) d=${i//\/*}; ls -la $d/archive/$b  ; done ;
-rw------- 1 mail mail 2923 Dec 16 00:57 gentoo-dev-announce/archive/798
ls: cannot access gentoo-dev/archive/38621: No such file or directory
ls: cannot access gentoo-dev/archive/38754: No such file or directory
ls: cannot access gentoo-hardened/archive/2794: No such file or directory
ls: cannot access gentoo-pr/archive/194: No such file or directory
ls: cannot access gentoo-user-ru/archive/7742: No such file or directory
ls: cannot access gentoo-user/archive/104073: No such file or directory
ls: cannot access gentoo-user/archive/104170: No such file or directory
ls: cannot access gentoo-user/archive/104216: No such file or directory
ls: cannot access gentoo-user/archive/104460: No such file or directory
ls: cannot access gentoo-user/archive/104539: No such file or directory
ls: cannot access gentoo-user/archive/104699: No such file or directory
-rw------- 1 mail mail 4283 Dec 16 01:00 gentoo-user/archive/105222

-- 
Robin Hugh Johnson
Gentoo Linux: Developer, Trustee & Infrastructure Lead
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

