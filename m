From: "A. Schulze" <sca@andreasschulze.de>
Date: Sun, 10 Jun 2018 20:36:32 +0000
Subject: Re: [mlmmj] new mlmmj install on 64bit CentOS 7 server running Exim
Message-Id: <215fa81e-605c-98fd-2723-f39296dea6a6@andreasschulze.de>
List-Id: <mlmmj.mlmmj.org>
References: <dc20d767-6a0c-f51c-e72a-23e89d0b5985@vlsc.org>
In-Reply-To: <dc20d767-6a0c-f51c-e72a-23e89d0b5985@vlsc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org



Am 10.06.2018 um 22:13 schrieb webmaster:
> /usr/local/bin/mlmmj-process[29043]: subscriberfuncs.c:135: Could not open /var/spool/mlmmj/vlsc-test/subscribers.d/test.txt: Permission denied
> 
> So it is a linux permissions issue; not really a non-subscriber issue.
> 
> I renamed the subscriber file to 't' but still getting a post denial bounce.
did you also fix the permission issue?


what give "ls -la /var/spool/mlmmj/vlsc-test/subscribers.d/t"

the file /var/spool/mlmmj/vlsc-test/subscribers.d/t must be readable by user mlmmj...
check also, /any/ path is accessible:

su --login --shell /bi/sh mlmmj
cd /var
cd spool
cd mlmmj
cd vlsc-test
cd subscribers.d
cat t

This should finally give you the content of "t" Otherwise you found the protential place of your issue.

Andreas

