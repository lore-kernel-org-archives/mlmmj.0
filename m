From: Neale Pickett <neale@woozle.org>
Date: Tue, 01 Nov 2005 14:40:51 +0000
Subject: Re: new find_email_adr.c
Message-Id: <200511010740.52424.neale@woozle.org>
List-Id: <mlmmj.mlmmj.org>
References: <200510302019.51940.neale@woozle.org>
In-Reply-To: <200510302019.51940.neale@woozle.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tuesday 01 November 2005 06:24 am, Mads Martin Joergensen wrote:
> * Neale Pickett <neale@woozle.org> [Oct 31. 2005 04:21]:
> > This patch to my previous post removes two debugging statements, and
> > fixes a bug that showed up when people used bare email addresses in the
> > headers.  For instance:
>
> Great! Can you make it against 1.2.9-RC1 and resend it? It fails to
> apply here.

It's against the whole file I sent a while ago.  If you don't have that file 
around, you can download it (with my patch applied): 
http://woozle.org/~neale/repos/mlmmj/src/find_email_adr.c

No sense sending a patch against RC1, since the entire file's been 
rewritten.  :)

Neale
