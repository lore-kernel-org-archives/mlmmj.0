From: Christian Laursen <xi@borderworlds.dk>
Date: Tue, 18 Sep 2007 18:11:55 +0000
Subject: Re: Having individual receiver in To: field
Message-Id: <ygfabrjj11w.fsf@dominion.borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
References: <1557ec740709171048y2b7c2e08g5c9fbfe40196087a@mail.gmail.com>
In-Reply-To: <1557ec740709171048y2b7c2e08g5c9fbfe40196087a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Thomas Goirand <thomas@goirand.fr> writes:

> This makes me think that I would have like a way that only certain
> person (like the list owners or the moderators) could send to the
> moderated list without the hassle of having to approve the messages. On
> a busy mail server it can take some time until we receive the moderation
> message. I don't really know how this could be implemented, but what I
> thought about would be something like a password in the subject that
> would be removed, for example (this is not very nice, but that's the
> only thing I can think of). I know that the From: checking is not enough
> as this could be faked. Does anybody has a better idea for that one?

Make an access file containing something like this:
allow ^Approved: yoursecretpasswordgoeshere
moderate

and add "Approved:" to delheaders.

Then it would just be a matter of including the correct
Approved-header and if not, the message would be sent to the
moderator(s).

-- 
Christian Laursen
