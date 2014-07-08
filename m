From: Thomas Jarosch <thomas.jarosch@intra2net.com>
Date: Tue, 08 Jul 2014 08:59:40 +0000
Subject: [mlmmj] Allowing empty enevelope senders
Message-Id: <3154844.GYFGS8R0Q3@storm>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

we have one mlmmj list that gets back email bounces
from a newsletter. Such bounce emails are usually sent
using an empty envelope sender address "<>".

Currently mlmmj discards all emails with an empty envelope sender
address and this is not configurable (see mlmmj-process.c, line ~704)

I've found a good description why an empty envelope is a valid thing 
according to RFC 821, page 15:
http://marc.merlins.org/netrants/nullenvelope.txt

Should we make this configurable or disable the code altogether?
If we make it configurable: Should we invert the default value?

Best regards,
Thomas


