From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 15 Feb 2016 23:18:29 +0000
Subject: Re: [mlmmj] bounces-help and exim
Message-Id: <56C25CC5.4030004@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <CAPcb_G+ZVfXtgD1UoxzaitRhyYtWN3ToYu0kC2XgWJjjE9Jrww@mail.gmail.com>
In-Reply-To: <CAPcb_G+ZVfXtgD1UoxzaitRhyYtWN3ToYu0kC2XgWJjjE9Jrww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

>> I'm thinking that perhaps something is messed up with your delimiter,
>> i.e. +bounces-help is being treated like +help (+bounces-help is the
>> address used when + commands fail, like subscription, etc.).
>>
>> Do other + commands work, e.g. subscribing via email?
>
> All others work. Oh, I didn't realise +bounces-help should return what
> +help does?
>
> Or should it?

No, it shouldn't. Mlmmj should process it as a bounced 'help' message
(which could be one from +help or any other 'special' message Mlmmj
sends out, such as a request to confirm a subscription, etc.).

>> Is there anything revealing in "mlmmj-operation.log"? There should be an
>> "XXX requested help" line when help emails are sent out.
>
> Just matching lines saying mailer-daemon requested help, as below:

OK, that's good to know (along with your other diagnostics). It seems
that +help is truly being addressed.

Having looked through Mlmmj's source code and brainstormed, I think the
problem lies with how your mail is sent to your smart host.

Mlmmj sends subscription and unsubscription confirmation requests,
acknowledgements and errors, as well as digests, with a "From:" header
that is the list help address, but with an SMTP envelope-from that is
the bounce address.

It appears your mailer-daemon friend is, however, sending bounce
messages to the "From:" header.

No self-respecting MTA would do that, however.

So, I'm guessing the way your setup works is that you have Exim relaying
Mlmmj's outgoing messages. I suspect that it is saving the message to a
queue, discarding the SMTP envelope-from, and then when it grabs the
message out of the queue to deliver to your smart host, it is using the
"From:" header as the SMTP envelope-from. If that address is
undeliverable for any reason, your mailer-daemon friend sends a bounce
back, unfortunately to the wrong place, due to the substitution of the
"From:" header as the SMTP envelope-from. Mlmmj duly replies with the
help message, which your smart host redirects to their service desk
address.

What Exim should be doing is adding a Return-Path header to record the
SMTP envelope-from when it first accepts and queues the message, then
when it grabs the message from the queue, it should remove the
Return-Path header, but use its content for the SMTP envelope-from. Then
your upstream smart host will be given the correct envelope-from, and
bounces will go to the appropriate bounce address and be handled by
Mlmmj (automatically unsubscribing bouncing addresses, removing
confirmation bookkeeping for invalid addresses, etc.).

There are probably Exim configuration options that can be used to
achieve this. They're possibly off by default so that any user can't
just manipulate the envelope from by putting a Return-Path header in
their messages, potentially bypassing authentication which may
ordinarily be used to set the envelope from. I found these pages which
might help:

- <http://stackoverflow.com/a/7047164/4785823>
- 
<http://www.exim.org/exim-html-current/doc/html/spec_html/ch-generic_options_for_transports.html>
   (see return_path_add and possibly return_path)
- 
<http://www.exim.org/exim-html-current/doc/html/spec_html/ch-message_processing.html>
   (see point 15)

If you can get that working, I think things should settle down (and,
indeed, improve, because bouncing addresses will be handled, rather than
building up and making you look like a spammer).

That is, of course, assuming all of my guesses are correct about what's
going on here.

> P.S. No updates for this year:
>
> http://mlmmj.org/archive/mlmmj/

Yours was the first truly meaningful message of the year.

:-)

Ben





