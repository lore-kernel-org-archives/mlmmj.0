From: "Nate Beaty" <natebeaty@gmail.com>
Date: Wed, 11 Apr 2007 21:59:39 +0000
Subject: multiple bounces being delivered?
Message-Id: <ddf499d00704111459m62f4e46cu4f36fcd287c8bdf2@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

i imagine this is something simple, but i'm not sure i understand why
it's happening.. i've had a few people over the last year tell me they
keep getting bounce messages (10+) to an address that's on an mlmmj
mailing list i run.

looking at the .lastmsg for the address, i see qmail autoresponding:

(headers chopped by me..)

Hi. This is the qmail-send program at 66.33.34.80.
I'm afraid I wasn't able to deliver your message to the following addresses.
This is a permanent error; I've given up. Sorry it didn't work out.

<xxx@xxx.com>:
AUTORESPOND: Junk mail received.

--- Enclosed are the original headers of the message.

--117609251766.33.34.8027541632
Content-Type: message/rfc822

Return-Path: <topshelf-newsletter-retailers+bounces-6-xxx=xxx.com@lists.clixel.com>
Received: (qmail 17602 invoked by uid 399); 9 Apr 2007 00:21:52 -0400
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on

(Body supressed)

any suggestions? somehow mlmmj thinks a message is not delivered when
it is (people are telling me they get all 10+ of these msgs) -- how
could this be possible?

i'm using mlmmj 1.2.13 on an ubuntu dapper box. (i've compiled 1.2.14,
just haven't copied it over yet..)

thanks in advance,
nate.
