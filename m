From: "Jakob Hirsch" <jh@plonk.de>
Date: Wed, 14 Dec 2005 16:07:37 +0000
Subject: Re: MIME footer patch, was: mlmmj-1.2.9-RC2 and scooping up patches
Message-Id: <33445.127.0.0.1.1134576457.squirrel@ymmv.de>
List-Id: <mlmmj.mlmmj.org>
References: <439A50CA.2020703@plonk.de>
In-Reply-To: <439A50CA.2020703@plonk.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Mads Martin Joergensen wrote:

>> The changes are really big, but the code is much clearer now and fairly
>> straightforward. As always, comments welcome.
> It's nice and fine, but too big to go in 1.2.9 at this point. 1.2.10-RC1
> will have it.

That's fine with me, anybody needing it can use the patch for now. And
there is a small change needed...


Something different: I get the following in my mail log when a mail is
sent to a list. The list is low traffic, so it didn't appear before.

Dec 14 16:56:35 ymmv /usr/local/bin/mlmmj-process[24558]:
subscriberfuncs.c:61: Could not mmap fd: Invalid argument
Dec 14 16:56:35 ymmv /usr/local/bin/mlmmj-send[24558]:
getaddrsfromfd.c:27: Could not mmap fd: Invalid argument

The error looks bad, but messages are sent out fine.

