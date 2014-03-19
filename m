From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Wed, 19 Mar 2014 20:29:23 +0000
Subject: Re: [mlmmj] Getting resent mail when subscribing to list
Message-Id: <2862965.4czEmuXF9W@trelane>
List-Id: <mlmmj.mlmmj.org>
References: <B1DF0070-DAA5-4C05-9400-D32EDBBD9115@iki.fi>
In-Reply-To: <B1DF0070-DAA5-4C05-9400-D32EDBBD9115@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wednesday, March 19, 2014 13:02:15 Matti Nykyri wrote:
> Hello
> 
> I recently installed mlmmj on my server. I would like to add an option to
> tunables so that list could be configured to send old posts when people
> subscribe to the list
> 
> I'm thinking of adding a tunable subget (normal) that will as many old posts
> as defined in the tunable. I'll download source from git and supply a patch
> if you are interested.

I'm not a developer of mlmmj (yet) but sending someone /all/ of the old posts 
automatically upon signup doesn't sound like a good idea, because that could 
have all kinds of unintended consequences.

Say, for instance, that the list has 10,000 messages in it, and 4 people sign 
up for the list today.  Yikes.  Or, a user of such a list removes one's self 
from the list, then later the same day signs back up for it thus triggering 
getting the entire list history again for no good reason.

A more interesting option which could do the same thing would be to allow a 
subscriber of the list to be sent a particular /range/ of list emails.  Mlmmj 
comes with the facility for a subscriber to retrieve a /particular/ list email 
via sending a message to <listname>+get-N@<list-email-addr> where "N" is the 
message #; if this could be expanded to <listname>+get-{N-M}@<list-email-addr> 
such that the "{N-M}" could be parsed as a range and mlmmj modified to send 
that range of emails back to the user, then the user could have the /option/ 
of retrieving the portion of the mailing list that they're interested in.

Let me know what you think of this tweak to the idea.

  -- Chris

--
Chris Knadle
Chris.Knadle@coredump.us

