From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 09 May 2005 13:08:27 +0000
Subject: Re: 1.2.6.1 (Was Re: 1.2.6 released. No more queue littering ...)
Message-Id: <20050509130827.GN87309@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20050509074717.GJ87309@mmj.dk>
In-Reply-To: <20050509074717.GJ87309@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Jakob Hirsch <jh@plonk.de> [May 09. 2005 14:56]:
> >So there was another condition causing potential wrong MAIL FROM: on the
> >sub-subscriber mails, and since the Subject: bug is grave enough I've
> 
> You mean it's possible that listaddr is not set (or not correct) when 
> generate_subscribed in mlmmj-sub.c is called? I don't see that right 
> now. What am I missing?

It was unsub-notsubscribed, sorry. Anyway; Here's an excerpt from
mlmmj-unsub.c (1.2.6 one) line 432:

 if(is_subbed_in(subddirname, address)) {
         /* Address is not subscribed */
         myfree(subddirname);
         myfree(listaddr);

         printf("%s is not subscribed to %s.\n", address, listaddr);
         generate_notsubscribed(listdir, listaddr, address, mlmmjsend);

         exit(EXIT_SUCCESS);
 }

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
