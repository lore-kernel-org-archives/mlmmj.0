From: "A. Schulze" <sca@andreasschulze.de>
Date: Thu, 03 Oct 2019 21:32:30 +0000
Subject: Re: [mlmmj] List server DKIM
Message-Id: <1b844002-d290-90da-19d8-a09d11f3c319@andreasschulze.de>
List-Id: <mlmmj.mlmmj.org>
References: <ab83734c-5acc-529a-2234-a36e4599c0bc@black-sheep-research.com>
In-Reply-To: <ab83734c-5acc-529a-2234-a36e4599c0bc@black-sheep-research.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org



Am 03.10.19 um 21:57 schrieb Geert Stappers:
> MTA MLMMJ (or MLMMJ itself) should remove incoming DKIM headers,
> and add outgoing DKIM headers  to make MTA Bob happy.

Sorry, but this seem not be the correct solution.

The simple solution to "make Bob happy" is to configure MLMML to not modify message content.

-> no ~list/control/prefix
-> no ~list/control/footer

The complex solution is ARC
- do DKIM validation
- modify a message
- DKIM sign the message as MLMMJ entity
- ARC seal these data
- hope, Bob trust your ARC seal

Andreas

