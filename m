From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 11 Apr 2007 22:09:23 +0000
Subject: Re: multiple bounces being delivered?
Message-Id: <20070411220923.GE69191@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <ddf499d00704111459m62f4e46cu4f36fcd287c8bdf2@mail.gmail.com>
In-Reply-To: <ddf499d00704111459m62f4e46cu4f36fcd287c8bdf2@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Nate Beaty <natebeaty@gmail.com> [Apr 11. 2007 23:59]:
> any suggestions? somehow mlmmj thinks a message is not delivered when
> it is (people are telling me they get all 10+ of these msgs) -- how
> could this be possible?
> 
> i'm using mlmmj 1.2.13 on an ubuntu dapper box. (i've compiled 1.2.14,
> just haven't copied it over yet..)

Well, their qmail box is replying to the Return-Path: address, which is
what mlmmj uses for bounces. If it did the same and the list list was
run by ezmlm it would also look like a bounce.

Is there a return code?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
