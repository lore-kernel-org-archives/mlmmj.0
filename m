From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 17 Sep 2007 19:21:38 +0000
Subject: Re: Having individual receiver in To: field
Message-Id: <20070917192138.GB42438@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <1557ec740709171048y2b7c2e08g5c9fbfe40196087a@mail.gmail.com>
In-Reply-To: <1557ec740709171048y2b7c2e08g5c9fbfe40196087a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Christian Laursen <xi@borderworlds.dk> [Sep 17. 2007 21:03]:
> > > That's not really how mail lists are supposed to work.  I don't think
> > > mlmmj has a way to set this up.  Why do you want such a thing?
> >
> > Holy cow, I stand corrected, the "addtohdr" tunable does this.
> >
> > Why would anybody want such a thing?
> 
> It makes sense for newsletters and announce lists and that sort of
> thing.

Indeed it does. One of the reasons Morten started being interested in
mlmmj to begin with, was for newsletter sending. And I actually like it,
allthough I agree with Neale it's not actually mailinglist domain.

One should however be aware that with To: header added, there's no way
to use VERP, since the body of each mail have to be different.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
