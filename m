From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Fri, 25 Jan 2008 12:09:44 +0000
Subject: Re: FAQ and instructions?
Message-Id: <1201262984.6564.19.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <4f66334953Richard@Torrens.org.uk>
In-Reply-To: <4f66334953Richard@Torrens.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Richard,

On Thu, 2008-01-24 at 13:35 +0000, Richard Torrens wrote:
> Search as I may, I find not a lot on how to run lists on mlmmj: all notes
> seem to be about how to set it up.

Well, the lists run them self once they are set up.

> So are there any manager type instructions or FAQs?

What kind of instructions are you looking for? I am not sure I
understand exactly what you are looking for...

> Is this the right place to ask quesrions?

It sure is :-)

> I own several domains and have recently transferred server on
> torrens.org.uk. New server has mlmmj installed and from what have seen,
> it's vastly more friendly to me than was Mailman.

Hehe, that was part of the original plan.

> My preferred method of maintenance is not via SSH and the command line,
> but via FTP. But how safe is it to delete or alter files in archive,
> bounce, incoming, moderation and queue?

Well, it is safe, but why would you want to do that?

> Exactly what is the flow thought these? Some are obvious, some not.

mlmmj-recieve (sic) writes the incoming mail to LISTDIR/incoming/ and
executes mlmmj-process.

mlmmj-process moves the mail to LISTDIR/queue/, processes it, and moves
it to LISTDIR/moderation/ for moderation or executes mlmmj-send.

mlmmj-send distributes the mail and moves it to LISTDIR/archive/.

mlmmj-bounce records the fact that a given address is bouncing in
LISTDIR/bounce/.

> I ask because curently there's a mail stuck in moderation - it has
> .sending appended - but has not been sent!

A mail is renamed from COOKIE to COOKIE.sending when moderation has been
accepted. Then mlmmj-send is executed. It should have been moved to
LISTDIR/archive/ by mlmmj-send. You may have hit some unknown bug?

You can safely rename it back to COOKIE and resend your moderation
email.

Morten

