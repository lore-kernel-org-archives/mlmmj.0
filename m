From: Charlie Brady <charlieb@budge.apana.org.au>
Date: Sat, 21 Jan 2006 19:20:36 +0000
Subject: Re: Treatment of Delivered-To headers (Re: mlmmj-recieve silently
Message-Id: <Pine.LNX.4.61.0601211419430.26660@e-smith.charlieb.ott.istop.com>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601202202460.6540@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601202202460.6540@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Sat, 21 Jan 2006, Morten K. Poulsen wrote:

> Do we need a commandline switch? If qmail puts the values (which other MTAs 
> put in headers) in environment variables, the code could be changed to 
> something like the following pseudo code:
>
> envelope_to = getenv("RECIPIENT");
>
> if (!envelope_to)
> envelope_to = getheader("Delivered-To");
>
> if (!envelope_to)
> envelope_to = getheader("To");
>
> if (!envelope_to)
> abort();
>
> ... and likewise for sender.

That looks a fine suggestion to me. Clean and simple.
