From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Wed, 04 Jun 2008 06:58:44 +0000
Subject: Re: Changing mailing list subscription process
Message-Id: <1212562724.8708.17.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <20080529230903.GJ16364@curie-int.orbis-terrarum.net>
In-Reply-To: <20080529230903.GJ16364@curie-int.orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tue, 2008-06-03 at 22:08 -0700, Robin H. Johnson wrote:
> Presently, the listtexts (eg sub-confirm) only provide the Subject
> header. Even if you add 'Precedence: bulk', it gets placed in the body
> of the mail.

Yes, the templates are for translatable text.

> So first step would be supporting mail headers in list
> text templates either directly,

I don't like that.

> or with a customadminheaders control.

Way better.

> The normal customheaders is not suitable for admin mails, as it may
> contain headers that you only want on real messages.

True.

> Secondly, we need to change how the reply-to is built for the various
> emails. Instead of passing -R to mlmmj-send, we must move the build to
> the templates.  So ALL existing templates would need this addition to
> maintain the existing behavior:
> Reply-To: $confaddr$

Well, Reply-To header is not a translatable text, so it should not be in
the translation file.

Anyway, what would you change the Reply-To header of subscription
confirmation mails to, in order to let human users choose "Reply" in
their MUAs to subscribe, but not let robots do the same?

Morten

