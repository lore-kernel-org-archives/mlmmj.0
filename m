From: Vegard Svanberg <vegard@svanberg.no>
Date: Sun, 21 Nov 2004 00:07:11 +0000
Subject: incoming emails ends up in queue/discarded
Message-Id: <20041121000711.GL9290@svanberg.no>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Running mlmmj 1.0.0-RELEASE-4 and postfix on debian.

Incoming emails are handed to mlmmj-recieve (I believe this is
misspelled and should be "receive", btw) using a transport in postfix.
This part of the setup is working as expected and postfix is correctly
delivering (piping) the message to mlmmj-recieve.

However the message ends up in queue/discarded and I have nothing to go
on.  Invoking (from postfix) mlmmj-recieve with the -F switch does no
good either -- no errors are showing up in logs the nor bounced back to
the sender.

Tried touching control/tocc, but it made no difference.  Also made sure
that the user mlmmj is running as has read/write permissions to
/var/spool/mlmmj/listname and read permission to the control directory.

Any help is appreciated!

-- 
Vegard Svanberg <vegard@svanberg.no> [*Takapa@IRC (EFnet)]

