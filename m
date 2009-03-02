From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 02 Mar 2009 20:00:23 +0000
Subject: Re: variables & .forward support
Message-Id: <20090302200023.GD34284@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Dave Taylor <ddt@davetaylor.name> [Feb 20. 2009 01:05]:
> Where can I find a list of legal $variables$ that I can use inside of
> the files listed in the "text" subdirectory?

You can grep in texts. They're all used.

> In particular, I would like to be able to add a "Reply-To: $poster$"
> field at the top of the "moderation" file.

That shouldn't be too hard. You have the from address in a C string, and
prepstdreply.c to look at. There exists no support for this as of yet,
so you'll have to write a patch.

> I've learned the hard way that the black-and-white moderation approach
> of either approving a post or ignoring it pisses people off.  A
> handful a groaners will start whining and create a lot of grief.
> 
> Instead, I've started replying to people to ask them to modify their
> post to remove/alter the offending bits.  However, this is a giant
> pain in the butt with the current system, because I have to scroll
> down to the user's email addr, click it, and then cut-and-paste the
> content of the message that I'm commenting on.
> 
> This is already an immense amount of work on a list of 500.  It would
> be a lot easier on me if I could simply reply to the message and
> delete the top w/ the moderation link.

Yes, I see the point. And it's a good one.

> Also, can mlmmj be run as a user program using the .forward file?
> Because it seems to need installing, this rules out its use on any
> hosting service that doesn't allow root access, which has the effect
> of increasing the hosting rates from $7/mo for an account to $50/mo or
> more for a virtual system.

As long as the user running the mailserver can write in the LISTDIR. It
only needs the listdir ever.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
