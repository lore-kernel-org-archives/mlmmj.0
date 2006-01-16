From: Charlie Brady <charlieb@budge.apana.org.au>
Date: Mon, 16 Jan 2006 17:05:43 +0000
Subject: mlmmj-recieve silently discarding messages (Re: Is anyone using
Message-Id: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Fri, 13 Jan 2006, Charlie Brady wrote:

> On Thu, 12 Jan 2006, Thomas Goirand wrote:
>
>> I AM using qmail and MLMMJ, and our control panel supports BOTH qmail and 
>> postfix, I'd like to have MLMMJ work also with qmail. IT IS supposed to 
>> work, I CAN SEE IN THE LOGS that it's delivering, but in fact IT DOESN'T 
>> currently seemsly because of a right problem. But nobody gave 
>> informations or tried to help...
>
> If you can provide sufficient information then I can try to help.

Thomas provided access to his machine for me to take a look.

I don't see a rights (permissions) issue anywhere. I did find a qmail 
configuration problem which meant that messages to list-xxx were delivered 
to mlmmj-recieve, but messages to list were not, but there is still a 
problem with list-xxx messages. mlmmj-recieve is silently discarding those 
messages. Without any log file information at all, and with a "success" 
status, it's difficult to know what is wrong. IMO this silent 
(non-)success is a significant design flaw. I'd be interested to know its 
rationale, since I assume that it was a conscious decision.

Here is the relevant section of an strace on mlmmj-recieve:

...
[pid  9121] read(4, "", 4096)           = 0
[pid  9121] fsync(3)                    = 0
[pid  9121] close(4)                    = 0
[pid  9121] close(3)                    = 0
[pid  9121] open("/var/spool/mlmmj/xx_test/control/delimiter", O_RDONLY) = 3
[pid  9121] read(3, "-", 1)             = 1
[pid  9121] read(3, "\n", 1)            = 1
[pid  9121] close(3)                    = 0
[pid  9121] unlink("/var/spool/mlmmj/xx_test/incoming/15638ac67fb3dc2b") = 0
[pid  9121] stat64("/var/spool/mlmmj/xx_test/control/closedlist", 0xbffff3fc) = -1 ENOENT (No such file or directory)
[pid  9121] stat64("/var/spool/mlmmj/xx_test/control/nosubconfirm", 0xbffff3fc) = -1 ENOENT (No such file or directory)
[pid  9121] open("/var/spool/mlmmj/xx_test/control/delimiter", O_RDONLY) = 3
[pid  9121] read(3, "-", 1)             = 1
[pid  9121] read(3, "\n", 1)            = 1
[pid  9121] close(3)                    = 0
[pid  9121] unlink("/var/spool/mlmmj/xx_test/queue/14a10a606a18ed0f") = 0
[pid  9121] exit_group(0)               = ?
...
