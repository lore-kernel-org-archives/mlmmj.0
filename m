From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sat, 12 Mar 2005 13:42:22 +0000
Subject: Re: exim4
Message-Id: <20050312134222.GS12734@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4232593D.2000404@plonk.de>
In-Reply-To: <4232593D.2000404@plonk.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Jakob Hirsch <jh@plonk.de> [Mar 12. 2005 03:51]:
> Hi,
> 
> I have mlmmj 1.2.4 with exim4 running. For the archives, if somebody 
> runs into the same problems as me: return_path_add is needed in the 
> transport calling mlmmj-recieve. I had a hard time finding that out, 
> that should really be in the README.

Could you maybe write it into README.exim and send it to me, then I'll
include it.

> Anyway, I chose to use my own router and transport for mlmmj:
> 
> # main config
> 
> MLMMJ_HOME=/var/spool/mlmmj
> domainlist ml_domains = my.list.domain
> 
> 
> domainlist relay_to_domains = +ml_domains
> 
> 
> begin routers
> 
> mlmmj_router:
>   driver = accept
>   domains = +ml_domains
>   require_files = MLMMJ_HOME/$local_part/index
>   local_part_suffix = +*
>   local_part_suffix_optional
>   transport = mlmmj_transport
> 
> 
> begin transports
> 
> mlmmj_transport:
>   driver = pipe
>   return_path_add
>   user = mlmmj
>   group = mlmmj
>   home_directory = MLMMJ_HOME
>   current_directory = MLMMJ_HOME
>   command = /usr/local/bin/mlmmj-recieve -F -L MLMMJ_HOME/$local_part
> 
> 
> 
> 
> Next thing to look for is VERP, but it works right now and I have only a 
> low volume list.
> 
> 
> btw, why is it needed to run the mlmmj-tools always with full path? It's 
> a little annoying.

It's needed to figure out where the other mlmmj binaries are located.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
