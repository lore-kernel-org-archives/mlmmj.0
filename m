From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 09 May 2005 16:35:01 +0000
Subject: Re: 1.2.6.1 (Was Re: 1.2.6 released. No more queue littering ...)
Message-Id: <20050509163501.GQ87309@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20050509074717.GJ87309@mmj.dk>
In-Reply-To: <20050509074717.GJ87309@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Jakob Hirsch <jh@plonk.de> [May 09. 2005 18:25]:
> > if(is_subbed_in(subddirname, address)) {
> >         /* Address is not subscribed */
> >         myfree(subddirname);
> >         myfree(listaddr);
> >
> >         printf("%s is not subscribed to %s.\n", address, listaddr);
> >         generate_notsubscribed(listdir, listaddr, address, mlmmjsend);
> 
> Because of myfree(listaddr) and using listaddr after that, right? Then 
> using listaddr in printf is also not ok.

Yes, the printf is wrong too. *sigh* I need to move this to mempools
ASAP.

> Wouldn't it be easier to move to myfree(listaddr) below the printf and 
> generate_notsubscribed?

I would rather only always rely on listdir, since we're sure it's not
gone underneath us.

> And in mlmmj-sub.c listaddr is not freed in the block where 
> generate_subscribed is called.

No, the problem only existed in mlmmj-unsub.c

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
