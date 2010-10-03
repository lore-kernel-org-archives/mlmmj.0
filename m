From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sun, 03 Oct 2010 12:54:55 +0000
Subject: [mlmmj] Is using the include path for php-admin a good idea?
Message-Id: <4CA87D1F.6030009@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi, everybody,

A patch was proposed to have conf/tunables.pl searched for in php's
include path.

http://mlmmj.org/bugs/bug.php?id=4

I'm wondering on people's opinions on this. Is it a good idea?

I actually think it probably isn't. On the one hand, even though
conf/tunables.pl is a somewhat generic name, it's a fairly unlikely one,
so name clashes are unlikely to be a problem. On the other hand, though,
using the include path effectively would require setting the include
path (which is a hassle; more so than just moving the tunables.pl file
around), or installing tunables.pl in a system-wide location where it is
likely to be missed for upgrades and so on.

If anything, perhaps we should just move tunables.pl into the same
directory as the PHP scripts that run the interface, dropping the
../conf? It will always be found then.

Thoughts?

Ben.





