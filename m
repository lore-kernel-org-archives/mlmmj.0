From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Wed, 19 Mar 2014 22:08:41 +0000
Subject: Re: [mlmmj] Getting resent mail when subscribing to list
Message-Id: <87208006.Q8A5FH2UxX@trelane>
List-Id: <mlmmj.mlmmj.org>
References: <B1DF0070-DAA5-4C05-9400-D32EDBBD9115@iki.fi>
In-Reply-To: <B1DF0070-DAA5-4C05-9400-D32EDBBD9115@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wednesday, March 19, 2014 23:44:41 Matti Nykyri wrote:
> On Mar 19, 2014, at 22:29, Chris Knadle <Chris.Knadle@coredump.us> wrote:
> > On Wednesday, March 19, 2014 13:02:15 Matti Nykyri wrote:
> >> Hello
> >> 
> >> I recently installed mlmmj on my server. I would like to add an option to
> >> tunables so that list could be configured to send old posts when people
> >> subscribe to the list
> >> 
> >> I'm thinking of adding a tunable subget (normal) that will as many old
> >> posts as defined in the tunable. I'll download source from git and
> >> supply a patch if you are interested.

[...]
> When I mean tunable subget (normal) I mean a file under
> control/ directory that specifies how many most recent messages will be
> sent to the subscriber on subscribe.
[...]
> Of course this value needs to be reasonable. For example around 5 or 10
> emails.
[...]
> But why would you need this new tunable? Well I'm dealing with regular women
> that don't have clue how get archives from some mailing list. And when they
> join this a list/conversation it's good tho know what people are talking
> about. So they can immediately join the party.

Well there are a lot of issues concerning telling someone to "view headers" on 
list email messages; many people don't know how to do this, not least of which 
is complicated by the fact that every MUA seems to do this differently such 
that it turns into a game of 20 questions.  Q: "What mail client do you have?"  
A: "What's a mail client?"  ... Ugh.

However you can add a custom footer with the "footer" tunable that would say 
something like:

   "for mailing list options, email <list>+help@<list-addr>
    for further information,  email <list>+faq@<list-addr>"
    [and so on]

to make it more obvious what options there are and other helpful information.



But regardless -- I get your point and I see why you want this.

[...]
> Also the range thing that you proposed is actually a good idea and easy to
> implement. I can also look into it. Just cloned the git branch.

As you implement this keep in mind that there are limitations on what 
characters can appear in the "local part" (the part before the @) in an email 
address.  {}- characters are all fine which is why I suggested those.  Others 
like [] and space are not unless encompassed in quotation marks.  A simple 
pipe character (i.e. <list>+get-N|M@<list-addr>) could work too.

   http://en.wikipedia.org/wiki/E-mail_address#Local_part

  -- Chris

--
Chris Knadle
Chris.Knadle@coredump.us

