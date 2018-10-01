From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Mon, 01 Oct 2018 02:45:00 +0000
Subject: Re: [mlmmj] Patches wanted for hashing/nesting archive directory (1M+ mails in list)
Message-Id: <89541aa0-f04e-af7d-77e3-2176d714a43e@coredump.us>
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20180807T030939-826380737Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20180807T030939-826380737Z@orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Robin H. Johnson:
> One of the larger gentoo.org lists recently passed 1M mails, and while
> performance hasn't taken a noticeable hit, doing admin ops in such large
> directories is painful.

Mmm. Yeah that's a lot for one directory.

> Has anybody started on patches to use a nested directory structure for
> archive? Ideally something that supports cleanly migrating from the old
> flat layout.

Not that I know of, but I think there's a reason.

Mlmmj doesn't include a "web archiver", so I think the only reason to keep old
archives in the same directory is for getting previous messages from the list
via email by sending mail to <listname>-get-N@<list-domain-name> where N is the
number of the desired message.  It's very unlikely that a user would want to use
this to retrieve very many messages.

Thus realistically older mail archives can be moved into directories by month or
year, and configuring the web archiver to look for those archives there.

I hope that helps.
   -- Chris

-- 
Chris Knadle
Chris.Knadle@coredump.us

