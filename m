From: Morten Shearman Kirkegaard <moki@fabletech.com>
Date: Thu, 18 Feb 2010 17:03:30 +0000
Subject: Re: Implementing real names
Message-Id: <1266512610.22451.79.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <4B5EE46E.3080504@yahoo.com.au>
In-Reply-To: <4B5EE46E.3080504@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Ben,

On Tue, 2010-01-26 at 23:47 +1100, Ben Schmidt wrote:
> A feature that I would find useful is having a membership list that
> includes real names.

Is that ment as a convenience for the list administrator (when finding
and unsubscribing clueless users), or would it be useful in other
situations?

> Particularly given our conservative maintainer :-) and that this could
> be a fair amount of work, and have some implementation subtleties, I
> think this is worth a bit of discussion before I dive in and try
> anything.

:-)

> So, I'm wondering what people think of this, and how it might be
> implemented.
...
> Another possibility would be to keep the data in some kind of simple
> database file that facilitated quick lookup and update. This seems a
> bit out-of-style with how mlmmj works, though.

I have a long term vision...

Some users of mlmmj keep subscribers in a database. When sending mails
to mlmmj, the mail is not piped to mlmmj-recieve [sic] at first, but
into a fetch-the-subscriber-list-and-execute-mlmmj-recieve-script. This
works okay for newsletter lists, with web-based subscription, if you
ignore bounces. It is not good for discussion lists.

My idea is to restructure mlmmj with a set of hooks. The hooks could
just be executable files in a directory. There could be a hook for
subscribing, one for unsubscribing, one for getting the subscriber list,
one for adding the footer, and so on. The default hooks would do a large
part of what mlmmj does today.

This would allow mlmmj to be used with any storage backend.

If a database based backend was written, per-subscriber settings could
easily be saved. The real name of a subscriber would just be a setting,
much like I imagine "notmetoo" being.

What's your thoughts on this?


Morten

-- 
Morten Shearman Kirkegaard <moki@fabletech.com>
CTO, FableTech
http://fabletech.com/


