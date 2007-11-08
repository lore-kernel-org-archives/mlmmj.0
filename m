From: Thomas Goirand <thomas@goirand.fr>
Date: Thu, 08 Nov 2007 17:42:53 +0000
Subject: Re: Autoresponders vs. reply-to list
Message-Id: <47334A9D.4050902@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <42c4a32b0711070948g1c748fd2u1d9b1bcad23f8f68@mail.gmail.com>
In-Reply-To: <42c4a32b0711070948g1c748fd2u1d9b1bcad23f8f68@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Marcelo wrote:
> On 11/8/07, Morten K. Poulsen <morten@afdelingp.dk> wrote:
> RFC 2822 says: "When the "Reply-To:" field is present, it indicates
> the mailbox(es) to which the author of the message suggests that
> replies be sent."

Wouldn't all the people writing to a list expect that the answer is sent
to the list as well? I would, at least.

> Since mlmmj is not the author of the message, it should not "suggest"
> where the replies should be sent.  In that sense, list software
> (re)writing Reply-To headers is in fact a violation of the standard.

Well, mlmmj is not the author, but the list can be considered as the
originator of the mail...

> The thing about Reply-To is once it's set, it's very hard to convince
> some MUAs not to use it, which makes it very hard to send replies to
> the author only.

What do you mean very hard? You just need to change the To: field, no? I
don't see anything hard in that...

> That said, I'm on some lists where the users' expectations are a bit
> off with respect to how actual MUAs behave.  They get a list message,
> hit reply and expect *that* to go back to the list (even if *their*
> MUA doesn't do this).  Enter List-Post and Mail-Followup-To.  Some
> MUAs, when they see either of these two fields, cause "reply" to go
> back to the email address indicated in those fields.  These MUAs
> provide some sort of mechanism to reply to the author only.  Mutt goes
> a little bit further and has an explicit "reply to list" function (I
> believe Thunderbird does, too) ...

Ok, good to know: you advise List-Post and Mail-Followup-To instead.
That seems to make sense. But what is the difference between
Mail-Followup-To and Reply-To then? That confuses me. Also, I'd happily
use it if Thunderbird supports it, but how about outlook, which might
still be the most used MUA?

Thomas
