From: Sven 'Darkman' Michels <sven@darkman.de>
Date: Sun, 17 Sep 2006 16:49:52 +0000
Subject: Re: mlmmj-send processes eating cpu
Message-Id: <450D7CB0.5080708@darkman.de>
List-Id: <mlmmj.mlmmj.org>
References: <4BFA0DC3-3060-4B2B-8FBE-E5F8DD32E84E@gmail.com>
In-Reply-To: <4BFA0DC3-3060-4B2B-8FBE-E5F8DD32E84E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Nate Beaty wrote:
>> sudo strace -p 21593
> Process 21593 attached - interrupt to quit
> read(7, "", 512)                        = 0
> read(7, "", 512)                        = 0
> read(7, "", 512)                        = 0
> read(7, "", 512)                        = 0
> read(7, "", 512)                        = 0
> read(7, "", 512)                        = 0
> read(7, "", 512)                        = 0
> ...
> 
>> sudo strace -v -T -p 21636
> Process 21636 attached - interrupt to quit
> read(7, "", 512)                        = 0 <0.000322>
> read(7, "", 512)                        = 0 <0.000182>
> read(7, "", 512)                        = 0 <0.000134>
> read(7, "", 512)                        = 0 <0.000145>
> read(7, "", 512)                        = 0 <0.000197>
> read(7, "", 512)                        = 0 <0.000146>
> read(7, "", 512)                        = 0 <0.000164>
> read(7, "", 512)                        = 0 <0.000215>
> read(7, "", 512)                        = 0 <0.000146>
> 
> Does that help? I'm new to strace and reading through man strace I
> couldn't find anything to make more sense of the above output.

Can you please check which fd 7 is? (/proc/$PID/fd)

Regards,
Sven
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFDXyvQoCguWUBzBwRAvBpAKCaGgueJbGAHBR6JqFnPGZ8jHaa+ACdGNkJ
BjMabJxEiMMwBbCtkzej+3M=JedV
-----END PGP SIGNATURE-----
