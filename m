From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Wed, 22 Jul 2015 23:04:43 +0000
Subject: Re: [mlmmj] archive options
Message-Id: <55B0218B.3070205@coredump.us>
List-Id: <mlmmj.mlmmj.org>
References: <20150722201312.Horde.-2qEu7m07EG88JaIYKfPDiy@andreasschulze.de>
In-Reply-To: <20150722201312.Horde.-2qEu7m07EG88JaIYKfPDiy@andreasschulze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 07/22/2015 02:13 PM, A. Schulze wrote:
> 
> Hello,
> 
> just noticed mlmmj archive a list as one message per file in ~list/archive/
> Today I have a list with 300 messages. And I have a directory with 300
> files.
> I assume I'll get problems on 10k messages...

Not really.  I ran a mail server that had a problem back in 2003 where
the ext3 filesystem was filled with message bounces and rebounces.
Because there were > 64k files the wildcards (?, *, etc) couldn't be
parsed by the system anymore, but the filesystem other than that didn't
have an issue with the number of files that were in a single directory.
 And the issue I had at the time was that I was trying to parse which
files were the bounced messages vs "real" ones that hadn't been
sent/received yet.

In the case of MLMMJ the filenames would be in order, so it would be
clear which files were "old" and could be moved to another directory, if
needed.  And I'm not sure what the limit on the number of files in a
directory is anymore -- it's probably filesystem dependent, and I think
the wildcards work past 64k files now too, IIRC.

> Are there options to distribute the archived content over multiple
> sub-directories?

I was thinking of running a monthly cronjob to move archived mailing
list mails into a directory with the YYYY-MM format, but haven't done
this because I believe it would remove the ability of mailing list users
to retrieve old messages via email commands to MLMMJ.

So instead what I'd suggest would be to create a web archive of mailing
list mail, using something like MHonArc or Lurker.  That way users can
still get to archived mailing list mail, and you can move the archive
files as you see fit.

At least that's what I've been thinking about, as a user of MLMMJ.

   -- Chris

-- 
Chris Knadle
Chris.Knadle@coredump.us

