From: Piotr Auksztulewicz <mlmmj-listrcpt@hasiok.net>
Date: Wed, 18 Dec 2019 20:18:43 +0000
Subject: [mlmmj] How long are bounce probes sent?
Message-Id: <20191218201843.GE19470@kibel.hasiok.net>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hello all!

A quick question.

Some subscribed address was undeliverable, but I got a new one from the
person and manually unsubscribed the old address and subscribed the new
one. The bounce probes are still sent for the old one every time cron
starts mlmmj-maintd.

Should I remove some files from <list>/bounce directory or will they
be removed automatically? For how long are bounce probes sent?

Maybe maintd should check if the bouncing address is still subscribed?

Thanks.

-- 
Piotr "Malgond" Auksztulewicz                     firstname@lastname.net

