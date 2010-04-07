From: Sabahattin Gucukoglu <mail@sabahattin-gucukoglu.com>
Date: Wed, 07 Apr 2010 02:36:45 +0000
Subject: [mlmmj] More Nits
Message-Id: <4917C91D-7A19-4BF2-A179-E3061BC3524E@sabahattin-gucukoglu.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I just noticed that mails with null envelopes were being rejected.  Why's that?  No prob if it's legitimate, it just happened that my script was using it (as opposed to any other arbitrary address).

And, the best one: I was about to implement VERP in XMail (the mailer I'm using) before I noticed that mlmmj is doing it itself!  Well, if I'd known that, I wouldn't have worked up to doing it myself, since XMail already explodes jobs anyway into one-recipient-per-queue-item.  So, a note please in the README explaining how unless the verp file is present, mlmmj is doing it itself.

Cheers,
Sabahattin


