From: Neale Pickett <neale@woozle.org>
Date: Mon, 17 Sep 2007 04:08:39 +0000
Subject: Re: theoretical automated attack against mlmmj
Message-Id: <w53r6kyszlk.fsf@fozzie.woozle.org>
List-Id: <mlmmj.mlmmj.org>
References: <w537imqugxq.fsf@fozzie.woozle.org>
In-Reply-To: <w537imqugxq.fsf@fozzie.woozle.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Neale Pickett <neale@woozle.org> writes:

> Given that, it should be trivial to script up an automated attack
> against mlmmj, subscribing service@paypal.com every day and causing a
> big headache for list admins.

It might even be worse, what would happen if I spoofed mail from one
list's "+subscribe" to another list's "+subscribe"?  It's too late in
the day for me to work that out in my head.

> Any ideas?

I just had one :) The "welcome to the list" message could have a From
address that is the "unsubscribe confirmation" address.  So if an
auto-responder were subscribed, it would immediately unsubscribe itself
by responding to the welcome message.  It's not pretty but it would
work, and if it worked there'd be no reason to script an attack.  Of
course, the automated responder loses three times.

Maybe I'll have a better idea tomorrow.

Neale

