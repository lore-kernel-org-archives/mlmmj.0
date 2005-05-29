From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sun, 29 May 2005 14:50:16 +0000
Subject: Re: qmail mlmmj Return-Path issue (SOLVED)
Message-Id: <20050529145016.GB80686@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <428B2A8900013632@ims3a.cp.tin.it>
In-Reply-To: <428B2A8900013632@ims3a.cp.tin.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* fifadd@tin.it <fifadd@tin.it> [May 27. 2005 15:00]:
> It's my mistake.
> 
> qmail-inject remove Return-Path but you can add it using preline. So into
> your .qmail-myest write:
> 
> |preline -f /usr/local/bin/mlmmj-recieve -L /var/spool/mlmmj/mytest/
> 
> preline add Return-Path and Delivery-To and From by default, so -f remove
> >From and -r remove Return-Path (this was my previuos mistake).
> 
> If you are using vpopmail set:
> 
> chwon -R vpopmail /var/spool/mlmmj
> chgrp -R vchkpw /var/spool/mlmmj
> 
> and create the alias under /home/vpopmail/domains/mydomain/.qmail-mytest
> 
> If you want you can write a README.qmail with this hint, it will be
> appreciate.

Why don't you do it and send it to me? You're the one who figured this
out.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
