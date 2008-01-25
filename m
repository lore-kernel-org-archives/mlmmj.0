From: Antti Kaihola <antti.kaihola@linux-aktivaattori.org>
Date: Fri, 25 Jan 2008 12:25:26 +0000
Subject: two mlmmj-maintd crash issues
Message-Id: <4799D536.2090806@linux-aktivaattori.org>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I've run into two issues with mlmmj-maintd.


I like to keep my list settings in a Subversion repository. When 
mlmmj-maintd encounters the .svn directory in the bounces directory, the 
following happens (output from strace):

chdir("/var/spool/mlmmj/mlmmj-test/bounce/") = 0
open("/var/spool/mlmmj/mlmmj-test/bounce/", 
O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 5
fstat64(5, {st_mode=S_IFDIR|0755, st_size@96, ...}) = 0
fcntl64(5, F_SETFD, FD_CLOEXEC)         = 0
open("/var/spool/mlmmj/mlmmj-test/control/bouncelife", O_RDONLY) = -1 
ENOENT (No such file or directory)
getdents64(5, /* 3 entries */, 4096)    = 72
stat64(".svn", {st_mode=S_IFDIR|0755, st_size@96, ...}) = 0
stat64(".svn-probe", 0xbffffa50)        = -1 ENOENT (No such file or 
directory)
open(".svn", O_RDONLY)                  = 6
read(6, 0xbffffaab, 1)                  = -1 EISDIR (Is a directory)
read(6, 0xbffffaab, 1)                  = -1 EISDIR (Is a directory)
[... last line repeats until crash ...]

and the process gradually eats all memory.

Having the bounce directory in my repository was, admittedly, a stupid 
mistake to begin with, and removing it from the repository (and thus 
removing the .svn directory) completely fixed this issue. I just wanted 
to point out that a little safety net here would have been helpful.


Another issue I found was when the mlmmj-maintd process didn't have 
permission to read a file. It went into a loop in which it mistakenly 
thought it had filled the read buffer and repeatedly doubled its size 
and eventually re-allocated all available memory. Unfortunately I didn't 
take notes when this happened last year, and I don't remember which file 
it was trying to read.

This one was a mistake from my part again, but better error handling 
from mlmmj-maintd would have helped to pin-point the problem.


I noticed mlmmj uses its own libraries for memory allocation and string 
handling. I'm not a experienced enough as a C programmer to judge the 
quality and security of those libraries, but the two above experiences 
made me wonder why some widely used and trusted open source libraries 
were not used instead.

Probably there's nothing wrong with mlmmj's libraries and my issues had 
nothing to do with them, this is just a concern I've been taught to 
think about.


Apart from these issues (which did cause some panic on our remote 
managed VPS) mlmmj has been great and feels a lot more natural to 
administer than Mailman.
