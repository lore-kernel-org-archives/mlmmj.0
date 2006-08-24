From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 24 Aug 2006 11:48:10 +0000
Subject: Re: mailinglist owner subscribe?
Message-Id: <20060824114809.GC38148@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4d4321660608240434i5444467g171a8b77f83c1742@mail.gmail.com>
In-Reply-To: <4d4321660608240434i5444467g171a8b77f83c1742@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Christian Nygaard <christiannygaard@gmail.com> [Aug 24. 2006 13:34]:
> How can the mailinglist owner subscribe new members to a mlmmj list?

Use the mlmmj-sub command directly:

$ mlmmj-sub -L /path/to/list -a some@address.org

Look at mlmmj-sub -h for options.

> I've tried chgrp subscribers.d folder and the files in it to list owners
> group + emacs to edit them but as soon as someone unsubscribes from the list
> the permissions are
> changed back to nobody.nobody ownership.

It has to be the ownership of the process running mlmmj.

> Is there some mailinglist owner command that I missed that can be used?
> 
> ezmlm does this by:
> mailinglist-subscribe-john=example.net@example.org

This is not implemented in mlmmj. But since mlmmj uses From: and not
envelope from, you can send a mail to the subscribe address, with the
From: changed.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
