From: Csillag =?iso-8859-2?Q?Tam=E1s?= <cstamas@digitus.itk.ppke.hu>
Date: Sun, 22 May 2005 19:32:36 +0000
Subject: Re: Silent subscriptions
Message-Id: <20050522193236.GS29457@digitus>
List-Id: <mlmmj.mlmmj.org>
References: <6.2.1.2.2.20050521153538.02b3fbe8@postino.programmazione.it>
In-Reply-To: <6.2.1.2.2.20050521153538.02b3fbe8@postino.programmazione.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 05/22, Mads Martin Joergensen wrote:
> * Filippo Fadda <fifadd@tin.it> [May 21. 2005 15:40]:
> > Is there some way to subscribe a member via email without the member
> > itself confirms the subscription?
> 
>  $ /usr/local/bin/mlmmj-sub -h
>  Usage: /usr/local/bin/mlmmj-sub -L /path/to/list -a john@doe.org [-c]
>         [-C] [-h] [-L] [-d | -n] [-U] [-V]
>   -a: Email address to subscribe
>   -c: Send welcome mail
>   -C: Request mail confirmation
>   -d: Subscribe to digest of list
>   -h: This help
>   -L: Full path to list directory
>   -n: Subscribe to no mail version of list
>   -U: Don't switch to the user id of the listdir owner
>   -V: Print version
>  When no options are specified, subscription silently happens
> 
> So if you just invoke mlmmj-sub that should be it. You can also use -C
> to send them a welcome mail.
> 
You mean the small one '-c', is not you?

-- 
Unix is very simple, but it takes a genius to understand the simplicity.
(Dennis Ritchie)

cstamas
