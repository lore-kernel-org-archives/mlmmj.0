From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Wed, 04 May 2016 23:30:22 +0000
Subject: Re: [mlmmj] Adding customheaders & footer to mlmmj list-control mails message
Message-Id: <e6f8166d-8001-e3b0-f568-b6bfe066a91a@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20160504T203222-118504689Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20160504T203222-118504689Z@orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi, Robin,

customheaders and footer are omitted from list control messages by
design. If you wish to include these, simply edit your listtexts,
putting the headers at the top and the footer at the bottom. :-)

You will find the texts in $listdir/text, and they may have been copied
from a systemwide location such as /usr/share/mlmmj/text.skel/en or the
directory symlinked. You may find the $text T$ and %text T% directives
useful for including common content (see README.listtexts).

Doing a better job of headers shared between posts and control messages
is the subject of bug 9:

http://mlmmj.org/bugs/bug.php?id=9

And having more sane defaults is the subject or bug 10:

http://mlmmj.org/bugs/bug.php?id

So the plan is to improve this, but for now, the mechanisms I mentioned
above are the way to go.

Ben



On 5/05/2016 6:59 am, Robin H. Johnson wrote:
> Hi,
>
> We recently ran into a not-nice RBL situation with SORBS, where a
> spamtrap address was forged as the source for an initial confirmation
> message, as well as several help requests.
>
> There was no way to know that the spamtrap address was forged, as it
> came from a domain without any SPF, DKIM or DMARC, and the source IP
> wasn't on any RBLs, nor was it a dialup/broadband system.
>
> None of the list-control messages include the customheaders, so the
> outgoing mail did not include the RFC2369 headers. The spamtrap was set
> up to ignore mails containing such headers, but since they were missing,
> our listserver got blacklisted :-(.
>
> The source of the problem seems to be the second call to
> do_all_the_voodoo_here in src/mlmmj-process.c, where both hdrfd and
> footfd are passed as -1.
>
> Attached is a quick patch that includes customheaders and footer in list
> control messages.
>
> The list control messages also don't respect the delheaders file, but
> that's not an issue for our list usage, so I'm leaving that for somebody
> else to fix.
>

