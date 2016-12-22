From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 22 Dec 2016 21:13:23 +0000
Subject: Re: [mlmmj] mlmmj: list subscriber email in both nomailsubs.d and subscribers.d
Message-Id: <0c7646af-8d81-e092-be2b-034120b6bcca@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <73838a63-024c-900b-dd20-bae090c5d2a1@vlsc.org>
In-Reply-To: <73838a63-024c-900b-dd20-bae090c5d2a1@vlsc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> What happens when a list subscriber's email appears in an ASCII text file in the
> list's subscribers.d directory, as well as being contained in a file in the list's
> nomailsubs.d directory? Which takes precedence?

They will be sent mail, because sending mail enumerates the
`subscribers.d` files. They will be treated as subscribers for things
such as `subonlypost` because subscribers, digesters and nomailsubs are
all checked for that. Unsubscribing should unsubscribe them from both.
(It is legitimately possible for people to be subscribed to both normal
and digest versions; this is in fact a simpler case, though one without
a use case, so it's harder to achieve it, but it won't do any harm.)

> One of our list subscribers was attempting to send a simple email to the list (ie.
> not beyond the maxsize), but received a bounce-back message containing "...was
> unable to be delivered to the list because you are not a list subscriber".  I
> triple-checked to make sure their email address was spelled correctly in the
> subscribers.d text file (it was), but I haven't yet determined why they received
> this "not a list subscriber" bounce.

That does seem strange. Usually these kinds of errors are
spelling-related. There could be something else tricky going on. Check
obscure things like extra trailing whitespace in the subscribers file,
including a wrong line ending (e.g. a DOS line ending not a Unix one,
which would expect the address to end with CR/'\r').

Good luck! Let me know if I can be of further assistance.

Ben




