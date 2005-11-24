From: Artis Caune <Artis.Caune@latnet.lv>
Date: Thu, 24 Nov 2005 13:21:51 +0000
Subject: Re: addresses with "dot"
Message-Id: <1132838511.79448.131.camel@artis.latnet.lv>
List-Id: <mlmmj.mlmmj.org>
References: <1132749065.79448.64.camel@artis.latnet.lv>
In-Reply-To: <1132749065.79448.64.camel@artis.latnet.lv>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I have turned debug log:

It receive confirmation, ir extract control string, but e-mail address
is converted to lowercase. Exim do not convert addresses to lowercase:



Nov 24 15:04:37 mansMazulis exim[34718]: 2005-11-24 15:04:37
1EfGmD-00091y-Qy <= Artis.Caune@latnet.lv H=esbens.latnet.lv
[159.148.19.115] P=esmtp S"86
id32837485.79448.119.camel@artis.latnet.lv

Nov 24 15:04:37 mansMazulis /usr/local/bin/mlmmj-process[34721]:
mlmmj-process.c:419: donemailname [/var/spool/mlmmj/zeiferta-7/queue/42216f8c6d52f14] : Unknown error: 0

Nov 24 15:04:37 mansMazulis /usr/local/bin/mlmmj-process[34721]:
find_email_adr.c:68: find_email_adr POST, [Artis.Caune@latnet.lv] : No
such file or directory

Nov 24 15:04:37 mansMazulis /usr/local/bin/mlmmj-process[34721]:
find_email_adr.c:68: find_email_adr POST, [zeiferta-7
+confsub-3cdbc5be58a1bf57-Artis.Caune=latnet.lv@mansMazulis.lv] : No
such file or directory

Nov 24 15:04:37 mansMazulis /usr/local/bin/mlmmj-process[34721]:
find_email_adr.c:68: find_email_adr POST, [Artis.Caune@latnet.lv] : No
such file or directory

Nov 24 15:04:37 mansMazulis /usr/local/bin/mlmmj-process[34721]:
find_email_adr.c:68: find_email_adr POST, [zeiferta-7
+confsub-3cdbc5be58a1bf57-artis.caune=latnet.lv@mansmazulis.lv] : No
such file or directory

Nov 24 15:04:37 mansMazulis /usr/local/bin/mlmmj-process[34721]:
mlmmj-process.c:567: listcontrol(from, /var/spool/mlmmj/zeiferta-7,
zeiferta-7
+confsub-3cdbc5be58a1bf57-Artis.Caune=latnet.lv@mansMazulis.lv, /usr/local/bin/mlmmj-sub, /usr/local/bin/mlmmj-unsub, /usr/local/bin/mlmmj-send, /usr/local/bin/mlmmj-bounce) : No such file or directory

Nov 24 15:04:37 mansMazulis exim[34719]: 2005-11-24 15:04:37
1EfGmD-00091y-Qy => zeiferta-7 <zeiferta-7
+confsub-3cdbc5be58a1bf57-Artis.Caune=latnet.lv@mansMazulis.lv>
R=mlmmj_router T=mlmmj_transport

Nov 24 15:04:37 mansMazulis exim[34719]: 2005-11-24 15:04:37
1EfGmD-00091y-Qy Completed




# ls subconf/
3cdbc5be58a1bf57-Artis.Caune=latnet.lv





On Thu, 2005-11-24 at 14:33 +0200, Artis Caune wrote:
> emailprogramm is Evolution (FreeBSD)
> but I have even tried send confirmation with `telnet localhost 25`
> 
> 
> 
> 
> 
> > mlmmj 1.2.8 
> > 
> > when subscribing to mailinglist with address which contains "dot", I 
> > receive confirmation e-mail, bet when I reply to it, nothing happens. 
> > regular addresses works okay 
> 
> 
> I can confirm several people have subscribed to the mlmmj mailinglist 
> with a dot "." in thei'r emailaddress. 
> 
> 
> What emailprogram are you trying to subscribe from? 
> 
> 
> 

