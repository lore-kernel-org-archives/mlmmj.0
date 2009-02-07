From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sat, 07 Feb 2009 08:30:15 +0000
Subject: Re: Web based moderation system for MLMMJ
Message-Id: <20090207083015.GI4240@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <498C406B.9070200@goirand.fr>
In-Reply-To: <498C406B.9070200@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Thomas Goirand <thomas@goirand.fr> [Feb 06. 2009 14:51]:
> I have somebody that uses our open source control panel (DTC) that has
> complained that there is no moderation interface using web (and not
> using the reply thing on a moderation message). He needs it for a big
> number of high traffic lists.

It cannot at the moment, but if I know you, you'll have it able to very
soon ;-)

> So here is my question: is there a way to do such web-based moderation
> with MLMMJ? If yes how? If no, how could I write/contribute it?

Thinking really quickly about it, here's the route I would have a look
at:

  i) tunable 'cmdlinemoderation' which makes mlmmj not send mails,
     but just leave it in the directory. Maybe even put a path to a
     directory in the moderation file where mlmmj then would put the
     same files as it would in LISTDIR/moderation. That could be the
     directory where your web code would look and reflect upon
 ii) when someone in the web moderation page clicks to moderate a mail
     you would invoke the same code path from the commandline (see
     listcontrol.c) as when a mail arrives accepting a moderation. You
     might do this by just sending a mail to listname+moderate-KEY or
     what the precise address should be.

Comments from Morten, etc. wrt. security would of course be welcome :)

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
