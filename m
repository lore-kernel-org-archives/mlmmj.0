From: Nate Beaty <natebeaty@gmail.com>
Date: Sat, 16 Sep 2006 18:29:51 +0000
Subject: mlmmj-send processes eating cpu
Message-Id: <4BFA0DC3-3060-4B2B-8FBE-E5F8DD32E84E@gmail.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I noticed today my server was creeping along, and top shows multiple  
mlmmj-send instances running:

   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
12707 Debian-e  25   0  1700  656  576 R 19.8  0.1 343:26.36 mlmmj-send
19468 Debian-e  25   0  1700  660  576 R 18.1  0.1  10:11.16 mlmmj-send
  8615 Debian-e  25   0  1712  676  584 R 17.8  0.1  29:10.13 mlmmj-send
19469 Debian-e  25   0  1700  656  576 R 16.8  0.1  10:10.91 mlmmj-send
  8618 Debian-e  25   0  1704  664  576 R 16.5  0.1  29:10.66 mlmmj-send

Yesterday a client sent out newsletters to some large lists (some  
over 20,000, most around 1-2,000) which seemed to go fine for the  
most part. But now I have these mlmmj-send processes stuck eating all  
my CPU. Any idea of why or how to troubleshoot this?

This is with the latest 1.2.12RC2 release, Exim4, dnsmasq.

Any help much appreciated. (And I still haven't gotten the new submod  
tunable to work for me, either...)

Nate.

--
Clixel Design & Coding ~ http://clixel.com/

