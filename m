From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 15 Apr 2010 16:49:49 +0000
Subject: Re: [mlmmj] More Nits
Message-Id: <20100415164949.GB61207@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4917C91D-7A19-4BF2-A179-E3061BC3524E@sabahattin-gucukoglu.com>
In-Reply-To: <4917C91D-7A19-4BF2-A179-E3061BC3524E@sabahattin-gucukoglu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Chris Webb <chris@arachsys.com> [Apr 15. 2010 11:52]:
> > BTW: Will there ever be a transition period to mlmmj-receive?  Yes, I know. :-)
> 
> You could use the following patch which corrects the two systematic
> spelling errors globally throughout the code. [Patch in git format
> because of the file renames.]

Could we please install both binaries, so that we won't get something
breaking on upgrade. That's the reason I haven't done this back in 0.7.
If someone takes care of that, I might even submit a patch to print a
big fat warning all over saying that mlmmj-recieve has been invoked the
old and deprecated way, which will go away in future versions.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.

