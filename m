From: Christian Laursen <xi@borderworlds.dk>
Date: Sun, 19 Oct 2008 13:22:03 +0000
Subject: Re: A php-webadmin fix and postfix pibe backend support.
Message-Id: <ygfy70kn2is.fsf@dominion.borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
References: <1224420715.7510.146.camel@niki-laptop>
In-Reply-To: <1224420715.7510.146.camel@niki-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Niki Guldbrand <niki@guldbrand.net> writes:

> My second patch is to make mlmmj support postfix's pipe backend, because
> my setup here is virtual, I couldn't get postfix to use the alias
> in /etc/aliases, so I added a Pipe Transport to deliver the mails to
> mlmmj-receive, but that failed too.

It isn't all that hard to do without patching.

I wrote a short mail to the list about it a while ago:
http://mlmmj.mmj.dk/archive/mlmmj/2008-02/1292.html

-- 
Christian Laursen
