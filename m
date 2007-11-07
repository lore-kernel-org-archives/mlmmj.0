From: "=?UTF-8?Q?Kov=C3=A1cs_Istv=C3=A1n?=" <kovacs.it@gmail.com>
Date: Wed, 07 Nov 2007 17:48:06 +0000
Subject: Autoresponders vs. reply-to list
Message-Id: <42c4a32b0711070948g1c748fd2u1d9b1bcad23f8f68@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi All,

I've just set up mlmmj on a Debian box running postfix. I'm new to
running my own mailing list using a proper mailing list manager as
well as running a Linux mail server in general. I'd like to make my
list's reply-to the mailing list address, not the sender address. I've
figured out how to do that.
In the past, I used a very intelligent user agent (PMMail from the old
OS/2 times), which had the ability to filter mail using a
pattern-based engine, and automatically distribute it to an address
book, so I was able to use it as a simple MLM software. It was in
those days that I learned (the hard way) that out-of-office
autoreplies (vacation responders) and setting the reply-to to the list
address mean bad luck, and I used PMMail's filters to get rid of such
mail. How do I do it with Linux, postfix and mlmmj? Do I need
procmail? If yes, how do I set it up to do this filtering?

TIA,
Kofa
