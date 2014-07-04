From: Toni Mueller <support+mlmmj@oeko.net>
Date: Fri, 04 Jul 2014 09:58:29 +0000
Subject: [mlmmj] API, bounces?
Message-Id: <20140704095829.GA23358@spruce.wiehl.oeko.net>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi,

I am looking into working with mlmmj without using the command line
programs if possible. Instead, I want to read and write directly to the
files that are typically found under /var/spool/mlmmj. The reason is
that I want to configure mlmmj from inside another program, and possibly
bypassing parts of mlmmj.

How much are the files in there subject to change? Anything specific to
watch out for?

Most importantly, how do I discover that a subscriber has been disabled
because the email(s) could not be delivered? I already know about
<list-dir>/bounce/<addrstring>? And how can I possibly tune this? I'd
like to block further deliveries after N delivery problems/T time after
delivery problems started to occur?

TIA!


Kind regards,
--Toni++


