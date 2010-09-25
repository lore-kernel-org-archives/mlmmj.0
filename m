From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sat, 25 Sep 2010 15:25:23 +0000
Subject: Re: [mlmmj] transport maps and virtual domains
Message-Id: <4C9E1463.2020108@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTinTwTDb9=Ok_vTxO6fatc3zAan1gy3CeTQNCskC@mail.gmail.com>
In-Reply-To: <AANLkTinTwTDb9=Ok_vTxO6fatc3zAan1gy3CeTQNCskC@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

It should be a piece of cake. Follow the instructions that you
referenced at http://mlmmj.org/docs/readme-postfix/ but in
virtual.regexp use a formula something like

/^(list-name.*)@(domain\.com)$/    domain--${1}

and in transport use a formula something like

/^(domain--list-name).*$/          mlmmj:domain/list-name

Then you put listdir in /var/spool/mlmmj/domain/list-name

Does that make sense?

Disclaimer: I haven't actually done this, though I've tried similarish
things. I think it'll work from what I know of Postfix, but could always
be wrong!

Ben.



On 25/09/10 10:31 PM, Florian Effenberger wrote:
> Hi,
>
> at the moment, I use a little workaround to have several virtual list
> domains with similar list names in Postfix. It's like that:
>
> mlmmj-make-ml -s /var/spool/mlmmj/site1.org -L announce
> mlmmj-make-ml -s /var/spool/mlmmj/site2.org -L announce
>
> Alias: ml-site1-announce:        "|/usr/bin/mlmmj-recieve -L
> /var/spool/mlmmj/site1/announce/"
> Alias: ml-site2-announce:        "|/usr/bin/mlmmj-recieve -L
> /var/spool/mlmmj/site2/announce/"
>
> Virtual Alias Domain: announe@site1 ml-site1-announce
> Virtual Alias Domain: announe@site2 ml-site2-announce
>
> It works like a charm. Now I wanted to switch over to Postfix
> transport maps as described in http://mlmmj.org/docs/readme-postfix/,
> however, I can't find a way to achieve something similar as what I do,
> having same list names on multiple domains.
>
> Is there an easy solution?
>
> Thanks,
> Florian
>
>
>


