From: Piotr Auksztulewicz <mlmmj-listrcpt@hasiok.net>
Date: Wed, 19 Mar 2014 21:04:55 +0000
Subject: Re: [mlmmj] Getting resent mail when subscribing to list
Message-Id: <20140319210455.GD23804@szaflik.hasiok.net>
List-Id: <mlmmj.mlmmj.org>
References: <B1DF0070-DAA5-4C05-9400-D32EDBBD9115@iki.fi>
In-Reply-To: <B1DF0070-DAA5-4C05-9400-D32EDBBD9115@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wed, Mar 19, 2014 at 04:29:23PM -0400, Chris Knadle wrote:
> On Wednesday, March 19, 2014 13:02:15 Matti Nykyri wrote:
> > I recently installed mlmmj on my server. I would like to add an
> > option to tunables so that list could be configured to send old
> > posts when people subscribe to the list
> A more interesting option which could do the same thing would be
> to allow a subscriber of the list to be sent a particular /range/
> of list emails.

The 'get-range' option is more sensible. It would be rather annoying
(for me at least) to get a bunch of emails just after subscribing
to a list.  Besides, sending such bursts will not only load both the
list server and the new subscriber's server - it potentialy can land
the list server on some blacklists.

Better still, keep a nice web archive of the list and have the list
welcome message point to it.

And for those queer types that prefer having the whole archive in
their email client instead, subscribe some local user account to the
list and configure delivery to single-file mailbox for this account -
then put the mailbox on (anonymous?) FTP :-)

-- 
Piotr "Malgond" Auksztulewicz                     firstname@lastname.net

