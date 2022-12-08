From: Baptiste Daroussin <bapt@nours.eu>
Date: Thu, 08 Dec 2022 08:01:29 +0000
Subject: Re: [mlmmj] mlmmj patches from distributions: Gentoo
Message-Id: <20221208080129.vgw4if46fkwe6atl@aniel.nours.eu>
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20221208T005748-436219077Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20221208T005748-436219077Z@orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, Dec 08, 2022 at 01:13:26AM +0000, Robin H. Johnson wrote:
> It's great to see more active development again.
> Gentoo Linux still runs mlmmj for all our lists, and we've got some
> patches that would be great to land upstream.
> 
> mlmmj-1.3.0-gcc-10.patch - GCC 10 fix

This is already in
> 
> mlmmj-1.2.19.0-listcontrol-customheaders.patch
> Include the customheaders file content in list control messages.

I will look at it and see to incomporate
> 
> mlmmj-1.3.0-logging.patch - this is a brand new patch, not tested yet.
> When dropping messages from non-subscribers, we wanted a better trail
> about it. Ideally we'd 
> 1) log the message-id
> 2) give a per-message SMTP-time rejection (need postfix filter stuff)

I will look into it as well.
> 
> There's one scaling discussion we need to have, but the handling needs
> to include how to incrementally get there:
> 
> How to have millions of mails in /archive/!
> 
> Our most active list is now approaching 1.5M emails in that directory,
> and it worries me.

Why is it worrying you? a directory can hold way more than that.

On FreeBSD, one thing we are doing is when creating the public archives via:
https://fossil.nours.eu/mlmmj-archiver/doc/trunk/README.md (this may move to
codeberg), I append the archives to a mbox, so I can cleanup what ever is in the
archives directory if I need (I did not need up to now).

DISCLAIMER: mlmmj-archiver is not portable at all yet, and is not even in alpha
state :D (I am happily accepting portability patches, but this is not my focus
yet).

Best regards,
Bapt

