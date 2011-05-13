From: Thomas Jarosch <thomas.jarosch@intra2net.com>
Date: Fri, 13 May 2011 13:19:27 +0000
Subject: [mlmmj] Mail loss on failed mmap
Message-Id: <201105131519.27505.thomas.jarosch@intra2net.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello,

I recently had lost "big" emails containing attachments
while running them through mlmmj 1.2.15. Here's the relevant log output:

-------------------------
 May 2 14:33:55 /usr/bin/mlmmj-send[13098]: mlmmj-send.c:891: Not preparing 
in memory. Mail is 6428395 bytes: Success
 May 2 14:33:55 /usr/bin/mlmmj-send[13098]: getaddrsfromfd.c:27: Could not 
mmap fd: Invalid argument
-------------------------

Do I guess correctly that getaddrsfromfd() returns -1 and then
the mail is silently discarded?

mlmmj 1.2.16+ contains Robin's fix for a mmap() call of zero bytes.
I'm wondering if that might be an issue but the file size
shouldn't be zero bytes anyway.

Cheers,
Thomas

