From: Marcelo <marcelo.magallon@gmail.com>
Date: Thu, 08 Nov 2007 14:26:35 +0000
Subject: Re: Autoresponders vs. reply-to list
Message-Id: <937117890711080626q540c7f82x6a8c7932b361bb84@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <42c4a32b0711070948g1c748fd2u1d9b1bcad23f8f68@mail.gmail.com>
In-Reply-To: <42c4a32b0711070948g1c748fd2u1d9b1bcad23f8f68@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

On 11/8/07, Morten K. Poulsen <morten@afdelingp.dk> wrote:

> On Wed, 2007-11-07 at 19:53 -0700, Neale Pickett wrote:
> > "Kovács István" <kovacs.it@gmail.com> writes:
> > > I'd like to make my list's reply-to the mailing list address, not the
> > > sender address.
> >
> > Please don't do this.  It is in violation of RFC 2822
>
> How is that?

RFC 2822 says: "When the "Reply-To:" field is present, it indicates
the mailbox(es) to which the author of the message suggests that
replies be sent."

Since mlmmj is not the author of the message, it should not "suggest"
where the replies should be sent.  In that sense, list software
(re)writing Reply-To headers is in fact a violation of the standard.

The thing about Reply-To is once it's set, it's very hard to convince
some MUAs not to use it, which makes it very hard to send replies to
the author only.

That said, I'm on some lists where the users' expectations are a bit
off with respect to how actual MUAs behave.  They get a list message,
hit reply and expect *that* to go back to the list (even if *their*
MUA doesn't do this).  Enter List-Post and Mail-Followup-To.  Some
MUAs, when they see either of these two fields, cause "reply" to go
back to the email address indicated in those fields.  These MUAs
provide some sort of mechanism to reply to the author only.  Mutt goes
a little bit further and has an explicit "reply to list" function (I
believe Thunderbird does, too) ...

Short version: it causes trouble, but some users want it.  No mailing
list software should use it by default.

Marcelo
