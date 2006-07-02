From: Christian Laursen <xi@borderworlds.dk>
Date: Sun, 02 Jul 2006 00:11:34 +0000
Subject: Re: Encoding emails in header for AOL feedback loop?
Message-Id: <ygfmzbs987d.fsf@dominion.borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
References: <42739F1F-EDF1-4641-B780-FD4061B679D4@gmail.com>
In-Reply-To: <42739F1F-EDF1-4641-B780-FD4061B679D4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Nate Beaty <natebeaty@gmail.com> writes:

> I am having problems with AOL members who are apparently clicking
> "spam" instead of deleting or just unsubscribing to newsletters they
> have signed up for. I have set up the feedback loop via AOL's
> postmaster, but they strip out the email address of the person
> clicking "spam", even though it's VERP-encoded.

You are referreing to the "Client TOS Notification" mails, right?

> Is there any way to encode their email into a header so AOL doesn't
> strip it out and I can unsubscribe them?

I just took a look at one of those mails, and I see a non-stripped
Return-Path header:

Return-Path: 	<news-daily+bounces-78-foobar=aol.com@list.somedomain.tld>

I have of course changed the address above a little bit, but the info
seems to be there, at least in the mails they send to us.

-- 
Christian Laursen
