From: jf-mlmmj@bookofsand.co.uk
Date: Tue, 03 Mar 2020 10:03:18 +0000
Subject: Re: [mlmmj] DMARC (corrected)
Message-Id: <4272.1583229798@calligramme.charmers>
List-Id: <mlmmj.mlmmj.org>
References: <20200303095859.Horde.WCHP_tNDxpm70b-4WXMAcYP@andreasschulze.de>
In-Reply-To: <20200303095859.Horde.WCHP_tNDxpm70b-4WXMAcYP@andreasschulze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

On 2020-03-03 at 10:37+0100 Christof Thalhofer wrote:
> > So, as MLM operator you /may/ make your lists "dkim save": strictly  
> > avoid any message modification.
> > Then any subscriber could use your MLM even if the subscriber announce  
> > dmarc p=reject
> 
> Mailman 2 offers these possibilities on "Action to take when anyone
> posts to the list from a domain with a DMARC Reject/Quarantine Policy":
> 
> "Munge From: This action replaces the poster's address in the From:
> header with the list's posting address and adds the poster's address to
> the addresses in the original Reply-To: header."

[…]

> Is there any similar functionality in mlmmj?

I have implemented munge from for mlmmj. Some people disapprove
of munge from, but it works for the couple of mailing lists I
run (and has been doing since May 2017, rather longer ago than I
realised).

I don’t know the correct procedure for submitting this patch, so
would be grateful if someone would enlighten me.

 — Jón

