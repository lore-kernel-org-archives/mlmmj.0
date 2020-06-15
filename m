From: =?utf-8?Q?Mads_Martin_J=C3=B8rgensen?= <mmj@mmj.dk>
Date: Mon, 15 Jun 2020 06:45:13 +0000
Subject: Re: [mlmmj] access::Deny seems to have stopped working ?
Message-Id: <4DBA5064-CBEF-409F-80A9-362CCD34A691@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <rc5bj1$gl8$1@saturn.local.net>
In-Reply-To: <rc5bj1$gl8$1@saturn.local.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Have you checked the source of mails going through that it actually matches?

Maybe with. Hex editor. 

> On 14 Jun 2020, at 16.19, Per Jessen <per@opensuse.org> wrote:
> 
> ﻿For years we have had a standard set of access rules, the previous list
> manager at openSUSE set them up.  Somehow those rules seems to have
> stopped working - example:
> 
> deny ^Content-Type:.*image/png
> 
> simply does not deny a mail with a png attached.  I was just wondering
> if anybody else had observed this? 
> 
> We're on mlmmj 1.2.19. 
> 
> 
> thanks
> Per
> 
> -- 
> Per Jessen, Zürich (18.2°C)
> Member, openSUSE Heroes
> 
> 
> 

