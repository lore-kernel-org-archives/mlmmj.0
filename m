From: Thomas Goirand <thomas@goirand.fr>
Date: Mon, 07 Mar 2011 17:20:43 +0000
Subject: [mlmmj] Fwd: Bug#617242: mlmmj-make-ml does not ensure correct permissions
Message-Id: <4D7513EB.7090407@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Someone sent this against the MLMMJ package in Debian. I found it a very
valid request. I think either mlmmj-make-ml should set the umask
explicitly, or even better, perform some chmods.

Thomas

-------- Original Message --------
Subject: Bug#617242: mlmmj-make-ml does not ensure correct permissions
for created files and directories
Resent-Date: Mon, 07 Mar 2011 13:21:02 +0000,	Mon, 07 Mar 2011 13:21:05
+0000
Resent-From: Reuben Thomas <rrt@sc3d.org>
Resent-To: debian-bugs-dist@lists.debian.org
Resent-CC: MLMMJ packaging team <pkg-mlmmj-devel@lists.alioth.debian.org>
Date: Mon, 07 Mar 2011 13:16:46 +0000
From: Reuben Thomas <rrt@sc3d.org>
Reply-To: Reuben Thomas <rrt@sc3d.org>, 617242@bugs.debian.org
To: Debian Bug Tracking System <submit@bugs.debian.org>

Package: mlmmj
Version: 1.2.17-1
Severity: minor


I have my umask set to 0027. If I run mlmmj-make-ml with sudo, then
this umask is inherited, and used to create all the files and
directories for a new mailing list, which is wrong. The files and
directories should be explicitly chmodded to the correct permissions.


