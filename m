From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 28 Oct 2010 23:19:47 +0000
Subject: Re: [mlmmj] Permission trouble
Message-Id: <4CCA0513.1040109@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <A6F4BBD6-0B74-48A4-B0D5-4400CF089CF0@925.dk>
In-Reply-To: <A6F4BBD6-0B74-48A4-B0D5-4400CF089CF0@925.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> I have a little permission trouble setting up mlmmj alongside perl-admin.

Mmm. Yeah. This stuff is a little challenging. It looks like you're
doing well, though. Permissions may be a red herring....

> I use postfix, which puts files as nobody. I have apache which runs as www.
> I followed the instructions of the README file of both mlmmj and perl-admin.
> www and nobody users have been added to group mlmmj.
>
> I did:
>
> chown -R nobody:mlmmj listdir/
> chmod -R g+rw listdir/

Yeah, good. Seems right.

> I do _not_ use postfix transports. But instead regular virtual maps
> and aliases.

Should be fine. That's how I run mine so far. I haven't tried
subscriptions using the web interfaces, though.

> Problem is:
> If I add a user using perl-admin I can not un-subscribe using mlmmj
> (sending list+unsubscribe@ mail).
>
> I get the standard "you're not subscribed" mail in return. There are
> no permission errors in any logs.

OK. This is strange. It suggests Mlmmj can't read the subscription file.
After you have subscribed using perl-admin, if you post to the list,
does the message get delivered?

What if you subscribe using perl-admin, and then also subscribe the same
address using list+subscribe@ mail? Do you see two, perhaps slightly
different, entries in the subscribers.d/m file?

> If I add a user using list+subscribe@ mail, unsubscribe works just
> fine using list+unsubscribe@ mail or perl-admin.

Good.

> subscribers.d>
> total 6
> drwxrwxr-x  15 nobody  mlmmj  512 Oct 28 22:32 ..
> -rw-rw----   1 www     mlmmj   14 Oct 28 22:47 m
> drwxrwxr-x   2 nobody  mlmmj  512 Oct 28 22:47 .

This looks fine.

> So if group of a file in subscribers.d/ is www unsubscribe by sending
> a mail to list+unsubscribe@ does not work.

Well, the group is right. It's only the owner that is www, and the group
permissions are fine.

> list directory is owned by nobody:mlmmj. And as I read man
> "mlmmj-unsub", mlmmj-unsub should use that user, and hence unsubscribe
> should work.

Well, mlmmj-[un]sub will only be able to use the user of the listdir if
it is run as root, which isn't the case here. Nevertheless, yes, things
should be working.

One final thought... Some OSes don't notice changes to group membership
until after a login. Maybe postfix needs to be stopped and started (and
perhaps just a reload won't work), or even the whole machine rebooted,
to get the OS to notice the change.

> PS: Typo (I think) in "man mlmmj-unsub": mlmmj-sub (instead of
> mlmmj-unsub) in SYNOPSIS.

Yep. This has already been fixed in version control. Thanks for
mentioning.

Ben.





