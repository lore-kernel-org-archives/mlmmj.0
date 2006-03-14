From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 14 Mar 2006 16:58:32 +0000
Subject: Re: relaying denied with postfix-2.2.9 and mlmmj-1.2.11
Message-Id: <20060314165831.GF79332@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20060314164202.GC1858@freek.com>
In-Reply-To: <20060314164202.GC1858@freek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Josh Rivel <josh@freek.com> [Mar 14. 2006 17:42]:
> Hi.
> So I'm running mlmmj-1.2.11 with postfix-2.2.9 on OpenBSD 3.9.
> I setup a small list with 3 or 4 user as a test, and I'm getting 
> relaying denied messages from postfix whenever I try and send email
> to the list.

Can you try and login to the box, and do:

$ telnet 127.0.0.1 25
helo freek.com
mail from: <josh@freek.com>
rcpt to: <mmj@mmj.dk>
data
From: josh@freek.com
To: mmj@mmj.dk
Subject: Telnet test

Whateveer
.


And then see if that works? Also maybe try it with the to being
dorqus@gmail.com.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
