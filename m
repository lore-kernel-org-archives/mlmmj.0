From: Jakob Hirsch <jh@plonk.de>
Date: Sat, 10 Dec 2005 04:05:57 +0000
Subject: Re: mlmmj-1.2.9-RC2 and scooping up patches
Message-Id: <439A5425.1060704@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <20051206135000.GA92814@mmj.dk>
In-Reply-To: <20051206135000.GA92814@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Mads Martin Joergensen wrote:

> I've just created 1.2.9-RC2, with the new find_email_adr() from Neale

Ah, and something else: If VERP is active and a rcpt is rejected by the
smtp server (nonexisting user), no further rcpts are tried.


And a question about maintd: Exactly when is a list member automatically
unsubscribed?
I thought 'bouncelife' seconds after the first bounce, the next time
maintd is run, but that seems not to be correct. If I set it to some low
value (like 5s) and run maintd a while after a message bounced, the
address is retried again and again.
