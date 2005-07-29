From: Michael Erdely <merdely@gmail.com>
Date: Fri, 29 Jul 2005 19:39:29 +0000
Subject: Re: mlmmj with OpenBSD's sendmail
Message-Id: <72aa29905072912394c8d9d4d@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <72aa2990507291046a93884d@mail.gmail.com>
In-Reply-To: <72aa2990507291046a93884d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

That worked perfectly.  Thanks.

On 7/29/05, Matthias Kilian <kili@outback.escape.de> wrote:
> On Fri, Jul 29, 2005 at 01:46:46PM -0400, Michael Erdely wrote:
> > I've successfully subscribed to my test list.  When I try to send
> > email to it, it ends up in queue/discarded.
> 
> Did you add
> 
> define(`LOCAL_SHELL_FLAGS', `eu9P')dnl
> 
> to your sendmail.mc and regenerate sendmail.cf? It seems that you
> need this regardless of VERP or not.
> 
> Ciao,
>         Kili
> 
> 


-- 
http://erdelynet.com/

Support OpenBSD! http://www.openbsd.org/orders.html
