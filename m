From: Jakob Hirsch <jh@plonk.de>
Date: Sun, 19 Mar 2006 23:31:36 +0000
Subject: Re: testing mlmmj
Message-Id: <441DE9D8.2070503@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <20060319162716.GU31545@waterworld.anvame.net>
In-Reply-To: <20060319162716.GU31545@waterworld.anvame.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Andreas V. Meier wrote:

> Second is by using router and transport for mlmmj_domains.
> The later only makes sense when using a dedicated domain for mlmmj as
> far as I can see. At least the difference is not clear and there is no
> distinction made in the README's.

Not necessarily. You'll not need a separate domainlist if you use
local_domains.

> Mar 19 01:32:41 waterworld /usr/bin/mlmmj-process[23489]:
> mlmmj-process.c:612: Discarding
> /raid/var/spool/mlmmj/mlmmj-test//incoming/ca5b636770aae27 due to
> invalid envelope from email count (was 0, must be 1): No such file or
> directory

  headers_remove = Delivered-To
  headers_add = Delivered-To: $local_part$local_part_suffix@$domain

in the router or transport.


