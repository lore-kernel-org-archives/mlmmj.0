From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 09 Mar 2010 22:35:19 +0000
Subject: [mlmmj] Re: PATCHES: richer listtext
Message-Id: <4B96CD27.7000609@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Anyone had a chance to look at and/or test these yet?

Ben.



On 25/02/10 10:44 PM, Ben Schmidt wrote:
> Hi, all,
>
> Given there has been positive interest, and there will be minimal/no
> disruption to mlmmj's operation, I have implemented the richer listtext
> features I wrote about earlier.
>
> I'm sending these patches through now, though they have had only minimal
> testing, particularly as Robin Johnson has volunteered to help test.
>
>
>
> mlmmj-listtext-headers.patch
> - Allows arbitrary headers to be included at the beginning of listtexts.
> - All the headers in the listtext will be included in the mails mlmmj
> sends.
> - Mlmmj standard headers of the same name as those in the listtext will
> be omitted.
> - Substitutions using the $whatever$ mechanism can be used.
> - \uNNNN escaping is supported in the headers, as with the rest of the
> listtext.
> - Automatic =?utf-8?q?...?= quoting is done for (and only for) the
> Subject: header.
> - Also includes a couple of bugfixes related to sending digests.
> - This is compatible with current behaviour.
> - The interface to prepstdreply() is changed, however; there is no
> longer a customheaders argument. It was never used, and since this
> patch allows custom headers to be included in listtext, is not really
> necessary as a function argument. Incorporating it in the
> implementation would have been more trouble than value.
>
> mlmmj-origmail-count.patch
> - Alters the way $originalmail$ works; it doesn't buffer the entire
> $originalmail$ substitution in memory, but does it a line at a time.
> - $originalmail$ must be first on a line, optionally preceded by
> whitespace. The whitespace is prepended to each line of the mail that
> is included.
> - The rest of the line following $originalmail$ is ignored.
> - $originalmailNNN$ can be used, where NNN is a number of lines to
> include. Use a large number such as 1000000000 to include the whole
> mail (but be aware of integer overflow so don't go too big!).
> - If NNN is omitted, the default is 100.
> - To get current behaviour, a space must be prepended to the lines
> currently containing $originalmail$ in the listtexts. Apart from that,
> this is compatible with current behaviour.
> - Again, there is an interface change. substitute() and substitute_one()
> no longer take the original mail filename, and cannot be used to do
> $originalmail$ substitution. This was never used except by
> prepstdreply() which now incorporates that substitution itself.
>
> mlmmj-subject-substitute.patch
> - Allows $subject$ to be used for the subject of the mail being
> moderated (or denied, etc.).
> - Compatible.
>
> mlmmj-random-substitute.patch
> - Allows $random0$ through $random5$ to be used as distinct random
> strings.
> - Compatible.
>
> mlmmj-efficient-random.patch
> - Makes random number generation more efficient by only seeding the
> generator once.
> - Compatible, though behaviour will change slightly.
>
> mlmmj-fixed-length-random.patch
> - Makes the random strings produced always the same length rather the
> smaller random numbers producing shorter strings which could be
> problematic.
> - Compatible, though behaviour will change slightly.
>
>
>
> I still plan to include proper documentation (in the patches or as a
> separate patch), but for testing purposes, this email should suffice.
>
> The moderation listtext I have tested with is attached.
>
> I believe the patches will not all apply cleanly unless you have already
> applied these patches:
>
> - patch-mlmmj-1.2.17-origmail.diff (mlmmj+get-1844@mlmmj.org)
> - mlmmj-notifymod.patch (mlmmj+get-1826@mlmmj.org)
>
> (I've attached them for convenience, since one of them doesn't seem to
> have made it into the web archive, and the +get trick hasn't worked for
> me yet, though I suspect the latter problem is just a delay.)
>
> Nor will all apply cleanly unless you apply them in order.
>
> If you have trouble, let me know. It's possible another of my patches
> I have applied affects this, though I don't think so.
>
>
>
> The following is a rough list of things that should be tested that I
> made as I implemented:
>
> - digests with and without thread summary work
> - Content-Transfer-Encoding headers correctly output for both digest and
> listtext
> - multiple headers of same type in listtext are preserved
> - \uNNNN escaping works
> - number of lines of $originalmail$ correctly honoured
> - when larger than mail length
> - when smaller than mail length
> - when equal to mail length
> - number of lines of $originalmail$ handled as 100 when not given
> - whitespace preceding $originalmail$ correctly prepended to every line
> of included mail
> - content after $originalmail$ ignored (no crash)
> - six random values are distinct, but the same when reused in the same
> listtext
> - subject substitution
> - including when original subject contains utf8
> - headerless listtext (warnings output)
> - with and without blank line
> - invalid header in listtext OK (no crash)
>
>
>
> Help testing will be particularly appreciated. Code review and other
> feedback also welcome.
>
> Ben.
>
>
>


