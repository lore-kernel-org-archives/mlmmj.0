From: Kovacs Albert <albibacsi@gmail.com>
Date: Mon, 04 Apr 2011 14:54:49 +0000
Subject: [mlmmj] bounces from a closed list back to spoofed email addresses
Message-Id: <BANLkTi=DTJ6pFmLUF3sc_Lf2heGpWXdxRg@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello,

I have a problem with one of my closed lists. Whenever a spammer tries
to send an email, of course mlmmj bounces back a message that it's a
closed list for subscribers only. So far, it's fine.

However most of the time spammers enter a fake email address, and
mlmmj tries to send back the bounces to the spoofed email addresses,
which is of course impossible, so my postfix queue is filling with
undeliverable mlmmj messages.

My question is how to get rid of these messages? It would be nice if
mlmmj could be set on a per list base to discard (ie. not to send) any
bounce messages.

Best regards,
Bela

