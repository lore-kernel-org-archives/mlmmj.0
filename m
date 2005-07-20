From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 20 Jul 2005 06:18:40 +0000
Subject: Re: Fw: footer isn't appended to multipart messages (part II: reality check!)
Message-Id: <20050720061840.GS83227@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <200507052130.02825.lists@seattleserver.com>
In-Reply-To: <200507052130.02825.lists@seattleserver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Jakob Hirsch <jh@plonk.de> [Jul 19. 2005 20:44]:

[...]

> btw, what happens with log_error messages? I thought they appear in
> mlmmj.operation.log...

No, that ends up in mail syslog, /var/log/maillog on a FreeBSD system,
/var/log/mail on SUSE LINUX.

I know--mlmmj logging is horrible. Some people have promised in
the past to clean it all up, so we had nice proper logging using syslog,
but so far it failed.

mlmmj.operations.log is log_oper().
-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
