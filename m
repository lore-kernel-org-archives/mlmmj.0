From: Jakob Hirsch <jh@plonk.de>
Date: Mon, 20 Mar 2006 00:40:21 +0000
Subject: Re: testing mlmmj
Message-Id: <441DF9F5.6000305@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <20060319162716.GU31545@waterworld.anvame.net>
In-Reply-To: <20060319162716.GU31545@waterworld.anvame.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Andreas V. Meier wrote:

>>> Mar 19 01:32:41 waterworld /usr/bin/mlmmj-process[23489]:
>>> mlmmj-process.c:612: Discarding
>>> /raid/var/spool/mlmmj/mlmmj-test//incoming/ca5b636770aae27 due to
>>> invalid envelope from email count (was 0, must be 1): No such file or
>>> directory

Hm, now that I look at it, the error message looks a little strange,
esp. the "no such file..." part.

> The README.exim4 uses ${lc::$local_part} in the mlmmj_transport. At

Funny enough, somebody else was hit by this a few hours ago.

The updated version (with some other things, too) is in
http://ymmv.de/sw/mlmmj/README.exim4

Mads, could you put that in the next version? Tnx.

