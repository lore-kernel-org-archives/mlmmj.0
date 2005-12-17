From: Mojca Miklavec <mojca.miklavec.lists@gmail.com>
Date: Sat, 17 Dec 2005 14:36:42 +0000
Subject: just lots of bugs ...
Message-Id: <6faad9f00512170636h170fede7hcfcf6feb6a2b6996@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello,

I thought it was the best possible choice to find such a lightweight
and yet powerful mailing list software as mlmmj, but however great it
seemed to be on the first glance: it causes me only a headache today.

1. The first problem (not a bug, but very inconvenient) is that I have
just a normal account on a server with virtual hosting. (Mailman was
too complicated to install for each domain separately.) So the root
installed everything and gave me "a kind of rights":
    chown nobody:mojca [for all the files]
and
    chmod g+rw [for all the files]

After that I started subscribing people (with command line) and
realized that "nobody" (postfix or whoever does the job) wasn't able
to read and write to "subscribers.d/m" for example. It would be much
better if the files would have been created already at the
installation time. Now I can't do anything but chmod a+rw or ask the
adminstrator for help every time I discover that I need some other
file.

The program should complain that it doesn't have sufficient rights
when run interactively.

2. How can I "resubscribe"? For example if someone only want digests
from now on? Do I really have to unsubscribe and subscribe again or is
there any other option that an email gets unsubscribed automatically
from "regular" subscriber to "digests/no mail" subscriber? If I forget
to unsubscribe and wand digests, it complains about "already
subscribed". There are quite some other problem with those digests,
but I first have to figure out how to set the rights properly and then
I'll ask again.

3. There are serious, buggy problems with mail headers. It's difficult
to describe out-of-the-box what problems these are, because the
behaviour changes rapidly when I change (innocent) settings.

a) listname-owner@listdomain.si keeps getting the majority of mails
that should be sent to mailing list subscribers
b) There's sometimes an empty line before "Mime-type", so this line
the following four lines automatically go into the mail content when
viewed in a mail client
c) The "From" line is sometimes changed into something like
listname+bounces-13-myemail=mydomain@listdomain.si
d) ...

It's completely unpredictable behaviour. I love the program, but I'm
affraid I'll have to switch to some other solution (at least as long
as the problems don't go away).

I can send additional info off-list if someone is willing to
investigate, although I wouldn't like to lose days on it.

Mojca
