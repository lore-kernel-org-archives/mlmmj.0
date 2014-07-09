From: Thomas Jarosch <thomas.jarosch@intra2net.com>
Date: Wed, 09 Jul 2014 09:41:50 +0000
Subject: Re: Re: [mlmmj] Allowing empty envelope senders
Message-Id: <3302272.SPjlxVGhec@storm>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tuesday, 8. July 2014 21:04:28 A. Schulze wrote:
> > Currently mlmmj discards all emails with an empty envelope sender
> > address and this is not configurable (see mlmmj-process.c, line ~704)
> 
> show logs of your evidence please

Jul 4 14:02:04 mailserver /usr/bin/mlmmj-process[11069]: mlmmj-process.c:710: Discarding /var/spool/mlmmj/listname/incoming/758c955322d1654d due to missing envelope from address: Success

this is logged by mlmmj-1.2.15 and still valid for the latest version.

Thomas


