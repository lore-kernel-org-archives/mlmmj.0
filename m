From: Charlie Brady <charlieb@budge.apana.org.au>
Date: Sat, 21 Jan 2006 20:40:03 +0000
Subject: Re: mlmmj-recieve silently discarding messages (Re: Is anyone	using
Message-Id: <Pine.LNX.4.61.0601211531300.26660@e-smith.charlieb.ott.istop.com>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Sat, 21 Jan 2006, Charlie Brady wrote:

> [Here message is copied from incoming to queue file]
>
> Note that first Delivered-To header does not match the envelope recipient 
> address, due to qmail's method of virtual domain handling:
>
> 7940  write(3, "Delivered-To: xen010503-gplhost-"..., 68) = 68
> ...
...
> From the stat64 of "closedlist" downwards it's listcontrol() which is 
> running. We expect something "meaty" to happen there, but nothing useful 
> happens at all.

This is what syslog tells us if I enable the debug logs in listcontrol:

Jan 21 20:31:05 xen010503 /usr/bin/mlmmj-process[8341]: listcontrol.c:141: 
controlstr = [gplhost-com-test-help] : No such file or directory
Jan 21 20:31:05 xen010503 /usr/bin/mlmmj-process[8341]: listcontrol.c:142: 
fromemails->emaillist[0] = [charlieb@budge.apana.org.au] : No such file or 
directory
