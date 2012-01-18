From: Mark Alan <varia@e-healthexpert.org>
Date: Wed, 18 Jan 2012 09:26:24 +0000
Subject: Re: [mlmmj] Add Suscribers
Message-Id: <20120118092624.068db445@e-healthexpert.org>
List-Id: <mlmmj.mlmmj.org>
References: <D176E0C7E42DA44992D7811C809C30844E4963@redbull.leachman.com>
In-Reply-To: <D176E0C7E42DA44992D7811C809C30844E4963@redbull.leachman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tue, 17 Jan 2012 13:47:39 -0700, "Cody Moreshead"
<cody@leachman.com> wrote:

> Please can someone help.  I may be using mimmj in the near future and
> have some questions.  I need to be able to subscribe/unsubscribe users
> via email.


A year ago I asked, in this mailing list, for the equivalent command to
what was being done by ezmlm (which was the main inspiration for the
mlmmj project). Which goes more or less like this:

1) An authorized sender (i.e. an email sent from an email address listed
in the subscription moderators file) would send an email to an
address like:
To:  some_list+subscribe-john.doe=example.com@domain.tld

2) And that would be the same as executing, at the @domain.tld mailing
list server console, this command:
 /usr/bin/mlmmj-sub -L /var/spool/mlmmj/some_list -a
some.user@example.com

3) The subscription moderator(s) would then receive the usual
subscription aproval email:
=======================From: some_list-owner@domain.tld
To: some_list-moderators@domain.tld
Reply-To: some_list+moderate-subscribe2d381ca04db6edd3@domain.tld

Hi, this is the mlmmj mailer managing the mailinglist

some_list@domain.tld

There is a subscription request from

some.user@example.com

waiting. To approve this request, please send a reply to

some_list+moderate-subscribe2d381ca04db6edd3@domain.tld

Your mailer probably automatically replies to this address, when you hit
the reply button. If you don't want to approve the request, simply
ignore this message.

The following subscription moderators have received this mail:

some.admin1@domain.tld
some.admin2@domain.tld
=======================

At that time nobody was able to tell me how to do it.

At that time it seemed that the current developer(s) tend to
favor a much insecure way of mailing list administration (at least
for internet sitting servers), namely, some king of rudimentary
script to support a web interface.

M.

