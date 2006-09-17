From: Nate Beaty <natebeaty@gmail.com>
Date: Sun, 17 Sep 2006 16:44:58 +0000
Subject: Re: mlmmj-send processes eating cpu
Message-Id: <D72702E4-6F72-49ED-B342-3573511841B8@gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <4BFA0DC3-3060-4B2B-8FBE-E5F8DD32E84E@gmail.com>
In-Reply-To: <4BFA0DC3-3060-4B2B-8FBE-E5F8DD32E84E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sep 16, 2006, at 12:12 PM, Mads Martin Joergensen wrote:

> Can you attach an strace to one of those, seing what it does?

I actually rebooted my server before getting this message. But a day  
later, mlmmj-send has 2 processes in top:

   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
21593 Debian-e  25   0  1700  656  576 R 53.4  0.1  39:19.81 mlmmj-send
21636 Debian-e  25   0  1704  660  576 R 42.0  0.1  39:16.27 mlmmj-send

I'm not sure which options you want me to use on strace, but here's  
what shows:

 > sudo strace -p 21593
Process 21593 attached - interrupt to quit
read(7, "", 512)                        = 0
read(7, "", 512)                        = 0
read(7, "", 512)                        = 0
read(7, "", 512)                        = 0
read(7, "", 512)                        = 0
read(7, "", 512)                        = 0
read(7, "", 512)                        = 0
...

 > sudo strace -v -T -p 21636
Process 21636 attached - interrupt to quit
read(7, "", 512)                        = 0 <0.000322>
read(7, "", 512)                        = 0 <0.000182>
read(7, "", 512)                        = 0 <0.000134>
read(7, "", 512)                        = 0 <0.000145>
read(7, "", 512)                        = 0 <0.000197>
read(7, "", 512)                        = 0 <0.000146>
read(7, "", 512)                        = 0 <0.000164>
read(7, "", 512)                        = 0 <0.000215>
read(7, "", 512)                        = 0 <0.000146>

Does that help? I'm new to strace and reading through man strace I  
couldn't find anything to make more sense of the above output.

Thanks,
Nate.

--
Clixel Design & Coding ~ http://clixel.com/

