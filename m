From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Wed, 11 Jul 2007 17:28:31 +0000
Subject: Re: [RFC] misc moderation patches
Message-Id: <9f484b9bb5fceb0a2afbf180a60ac853@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20070705195719.GK5523@suse.de>
In-Reply-To: <20070705195719.GK5523@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Steve,

Steve Beattie <sbeattie@suse.de> wrote:
> On Thu, Jul 05, 2007 at 11:13:10PM +0200, Morten K. Poulsen wrote:
>> We're in the RC-period for 1.2.15
> 
> Yes, I was aware of the RC-release which is why I was posting for
> comment rather than inclusion. The patches I posted were against
> 1.2.15-RC1. Unfortunately, the timing failed to work out that I didn't get
> to these before the RC1 release; timing's never been my strong point. :-)

:-)

>> (feedback please!),
> 
> The only problems I've run into with the RC have been due to bogons
> introduced by myself, but I barely scratch the surface in terms of using
> the functionality of mlmmj. Others will need to comment on the current RC.

Ok. Anybody else? Does the thing even compile on various systems?

It works for me on:
- Debian GNU/Linux 3.1
- FreeBSD 6.2
- OpenBSD 4.1

>> so your patches will not be merged to CVS right now. Please remind me
>> of them when 1.2.15 is out :)
> 
> Sure, will do. I've pushed a quilt series up to
> http://www.nxnw.org/~steve/warez/mlmmj/ which is where I'll update the
> patches to incorporate your feedback.

$ telnet www.nxnw.org 80
Trying 208.151.246.43...
telnet: connect to address 208.151.246.43: Connection timed out

(And no, I *don't* browse with telnet ;-)


>> > mlmmj-X-List-Administrivia_header.patch
[snip]
>> Yes, please do that.
> 
> Fixed in the quilt series.

Cool.

>> > mlmmj-multiple_moderation_args.patch
>> [snip]
>> > 	I left the moderation of subscriptions alone.
>> 
>> Could you add that as well?
> 
> Possibly. The multiple cookie parsing splits on dashes, and I figured it
> would break on email addresses containing dashes as well, which is why I
> avoided adding support for multiple addresses. I'm not sure how exactly
> to format the reply commands in a way that will be easily parsable; ideas?

But subscription moderation does not contain the (new) subscribers
address in the argument. It is something like
listname+moderate-subscribeCOOKIE@example.org

I am not sure why mmj reused the "moderate" keyword, and added the
magic "subscribe" before the cookie. That might change in mlmmj-2.0.0 ;-)

>> Also, please send out a reject mail. Otherwise it's a
>> discard - not reject.
> 
> Doh, yes, of course. Though would a discard command be accepted as
> well?

Discard would be OK. Both would be perfect.

> But for a content moderated list, it makes sense to send out a
> reject message; however, presumably in that situation a moderator would
> like to be able to send a custom message to explain why the message was
> rejected. Perhaps just returning the body of the moderation message to
> the original sender?

Yes, that is a good idea.

>> > mlmmj-add_moderator_command.patch
>> [snip]
>> > 	I'm not sure proper envelope filtering is done here,
>> > 	though.
>> 
>> Envelope filtering?
> 
> It's entirely probable I am confused. I was looking at the code in
> src/mlmmj-process.c that handles the 'owner' command:
> 
>    569                          /* strip envelope from before resending */

Oh yes, this code just removes "Return-Path: " and "From " headers,
which contain the SMTP envelope from. Those headers are only
useful when a mail is delivered (locally) and saved in a file. They
should never be present inside the SMTP DATA. That is why they
are being stripped here.

> and (a) wasn't sure why this command was handled here rather than in
> the listcontrol()

I am not sure:

    /* Why is this here, and not in listcontrol() ?  -- mortenp 20060409 */

mmj?

I think it is safe to move it.

> and (b) assumed the 'moderators' command would need to do
> something similar.

Yes.

> But SMTP envelopes are an area that I don't quite grok, and pointers
> to clues are welcome.

http://www.xkcd.com/c138.html ;-)

An example of a SMTP session might look like this:

# banner
S: 220 example.com SMTP server ready

# hello
C: HELO sender.test
S: 250 example.com

# envelope from
C: MAIL FROM:<user@sender.test>
S: 250 OK

# envelope to
C: RCPT TO:<somebody@example.com>
S: 250 OK

# the mail itself (headers + body)
C: DATA
S: 354 Start mail input; end with <CRLF>.<CRLF>
C: From: Joe User <user@sender.test>
C: To: Somebody <somebody@example.com>
C: Subject: blah blah blah
C:
C: mail body here
C: .
S: 250 OK, queued as 29381984

# end
C: QUIT
S: 221 Bye

The envelope addresses are used for mail (and bounce) routing. The
addresses in the DATA section are only used by user agents (and
some *very* broken transfer agents).

When delivering the mail to its final destination, the delivery agent
usually adds the envelope addresses to the DATA section. They are
often added as "Delivered-To: " (envelope to) and "Return-Path: "
or "From " (note! no colon) (envelope from).

RFC 821, RFC 1869 and RFC 2821 are good references.


Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

