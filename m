From: "Morten K. Poulsen" <mopo@fabletech.com>
Date: Sun, 02 Nov 2008 21:53:52 +0000
Subject: Re: mlmmj-1.2.16-PRE1 released
Message-Id: <1225662832.14901.26.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <1225491347.7486.22.camel@mopo-laptop>
In-Reply-To: <1225491347.7486.22.camel@mopo-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Dave,

On Sat, 2008-11-01 at 12:50 -0700, Dave Taylor wrote:
> Not sure if this is the appropriate place to mention this

It is.

> One is that it doesn't build when you say "make".  You need to say  
> "make mlmmj-recieve-strip".

Did you configure with --enable-recieve-strip ?

> The other is that what I'm really dying for is not a list of mime  
> types to disallow, but a list of mime types to allow.  Specifically, I  
> only want to allow text/plain.

That part is easy, if you don't need to strip anything else. Just put
the following in control/access

allow Content-Type: text/plain

> But here's the last, annoying part.  :)

Damn, I knew it :)

> I want one user in particular to be able to bypass this stripping  
> stage, because she attaches the valuable NUEA/UTA job list to her  
> emails, and we're all agreed that it's worth an exception.

allow From: user@example.org
allow Content-Type: text/plain

> I have a mailing list of about 500 people, mostly entertainment  
> industry people (producers, directors, writers, actors), and I use  
> mlmmj for it.  One of the biggest headaches, besides moderation, a  
> necessary evil to improve the signal-to-noise ratio, is dealing with  
> users who don't know how to send plain text emails.

You probably need the support in mlmmj-recieve-strip. Thet program is
written by Sascha Sommer. Perhaps he can help you? It sounds like a very
useful feature.

...
> Is there a better way to handle this?

Perhaps you could pipe the mail through something like this, before
delivering it to mlmmj?

http://www.polarhome.com:793/~gustedt/normail.html

You will have to do some tricks to allow your super user to send
multipart mails, though.

Morten

-- 
Morten K. Poulsen <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/

