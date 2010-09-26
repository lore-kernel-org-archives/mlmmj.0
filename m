From: Florian Effenberger <floeff@gmail.com>
Date: Sun, 26 Sep 2010 14:01:32 +0000
Subject: Re: [mlmmj] transport maps and virtual domains
Message-Id: <AANLkTi=_C_Z-Ktut9BxtdAOdSX+v1KhGAaUr6punqGxy@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTinTwTDb9=Ok_vTxO6fatc3zAan1gy3CeTQNCskC@mail.gmail.com>
In-Reply-To: <AANLkTinTwTDb9=Ok_vTxO6fatc3zAan1gy3CeTQNCskC@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hi Ben,

2010/9/25 Ben Schmidt <mail_ben_schmidt@yahoo.com.au>:

> It should be a piece of cake. Follow the instructions that you
> referenced at http://mlmmj.org/docs/readme-postfix/ but in
> virtual.regexp use a formula something like
>
> /^(list-name.*)@(domain\.com)$/ =A0 =A0domain--${1}
>
> and in transport use a formula something like
>
> /^(domain--list-name).*$/ =A0 =A0 =A0 =A0 =A0mlmmj:domain/list-name
>
> Then you put listdir in /var/spool/mlmmj/domain/list-name
>
> Does that make sense?

you're the man, thanks a lot! Works like a charm! Has an ugly
Delivered-To header, but these are cosmetics. :)

Thanks!
Florian


