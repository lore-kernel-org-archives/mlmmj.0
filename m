From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 06 Nov 2006 20:58:36 +0000
Subject: Re: why isn't it sending?..
Message-Id: <20061106205836.GR46106@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <454F97D7.9070200@poklib.org>
In-Reply-To: <454F97D7.9070200@poklib.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* B. Cook <bcook@poklib.org> [Nov 06. 2006 21:15]:
> 
>   PID USERNAME       THR PRI NICE   SIZE    RES STATE  C   TIME   WCPU 
> COMMAND
>  5399 mailnull         1 115    0  1308K   788K CPU1   1   4:29 99.02% 
> mlmmj-send
> 
> 
> mailnull  5399 98.4  0.2  1308   788  ??  R     3:08PM   5:33.10 
> /usr/local/bin/mlmmj-send -L /var/spool/mlmmj/listname -m 
> /var/spool/mlmmj/newswire/moderation/5cf0db9911c1178c.sending
> 
> There are like 5k users in this testing set..
> 
> whats going on?
> 
> it's like 'hung' at the b's ..

Can you try with 1.2.12-RC4?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
