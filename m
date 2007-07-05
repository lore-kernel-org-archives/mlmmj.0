From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Thu, 05 Jul 2007 21:13:10 +0000
Subject: Re: [RFC] misc moderation patches
Message-Id: <2509e617120d6b1889e96d6eabfe439d@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20070705195719.GK5523@suse.de>
In-Reply-To: <20070705195719.GK5523@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Steve,

Welcome, and thanks for contributing.

Steve Beattie <sbeattie@suse.de> wrote:
> Here are some patches mostly related to moderating emails for
> discussion.

I've looked at your patches, and they look clean. I have a few
comments. See below.

We're in the RC-period for 1.2.15 (feedback please!), so your
patches will not be merged to CVS right now. Please remind me
of them when 1.2.15 is out :)

> mlmmj-X-List-Administrivia_header.patch
> 
> 	This patch adds two headers, an "X-List_administrivia: Yes" header
[snip]
> 	or it should just be added automatically in prepstdreply().

Yes, please do that.

> mlmmj-multiple_moderation_args.patch
[snip]
> 	I left the moderation of subscriptions alone.

Could you add that as well?

> mlmmj-reject_command.patch
[snip]
> 	I didn't add support for rejecting subscriptions; that should
> 	probably be fixed.

Yes, please. Also, please send out a reject mail. Otherwise it's a
discard - not reject.

> mlmmj-add_moderator_command.patch
[snip]
> 	I'm not sure proper envelope filtering is done here,
> 	though.

Envelope filtering?

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

