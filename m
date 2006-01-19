From: Thomas Goirand <thomas@goirand.fr>
Date: Thu, 19 Jan 2006 23:53:06 +0000
Subject: Re: mlmmj-recieve silently discarding messages (Re: Is anyone using
Message-Id: <43D02662.6070405@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Charlie Brady wrote:

>
> On Fri, 13 Jan 2006, Charlie Brady wrote:
>
>> On Thu, 12 Jan 2006, Thomas Goirand wrote:
>>
>>> I AM using qmail and MLMMJ, and our control panel supports BOTH 
>>> qmail and postfix, I'd like to have MLMMJ work also with qmail. IT 
>>> IS supposed to work, I CAN SEE IN THE LOGS that it's delivering, but 
>>> in fact IT DOESN'T currently seemsly because of a right problem. But 
>>> nobody gave informations or tried to help...
>>
>>
>> If you can provide sufficient information then I can try to help.
>
>
> Thomas provided access to his machine for me to take a look.
>
> I don't see a rights (permissions) issue anywhere. I did find a qmail 
> configuration problem which meant that messages to list-xxx were 
> delivered to mlmmj-recieve, but messages to list were not, but there 
> is still a problem with list-xxx messages. mlmmj-recieve is silently 
> discarding those messages. Without any log file information at all, 
> and with a "success" status, it's difficult to know what is wrong. IMO 
> this silent (non-)success is a significant design flaw. I'd be 
> interested to know its rationale, since I assume that it was a 
> conscious decision.
>
> Here is the relevant section of an strace on mlmmj-recieve:
>
> ...
> [pid  9121] read(4, "", 4096)           = 0
> [pid  9121] fsync(3)                    = 0
> [pid  9121] close(4)                    = 0
> [pid  9121] close(3)                    = 0
> [pid  9121] open("/var/spool/mlmmj/xx_test/control/delimiter", 
> O_RDONLY) = 3
> [pid  9121] read(3, "-", 1)             = 1
> [pid  9121] read(3, "\n", 1)            = 1
> [pid  9121] close(3)                    = 0
> [pid  9121] 
> unlink("/var/spool/mlmmj/xx_test/incoming/15638ac67fb3dc2b") = 0
> [pid  9121] stat64("/var/spool/mlmmj/xx_test/control/closedlist", 
> 0xbffff3fc) = -1 ENOENT (No such file or directory)
> [pid  9121] stat64("/var/spool/mlmmj/xx_test/control/nosubconfirm", 
> 0xbffff3fc) = -1 ENOENT (No such file or directory)
> [pid  9121] open("/var/spool/mlmmj/xx_test/control/delimiter", 
> O_RDONLY) = 3
> [pid  9121] read(3, "-", 1)             = 1
> [pid  9121] read(3, "\n", 1)            = 1
> [pid  9121] close(3)                    = 0
> [pid  9121] unlink("/var/spool/mlmmj/xx_test/queue/14a10a606a18ed0f") = 0
> [pid  9121] exit_group(0)               = ?
> ...

Hello,

When I subscribe to my test list on my Qmail server, here is the recieve 
header:

Return-Path: <thomas__at__ xxx  >
Delivered-To: xen010503-gplhost-com-test-subscribe@xen010503.gplhost.com
Received: (qmail 2831 invoked from network); 11 Jan 2006 03:04:04 +0000
Received: from unknown (HELO ?192.168.5.54?) (81.64.48.14)
  by gplhost.com with SMTP; 11 Jan 2006 03:04:04 +0000
Message-ID: <43C4759A.2020009@goirand.fr>
Date: Wed, 11 Jan 2006 04:03:54 +0100
From: Thomas Goirand <thomas__at__  xxx  >
Reply-To:  thomas__at__  xxx
User-Agent: Mozilla Thunderbird 1.0.6 (Windows/20050716)
X-Accept-Language: en-us, en
MIME-Version: 1.0
To:  test-subscribe@xen010503.gplhost.com
Subject: (no subject)
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Would it be possible that mlmmj discrads the message because of the 
Delivered-To:? In fact, on my Qmail setup, when you write to 
someone@domain.tld, it will deliver to the user domain-tld-someone, and 
that's why shows this.

I tried to send that header directly to the mlmmj-recieve binary using:
cat subscribe_msg.txt | strace /usr/bin/mlmmj-recieve  -L 
/var/spool/mlmmj/xen010503.gplhost.com_test -F

The trace is then the same as the one Charlie Brady. I also tried with 
the version 1.2.10 (debian package in Sven 'Michels ftp), and the result 
is the same.

I hope this will help.

Thomas

