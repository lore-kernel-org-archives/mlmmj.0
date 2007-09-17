From: Neale Pickett <neale@woozle.org>
Date: Mon, 17 Sep 2007 03:08:49 +0000
Subject: theoretical automated attack against mlmmj
Message-Id: <w537imqugxq.fsf@fozzie.woozle.org>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I just had to unsubscribe "service@paypal.com" from one of my mail
lists.  Here's what I think happened:

I have a web interface to subscribe/unsubscribe
(http://woozle.org/lists).  It's nothing fancy, just does a glob of
/var/spool/mlmmj/*/control/public and prints 'em out.  Well, and it
looks through the list-id header for the description.  Anyway, it seems
some joker (I have a lot of jokers on one list in particular) typed in
"service@paypal.com" and clicked "subscribe".

"service@paypal.com" is an auto-responder, so the subscribe confirmation
message got a response, and they got signed up.

Obviously a captcha wouldn't fix this, since it was a malevolent
attacker.  And they could just as easily have spoofed an email to
achieve the same results.  Given that, it should be trivial to script up
an automated attack against mlmmj, subscribing service@paypal.com every
day and causing a big headache for list admins.

Any ideas?

Neale
