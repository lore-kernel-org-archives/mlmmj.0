From: Christian Laursen <xi@borderworlds.dk>
Date: Wed, 30 Mar 2005 18:16:50 +0000
Subject: Re: 2 or more ml with same name
Message-Id: <86br9180dp.fsf@borg.borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
References: <1112205211.20345.17.camel@zion>
In-Reply-To: <1112205211.20345.17.camel@zion>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

lupin3rd <lupin3rd@gmx.it> writes:

> now i want create 2 or more mailing list with same name but in different
> domains:
> 
> ml@domain1.tld
> ml@domain2.tld
> 
> is it possible?

Yes, we do it.

> i try in this way
> 
> in postfix aliases file i have insert:
> 
> ml: "|/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/ml/"
> ml1: "|/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/ml1/"
> 
> and in postfix virtual:
> ml@domain1.tld: ml
> ml@domain2.tld: ml1

We do something very similar.

> But i have problem.... the first mailing list works... if i send an
> email to the second mailing list i have this:

Make sure that the value in /var/spool/mlmmj/ml1/control/listaddress
is set to the same address as you use in the virtual file. Then it should
work.

-- 
Christian Laursen
