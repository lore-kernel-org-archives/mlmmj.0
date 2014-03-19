From: Matti Nykyri <matti.nykyri@iki.fi>
Date: Wed, 19 Mar 2014 21:44:41 +0000
Subject: Re: [mlmmj] Getting resent mail when subscribing to list
Message-Id: <C1D47137-C3C5-4FCB-8019-C2A03F7AD003@iki.fi>
List-Id: <mlmmj.mlmmj.org>
References: <B1DF0070-DAA5-4C05-9400-D32EDBBD9115@iki.fi>
In-Reply-To: <B1DF0070-DAA5-4C05-9400-D32EDBBD9115@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mar 19, 2014, at 22:29, Chris Knadle <Chris.Knadle@coredump.us> wrote:

> On Wednesday, March 19, 2014 13:02:15 Matti Nykyri wrote:
>> Hello
>> 
>> I recently installed mlmmj on my server. I would like to add an option to
>> tunables so that list could be configured to send old posts when people
>> subscribe to the list
>> 
>> I'm thinking of adding a tunable subget (normal) that will as many old posts
>> as defined in the tunable. I'll download source from git and supply a patch
>> if you are interested.
> 
> I'm not a developer of mlmmj (yet) but sending someone /all/ of the old posts 
> automatically upon signup doesn't sound like a good idea, because that could 
> have all kinds of unintended consequences.
> 
> Say, for instance, that the list has 10,000 messages in it, and 4 people sign 
> up for the list today.  Yikes.  Or, a user of such a list removes one's self 
> from the list, then later the same day signs back up for it thus triggering 
> getting the entire list history again for no good reason.
> 
> A more interesting option which could do the same thing would be to allow a 
> subscriber of the list to be sent a particular /range/ of list emails.  Mlmmj 
> comes with the facility for a subscriber to retrieve a /particular/ list email 
> via sending a message to <listname>+get-N@<list-email-addr> where "N" is the 
> message #; if this could be expanded to <listname>+get-{N-M}@<list-email-addr> 
> such that the "{N-M}" could be parsed as a range and mlmmj modified to send 
> that range of emails back to the user, then the user could have the /option/ 
> of retrieving the portion of the mailing list that they're interested in.
> 
Yes, send 10000 emails for a person subscribing a list is, how do you put it, well idiotic. When I mean tunable subget (normal) I mean a file under control/ directory that specifies how many most recent messages will be sent to the subscriber on subscribe. As you probably know all normal tunables (not list nor boolean tunables) are parsed to some scalar value or string. So that is what i mean with the normal. Subget would be a scalar value of how many recent mails to send on subscribe.

Of course this value needs to be reasonable. For example around 5 or 10 emails. And it is up to the list administrator to set this value. Why would an administrator set the value to around 10000? If he wants to spam peoples mail he can use any script to send 100000 emails with only a little effort anyways. They should of course get trapped by modern span filters on receiving end.

But why would you need this new tunable? Well I'm dealing with regular women that don't have clue how get archives from some mailing list. And when they join this a list/conversation it's good tho know what people are talking about. So they can immediately join the party. Of course it would be much wiser to send post from this day or with some aging value or the hole threads that have been active for today, but it's much simpler to just implement sending of last 10 mails for example.

Also the range thing that you proposed is actually a good idea and easy to implement. I can also look into it. Just cloned the git branch.

> Let me know what you think of this tweak to the idea.
> 
> -- Chris
> 
> --
> Chris Knadle
> Chris.Knadle@coredump.us
> 
> 

