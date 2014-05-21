From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Wed, 21 May 2014 13:04:50 +0000
Subject: Re: [mlmmj] Dealing with DMARC - any out-of-the-box solution in sight?
Message-Id: <1778442.oaihlL3kv5@trelane>
List-Id: <mlmmj.mlmmj.org>
References: <CAOPHaVTAVpbLN9OUyzG7NMWu4szaHCKgLbjE56wvL6tJpFY-2A@mail.gmail.com>
In-Reply-To: <CAOPHaVTAVpbLN9OUyzG7NMWu4szaHCKgLbjE56wvL6tJpFY-2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wednesday, May 21, 2014 13:19:58 Christian Lohmaier wrote:
> Hi *,
> 
> DMARC is in use by yahoo and others for a while, and gmail and others
> already respect the settings, causing many bounces....
> 
> I wonder whether mlmmj will have some dmarc-compatible default soon or
> how other mailinglist admins deal with the topic.

   http://www.ietf.org/mail-archive/web/ietf/current/msg87153.html

> Disallow all mail from dmarc-policy using senders?

Normally only the sending MTA would be looking up this information, and having 
mlmmj do this likely wouldn't make sense because there are already options 
that would allow doing this another way.

> Forward only (no footers, no list-tag, no body filtering... - and no
> real solution with some SPF)?

I don't think this is realistic.

> Just replace from-address by "John Doe via <list-addresss>"?
> Replace From and add reply-to?
> Replace From by forwarder-address?

These three area all possible to do in the MTA, but it's generally frowned 
upon because the MTA is not supposed to modify the message other than adding 
informational routing headers, and is never supposed to modify the body of the 
message.

Some mailing list software (such as DaDa Mail for one) have an option where 
the outbound sending email address is always that of the list, but modified 
with the senders name,
e.g. "Christian Lohmaier p.p. This Mailing List <list@lists.example.net>"
but this is a global setting and terribly ugly.

> What have other mailinglistadmins done?

So far I've heard list admins 'moderate' yahoo.com addresses so that those 
users cannot send mail through the list, or unsubscribe yahoo.com addresses.

> And what is the suggestion by mlmmj-devs?

Options I know of in mlmmj directly:

   - mlmmj has an 'access' tunable whereby you could make a rule to either
     deny, moderate, or hold mail from yahoo.com so that they cannot send

   - ask subscribers to sign up for the list using a mail service other
     than Yahoo.

The latter is what I have been doing, with explanation of the problem going on 
with Yahoo DMARC.

  -- Chris

--
Chris Knadle
Chris.Knadle@coredump.us

