From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 18 Feb 2010 22:24:44 +0000
Subject: Re: Implementing real names
Message-Id: <4B7DBE2C.1010807@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4B5EE46E.3080504@yahoo.com.au>
In-Reply-To: <4B5EE46E.3080504@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi, Morten,

Thanks a lot for working your way through all the January mail. I really
appreciate the comments and discussion and your openness to changes.

>> A feature that I would find useful is having a membership list that
>> includes real names.
>
> Is that meant as a convenience for the list administrator (when finding
> and unsubscribing clueless users), or would it be useful in other
> situations?

Yes, it's just an administration convenience to find emails, whether to
unsubscribe users, send them a personal message, find out which real
person is bouncing to nag them face-to-face about their incorrect
address, etc..

>> Another possibility would be to keep the data in some kind of simple
>> database file that facilitated quick lookup and update. This seems a
>> bit out-of-style with how mlmmj works, though.
>
> I have a long term vision...
>
> Some users of mlmmj keep subscribers in a database. When sending mails
> to mlmmj, the mail is not piped to mlmmj-recieve [sic]

LOL. Yes. That really should be a candidate, perhaps with changing the
access keyword from 'moderate' to 'hold', for fixing in the next major
release. Though it doesn't really matter, it projects an image of the
project that I don't think reflects the quality of the product. It may
even increase adoption, having it right.

Some tunable names could be adjusted to be more sensible and consistent,
too. And all this supplied with a nice 'upgrade' script for admins. :-)

> at first, but into a
> fetch-the-subscriber-list-and-execute-mlmmj-recieve-script. This works
> okay for newsletter lists, with web-based subscription, if you ignore
> bounces. It is not good for discussion lists.

I don't think I understand how this works at present. Does mlmmj-recieve
have an option to support this? I don't see anything.

> My idea is to restructure mlmmj with a set of hooks. The hooks could
> just be executable files in a directory. There could be a hook for
> subscribing, one for unsubscribing, one for getting the subscriber list,
> one for adding the footer, and so on. The default hooks would do a large
> part of what mlmmj does today.

I think having a bunch of hooks is a good idea. The content filtering
stuff would definitely be better as a hook, and probably should happen
at a different point in the processing chain, too.

> This would allow mlmmj to be used with any storage backend.
>
> If a database based backend was written, per-subscriber settings could
> easily be saved. The real name of a subscriber would just be a setting,
> much like I imagine "notmetoo" being.
>
> What's your thoughts on this?

There is definitely a lot of potential in something more flexible like
this. It raises a lot of issues, though:

- With per-user settings, and with an increasing number of these (and I
   do think that long term, they are a plus), having some kind of web
   interface becomes more of a necessity than an optional extra. Managing
   your settings via an email interface quickly becomes tedious, even for
   cluey users. Users who are less savvy haven't got a hope. Likewise for
   administrators, commandline tools quickly become difficult to use as
   they require more and more options. So admins can lessen their own
   burdens by shifting work to users, the interface could have a nice
   button (and possibly mail interface) to email specific users a HOWTO!

- Nomail and digest would probably also become per-subscriber options in
   this model, rather than discrete lists.

- Bounce handling would probably also need to be integrated with it,
   probably as further per-subscriber metadata.

- Also, subscribers who are moderated (or not) could be a very useful
   option to include. It would simplify greatly the implementation of
   moderating new members that I wrote about earlier, too.

- Who the admins and moderators are could also be made per-subscriber
   metadata. This would be more consistent than having some info in
   tunables, and some in the database. With a web interface, this would
   easily allow logging in to administer the list, too. Basically
   anything email-address related (except probably the list address)
   could move to the database.

- There are some other really nice things you could do with this, too,
   such as making archives available online to list members.

- How would efficiency suffer with needing to fork and execute more
   processes? How platform-specific would efficiency problems be? Maybe a
   C interface is smarter, so backends are modules. One such module could
   be the current mlmmj code (which may well be quite easy to move into a
   module with very little reworking--and could provide for a smooth
   transition to something new). Another could work by executing external
   programs. Others could be speedy interfaces to various databases. A
   CGI script could provide an mlmmj web interface that interfaces with
   the modules, too, enabling whatever functionality the backend in use
   provides.

- Long term, what should the default module/backend be? One of the
   beauties of mlmmj is its utter transparency. Files are all very
   readable at the commandline. It would be a shame to lose this.
   Much like Thunderbird does, perhaps the default module long-term could
   provide an index into flat files, rather than use an opaque database
   format. (Thunderbird stores mail in mbox files but creates indexes
   into those files for efficiency.)

- Likewise, one reason I favour mlmmj is its low memory use, and the way
   it doesn't need a daemon (or 5) running. I'd be keen for a default
   backend that is more featureful, but still has these niceties.

- We'd want to get CVS (or preferably something better--I favour
   Mercurial these days) publicly available, particularly so we could
   have a broader testing community if implementing something more
   ambitious like this.

That's enough thoughts from me for now. Your turn!

I'd definitely be willing to help with something like this, too. I was
pretty close to biting the bullet and writing my own MLM after
investigating a bunch of others with just weren't really suitable, and
mlmmj stepped in as pretty close to a decent solution. The code was nice
enough that I could easily implement the missing features I needed, at
least the high priority ones. That's plenty less work than writing an
entire MLM on my own, so I'm definitely willing to put in some time to
implementing some of these lower priority but useful features, too.

Ben.





