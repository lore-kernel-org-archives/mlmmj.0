From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Wed, 07 Apr 2010 03:03:36 +0000
Subject: Re: [mlmmj] More Nits
Message-Id: <4BBBF608.5020505@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4917C91D-7A19-4BF2-A179-E3061BC3524E@sabahattin-gucukoglu.com>
In-Reply-To: <4917C91D-7A19-4BF2-A179-E3061BC3524E@sabahattin-gucukoglu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 7/04/10 12:36 PM, Sabahattin Gucukoglu wrote:
> I just noticed that mails with null envelopes were being rejected.
> Why's that?  No prob if it's legitimate, it just happened that my
> script was using it (as opposed to any other arbitrary address).

I don't know much about this, and am certainly not an authority, but I
think null envelopes are usually used for bounce messages. In fact,
IIRC, RFC 2821 or some other relevant RFC says that they should be used
for bounce messages and for nothing else. Since bounce messages
obviously aren't meant to be delivered to a mailing list, these are
dropped (and are possibly even used for bounce processing).

> And, the best one: I was about to implement VERP in XMail (the mailer
> I'm using) before I noticed that mlmmj is doing it itself!  Well, if
> I'd known that, I wouldn't have worked up to doing it myself, since
> XMail already explodes jobs anyway into one-recipient-per-queue-item.
> So, a note please in the README explaining how unless the verp file is
> present, mlmmj is doing it itself.

Someone else will have to weigh in about that.

Ben.





