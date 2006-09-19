From: Nate Beaty <natebeaty@gmail.com>
Date: Tue, 19 Sep 2006 06:58:23 +0000
Subject: Re: mlmmj-send processes eating cpu
Message-Id: <2B27803A-561F-482C-997B-D5C2DED0B48F@gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <4BFA0DC3-3060-4B2B-8FBE-E5F8DD32E84E@gmail.com>
In-Reply-To: <4BFA0DC3-3060-4B2B-8FBE-E5F8DD32E84E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> he function that checks SMTP replies was not doing proper EOF  
> checking, so it would enter an infinite loop if the SMTP server  
> closed the connection while mlmmj was waiting for the reply.
>
> I have fixed the issue. Please try the following patch:

This seems to have worked. I haven't seen any rampant mlmmj-send  
processes since upgrading to 1.2.12.

Could this by any chance be related to one of the users getting 30+  
copies of the bounce message to an address that he had deactivated  
(I'm not sure what he means by that, but the fact that he's gotten so  
many of these is odd)?

>  -------Original Message-------
>  From: topshelf-newsletter-media+owner@lists.clixel.com
>  Subject: Messages from topshelf-newsletter-media@lists.clixel.com  
> to you have been bouncing
>  Sent: 18 Sep '06 08:00
>
>  Hi, this is the mlmmj program managing the mailinglist
>
>  topshelf-newsletter-media@lists.clixel.com
>
>  Some messages to you could not be delivered. If you're seeing this
>  message it means things are back to normal, and it's merely for your
>  information.
>
>  Here is the list of the bounced messages:
>
>          2

His email was still in bounce/

-rw------- 1 Debian-exim Debian-exim    40 2006-09-15 13:07  
editor=comicbookbin.com
-rw------- 1 Debian-exim Debian-exim 13640 2006-09-15 13:07  
editor=comicbookbin.com.lastmsg

 > /var/spool/mlmmj/topshelf-newsletter-media/bounce$ sudo more editor 
\=comicbookbin.com
2:1158350823 # Fri Sep 15 13:07:03 2006

I don't understand how it lists the 15th as the last message date,  
when clearly his message above says it was sent on the 18th.. ?

Any ideas?

Thanks,
Nate.

(Hoping I can figure out these few errors and let things be again!)

--
Clixel Design & Coding ~ http://clixel.com/

