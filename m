From: "Christoph Wilke" <chris@filmkreis.tu-darmstadt.de>
Date: Fri, 16 Feb 2007 19:26:09 +0000
Subject: Re: mlmmj maxmailsize patch
Message-Id: <4649.130.83.185.211.1171653969.squirrel@130.83.185.211>
List-Id: <mlmmj.mlmmj.org>
References: <6171a10dca36fac0233ac365eec3e560@mail.n0rd.dk>
In-Reply-To: <6171a10dca36fac0233ac365eec3e560@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wed, February 14, 2007 23:23, Morten K. Poulsen wrote:
>
> Sven 'Darkman' Michels <sven@darkman.de> wrote:
>> I still get nothing in the logs, but that may some other problem...
> [snip]
>> Please, someone with more mlmmj knowhow or even more c code knowhow,
>> take a look if thats okay.
>
> +           if((st.st_size > maxmailsize)) {
> +#if 0
> +               log_error(LOG_ARGS, "%s is %d bytes too big.\n",
> +                       donemailname,
> +                       (st.st_size - maxmailsize));
> +#endif
>
> The missing log entry might be because of the "#if 0" ;-)
>
> Otherwise, it looks ok. I will review it in depth and commit it
> "soon."

Maybe it's better to change this log_error() to an log_oper()
as Henne suggested for the access rules?

>
> Morten

Ciao
Chris
