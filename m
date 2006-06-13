From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Tue, 13 Jun 2006 15:45:09 +0000
Subject: Re: qmail+vpopmail support
Message-Id: <3b8eec78e131e48011cdda7a6aea2ddd@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20060503134628.GG5327@nachos.phaseit.com>
In-Reply-To: <20060503134628.GG5327@nachos.phaseit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi,

On Thu, 1 Jun 2006 01:23:12 +0200, Fabio Busatto <fabio.busatto@programmazione.it> wrote:
> So, two ways:
> - use DEFAULT instead of EXT when looking for extension
> - set another environment variabile using .qmail file,
>   and then check it

The idea of adding qmail support was to get it working out of the box. I think it is safe, if we check for DEFAULT as the last thing before falling back to reading headers.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

