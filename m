From: Fabio Busatto <fabio.busatto@programmazione.it>
Date: Tue, 26 Sep 2006 13:25:37 +0000
Subject: Re: qmail+vpopmail support
Message-Id: <20060926132537.GA1939@nachos.phaseit.com>
List-Id: <mlmmj.mlmmj.org>
References: <20060503134628.GG5327@nachos.phaseit.com>
In-Reply-To: <20060503134628.GG5327@nachos.phaseit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, Sep 25, 2006 at 10:32:27PM +0200, Morten K. Poulsen wrote:
> Yes, I forgot all about that. I have just committed the following to CVS. That should fix the issue, right?
> 
> -       if((envstr = getenv("EXT")) != NULL) {
> +       if((envstr = getenv("DEFAULT")) != NULL) {
> 

Right :)

-fabio
