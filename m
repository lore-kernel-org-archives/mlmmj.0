From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Mon, 25 Sep 2006 20:32:27 +0000
Subject: Re: qmail+vpopmail support
Message-Id: <883e0e18078a43fb2bbca83d9acfe57a@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20060503134628.GG5327@nachos.phaseit.com>
In-Reply-To: <20060503134628.GG5327@nachos.phaseit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Fabio,

Fabio Busatto <fabio.busatto@programmazione.it> wrote:
> I just downloaded the last mlmmj release, and I noticed that it still
> checks for EXT environment variable instead of DEFAULT (needed to 
> support virtual domains in qmail).
> 
> Patch missed?

Yes, I forgot all about that. I have just committed the following to CVS. That should fix the issue, right?

-       if((envstr = getenv("EXT")) != NULL) {
+       if((envstr = getenv("DEFAULT")) != NULL) {

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

