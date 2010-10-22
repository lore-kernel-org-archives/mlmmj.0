From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Fri, 22 Oct 2010 13:23:39 +0000
Subject: Re: [mlmmj] reply-to and reply-to-sender
Message-Id: <4CC1905B.5040109@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <1287748105.2377.24.camel@mbs-laptop>
In-Reply-To: <1287748105.2377.24.camel@mbs-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

IIRC, the Reply-To header is meant to mean what to reply to when
replying to the sender. It is designed to be set by the sender, not by
the list, to indicate they want replies to them sent elsewhere.

(Many lists set a Reply-To header though. This can make sense if there's
never really any reason to reply to the sender, but it's still not
technically correct, and many people recommend against it.)

To get a reply-to-list behaviour, you should include a List-Post header
(and other List-* headers are also recommended).

RFC2369, RFC2919.

Ben.



On 22/10/10 10:48 PM, Morten Bressendorff Schmidt wrote:
> Hi
>
> It's probably me... but...
>
> mlmmj ubuntu-package 1.2.17-1.1
>
> If I set "Reply-To" to be the mailinglist created, then replies go to
> the list.... fine!
>
> But when I use "Reply to sender" in my mailprograms, the reply still
> goes to the mailinglist, not to the person who actually wrote the
> mail...
>
> Is what I wan't possible?
>
> ./morten
>
>
>
>


