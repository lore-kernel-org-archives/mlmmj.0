From: Fabio Busatto <fabio.busatto@programmazione.it>
Date: Sun, 24 Sep 2006 08:38:38 +0000
Subject: Re: qmail+vpopmail support
Message-Id: <20060924083838.GA1435@nachos.phaseit.com>
List-Id: <mlmmj.mlmmj.org>
References: <20060503134628.GG5327@nachos.phaseit.com>
In-Reply-To: <20060503134628.GG5327@nachos.phaseit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tue, Jun 13, 2006 at 05:45:09PM +0200, Morten K. Poulsen wrote:
> The idea of adding qmail support was to get it working out of the box. I think it is safe,
> if we check for DEFAULT as the last thing before falling back to reading headers.

I just downloaded the last mlmmj release, and I noticed that it still checks for EXT environment
variable instead of DEFAULT (needed to support virtual domains in qmail).

Patch missed?

Bye
-fabio
