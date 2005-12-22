From: "Jakob Hirsch" <jh@plonk.de>
Date: Thu, 22 Dec 2005 08:57:31 +0000
Subject: Re: more footer problems
Message-Id: <42529.127.0.0.1.1135241851.squirrel@ymmv.de>
List-Id: <mlmmj.mlmmj.org>
References: <43AA394B.9030003@pebcomputing.com>
In-Reply-To: <43AA394B.9030003@pebcomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Patrick Bennett wrote:

> the control/footer seems to be appended to messages, however on plain
> text messages they still do not appear in the client window, but are
> only readable in the message source, while in html messages they are
> treated like (tagless) html, so no line breaks are inserted.  there was

This is a known and common problem with mime messages (and one of the
reasons many people don't like html mail, especially on lists).
However, a few days ago, I posted a patch to add the footer in a MIME
compliant way. It is not in 1.2.9, but according to Mads it will be in
1.2.10-RC1.

> a problem in 1.2.8, iirc, that was attempted to have been fixed in 1.2.9.

AFAIK, there was no change regarding this in 1.2.9.
