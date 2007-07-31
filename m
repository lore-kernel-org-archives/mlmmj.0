From: Thomas Goirand <thomas@goirand.fr>
Date: Tue, 31 Jul 2007 15:49:19 +0000
Subject: Current Etch version of MLMMJ seems to suffer from a known and corrected
Message-Id: <46AF59FF.5040101@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Dear list,

Here's what I saw in one of my server's syslog:

Jul 30 22:15:58 mx /usr/bin/mlmmj-process[17885]: subscriberfuncs.c:61:
Could not mmap fd: Invalid argument
Jul 30 22:15:58 mx /usr/bin/mlmmj-send[17885]: getaddrsfromfd.c:27:
Could not mmap fd: Invalid argument
Jul 30 22:16:56 mx /usr/bin/mlmmj-bounce[18009]: subscriberfuncs.c:61:
Could not mmap fd: Invalid argument
Jul 30 22:17:48 mx /usr/bin/mlmmj-bounce[18124]: subscriberfuncs.c:61:
Could not mmap fd: Invalid argument

As I saw this in the archive of the list:

http://mlmmj.mmj.dk/archives/mlmmj/2006-08/0758.html

with this reply:

http://mlmmj.mmj.dk/archives/mlmmj/2006-08/0759.html

I was wondering what you would advise to patch in the current Debian
stable version, so we can have it patched.

Best regards,

Thomas Goirand

P.S: Please keep the address 435420@bugs.debian.org as cc so it can be
sent to the Debian bug tracker system (BTS) case that I have just open,
and with it's archive can be seen here:

http://bugs.debian.org/cgi-bin/bugreport.cgi?bugC5420
