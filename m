From: lupin3rd <lupin3rd@gmx.it>
Date: Wed, 30 Mar 2005 19:02:46 +0000
Subject: Re: 2 or more ml with same name
Message-Id: <1112209367.31770.7.camel@zion>
List-Id: <mlmmj.mlmmj.org>
References: <1112205211.20345.17.camel@zion>
In-Reply-To: <1112205211.20345.17.camel@zion>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Thanks a lot!! All works fine!! Very good software!!

In this way i can create mailing list:

/var/spool/mlmmj/domain1-1/
/var/spool/mlmmj/domain1-2/
/var/spool/mlmmj/domain2-1/
/var/spool/mlmmj/domain2-2/

and assign it to email that customer want in simple way...

Mlmmj can be integrate in most GPL control panel :)

Very good works!

Il giorno mer, 30-03-2005 alle 20:16 +0200, Christian Laursen ha
scritto:
> lupin3rd <lupin3rd@gmx.it> writes:
> 
> > now i want create 2 or more mailing list with same name but in different
> > domains:
> > 
> > ml@domain1.tld
> > ml@domain2.tld
> > 
> > is it possible?
> 
> Yes, we do it.
> 
> > i try in this way
> > 
> > in postfix aliases file i have insert:
> > 
> > ml: "|/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/ml/"
> > ml1: "|/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/ml1/"
> > 
> > and in postfix virtual:
> > ml@domain1.tld: ml
> > ml@domain2.tld: ml1
> 
> We do something very similar.
> 
> > But i have problem.... the first mailing list works... if i send an
> > email to the second mailing list i have this:
> 
> Make sure that the value in /var/spool/mlmmj/ml1/control/listaddress
> is set to the same address as you use in the virtual file. Then it should
> work.
> 

