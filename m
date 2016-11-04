From: Piotr Auksztulewicz <mlmmj-listrcpt@hasiok.net>
Date: Fri, 04 Nov 2016 17:07:50 +0000
Subject: [mlmmj] Why different logging destinations
Message-Id: <20161104170750.GN15104@kibel.hasiok.net>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hello all!

Just a thought: what's the reason for mlmmj executables using both
syslog (via the log_error() function) and a file in the list's spool
directory (mlmmj.operation.log, via the log_oper() function)? The latter
method also uses hardcoded log rotation logic. Also mlmmj-maintd logs
to a still different file, with its own rotation logic.

On top of that, some log_error()s look like debugs. I "love" this one
particularly:

Nov  2 18:15:02 hostname /usr/bin/mlmmj-process[16632]: mlmmj-process.c:839: Found Cc: user@example.com: Success

IMHO it would make more sense to log everything to syslog (falling back
to a file if syslog is not available) with different priorities, so
admins could apply filtering, routing and rotation to their tastes.

Currently I have to play tricks with syslog-ng to get all info into one
place, and it fails sometimes.


Greetings,

P.

-- 
Piotr "Malgond" Auksztulewicz                     firstname@lastname.net

