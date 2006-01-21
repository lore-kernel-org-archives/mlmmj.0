From: Charlie Brady <charlieb@budge.apana.org.au>
Date: Sat, 21 Jan 2006 20:26:32 +0000
Subject: Re: mlmmj-recieve silently discarding messages (Re: Is anyone	using
Message-Id: <Pine.LNX.4.61.0601211517290.26660@e-smith.charlieb.ott.istop.com>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Sat, 21 Jan 2006, Charlie Brady wrote:

> On Thu, 19 Jan 2006, Morten K. Poulsen wrote:
>
>> The attached patch adds log messages at all points where a mail is 
>> discarded. Could you please try it, and see if it helps you?
>
> It doesn't - we must still be hitting some other "unlink and exit" condition.

Here's what's happening, as I guess that will help you trace where the 
"silent discard" is:

7940 
open("/var/spool/mlmmj/xen010503.gplhost.com_test/queue/205d5fae69d05439", 
O_RDWR|O_CREAT|O_EXCL, 0600) = 3
7940 
open("/var/spool/mlmmj/xen010503.gplhost.com_test/incoming/1d5fdb9c5ba5d0a6", 
O_RDONLY) = 4
7940 
open("/var/spool/mlmmj/xen010503.gplhost.com_test/control/customheaders", 
O_RDONLY) = -1 ENOENT (No such file or directory)
7940  open("/var/spool/mlmmj/xen010503.gplhost.com_test/control/footer", 
O_RDONLY) = -1 ENOENT (No such file or directory)
7940 
open("/var/spool/mlmmj/xen010503.gplhost.com_test/control/delheaders", 
O_RDONLY) = -1 ENOENT (No such file or directory)
7940  open("/var/spool/mlmmj/xen010503.gplhost.com_test/control/prefix", 
O_RDONLY) = -1 ENOENT (No such file or directory)
...

[Here message is copied from incoming to queue file]

Note that first Delivered-To header does not match the envelope recipient 
address, due to qmail's method of virtual domain handling:

7940  write(3, "Delivered-To: xen010503-gplhost-"..., 68) = 68
...
7940 
open("/var/spool/mlmmj/xen010503.gplhost.com_test/control/delimiter", 
O_RDONLY) = 3
7940  read(3, "-", 1)                   = 1
7940  read(3, "\n", 1)                  = 1
7940  close(3)                          = 0
7940 
unlink("/var/spool/mlmmj/xen010503.gplhost.com_test/incoming/1d5fdb9c5ba5d0a6") 
= 0
7940 
stat64("/var/spool/mlmmj/xen010503.gplhost.com_test/control/closedlist", 
0xbffff6ac) = -1 ENOENT (No such file or directory)
7940 
stat64("/var/spool/mlmmj/xen010503.gplhost.com_test/control/closedlistsub", 
0xbffff6ac) = -1 ENOENT (No such file or directory)
7940 
stat64("/var/spool/mlmmj/xen010503.gplhost.com_test/control/nosubconfirm", 
0xbffff6ac) = -1 ENOENT (No such file or directory)
7940 
open("/var/spool/mlmmj/xen010503.gplhost.com_test/control/delimiter", 
O_RDONLY) = 3
7940  read(3, "-", 1)                   = 1
7940  read(3, "\n", 1)                  = 1
7940  close(3)                          = 0
7940 
unlink("/var/spool/mlmmj/xen010503.gplhost.com_test/queue/205d5fae69d05439") 
= 0
7940  exit_group(0)                     = ?

From the stat64 of "closedlist" downwards it's listcontrol() which is 
running. We expect something "meaty" to happen there, but nothing useful 
happens at all.

[Notice, btw, that "delimiter" is read twice.]



