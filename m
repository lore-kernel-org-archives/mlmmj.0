From: Sabahattin Gucukoglu <mail@sabahattin-gucukoglu.com>
Date: Wed, 07 Apr 2010 23:07:02 +0000
Subject: [mlmmj] Resent-From + subonlypost
Message-Id: <D3B4DC71-9D58-4DC3-86F9-C08C14A106BC@sabahattin-gucukoglu.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi all,

One of my lists is a news update list for friends.  Sometimes I "Redirect" (RFC 5322 Resent-* fields) directly to my list.  The From: header thus is the original From:.  You might guess the problem: I'll redirect, then because subonlypost is set, a bounce will confuse the original sender.

Please can mlmmj support the Resent-From for the checks requiring a check against the original sender prior to the From: field?

As an aside, I'm using TMDA; many TMDA users will be using From as I do, to hold the original address.  So mlmmj works well for action required by or posts received from a TMDA user, such as this one.

BTW: would it be possible to implement nomail subscription automatically using a response to an initial post?  This would allow non-members to easily CC a list when reply-all'ing on a thread containing that list.  I saw discussion from 2004 about that, only nothing seems to have come of it.

Cheers,
Sabahattin


