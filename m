From: Wolf Bergenheim <wolf+mlmmj@bergenheim.net>
Date: Wed, 18 Aug 2010 19:10:53 +0000
Subject: Re: [mlmmj] replacing the address
Message-Id: <AANLkTikGHymz_rHob473zKJ4d7Z4CbcR9cC8zJYM4a+S@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <201008182140.37607.a.babich@rez.ru>
In-Reply-To: <201008182140.37607.a.babich@rez.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

You can use delheader to delete From: and addheaders to add your own
custom header with customheaders. For more read the tunables:
http://mlmmj.org/docs/tunables/

--Wolf

2010/8/18 Alexei Babich <a.babich@rez.ru>:
> Hello all,
> I'm trying to organize a mailing list based on mlmmj+postfix.
> And required functionality of the mlmmj+postfix: requires that recipients of letters from mailing list not seen the real address of the sender, but the mailing list address instead.
> For example, in this letter, in my case, everything would have seen not Alexei Babich <a.babich@rez.ru>, but Alexei Babich <mlmmj@mlmmj.org>.
> Is it possible to do such a thing?
>
> Thank you.
> --
> Regards,
> Alexei Babich, circuit design engineer, Rezonans plc., Chelyabinsk, Russia
> http://www.rez.ru
> Jabber ID: impatt@jabber.ru
>
>
>



-- 
<8  )---- Wolf Bergenheim ----(  3>


