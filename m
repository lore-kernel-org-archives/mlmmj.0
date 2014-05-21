From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Wed, 21 May 2014 14:49:28 +0000
Subject: Re: [mlmmj] Dealing with DMARC - any out-of-the-box solution in sight?
Message-Id: <2226493.LVL1xezZrv@trelane>
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
> 
> Disallow all mail from dmarc-policy using senders?
> Forward only (no footers, no list-tag, no body filtering... - and no
> real solution with some SPF)?
> Just replace from-address by "John Doe via <list-addresss>"?
> Replace From and add reply-to?
> Replace From by forwarder-address?
> 
> What have other mailinglistadmins done?
> And what is the suggestion by mlmmj-devs?

DMARC suggests the following concerning mailing lists:

   http://dmarc.org/faq.html#s_3

essentially all of the suggestions break the standard way in which mailing 
lists operate.



This message has some other informational links:

   http://www.ietf.org/mail-archive/web/ietf/current/msg87171.html

  -- Chris

--
Chris Knadle
Chris.Knadle@coredump.us

