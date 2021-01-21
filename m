From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Thu, 21 Jan 2021 10:35:05 +0000
Subject: [mlmmj] distribution "dead upstream" discussion
Message-Id: <b6763fd2-a7ca-1c16-b304-43d1ce0b09da@coredump.us>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Today I was contacted and asked about the status of mlmmj upstream because from 
the point of view of the outside world it looks dead; the mailing list archive 
stopped working in Dec 2017, there's no new commits to the Mercurial or Git 
repositories since 2017, and thus no indication that MLMMJ is "alive".

I happen to be on the mlmmj "discussion" mailing list because I maintain the 
'mlmmj' package in Debian, so I took the time to read through the "Is this list 
active? Where is "upstream"??" and similar threads, and I see that there's a Git 
repo fork at  https://gitlab.com/mlmmj/mlmmj and had a look at it ... but nobody 
from the outside world can see that this exists, because that repo is not 
mentioned on the website nor the mailing list archives.

 From the distribution point of view this appears to be "dead upstream" and is a 
reason for package removal. Debian is about to do a "soft freeze" for 
preparation for the next release whereby packages in the archive will need bug 
support for 3 years.

The main thing I want to know is "what should I do about the release?"
I'm considering the following choices:
   a) release 'mlmmj' as before, with myself as maintainer of the package.
   b) orphan the package so that there is no listed maintainer, where the package
      might be released with Debian 11 or might get dropped, depending on what
      the Release Team decides about the package themselves
   c) request removal of the package from the archive

Choice "a)" only fits if someone in "upstream" is willing to try to fix bugs 
that get reported. Are there others helping with this at present?
Right now I'm uncomfortable about this because the GitLab repo can't be found 
from the mlmmj.org web page, and that repo seems to be where bugs are reported 
and handled lately, as best I can tell. Is that correct?

Side note: In terms of chances of bugs needing upstream help, looking at the 
Debian "popularity contest" figures I see that the number of users reporting 
having mlmmj loaded is low but slowly going /up/, which is good but not what I 
expected to see. (Note: these "popcon" numbers are likely artificially low, 
because not all machines are set to report popcon data to Debian.)

    https://qa.debian.org/popcon.php?package=mlmmj

Choice "b)" seems the most reasonable to me under the circumstances, but puts 
the package at risk of removal. This option does not preclude me from continuing 
to help fix bugs on the package as a "non-maintainer", which is what I would 
intend to do, for as long as I still use the package.

I'd like to hear other's thoughts about this so we can discuss it some.
Thanks.
    -- Chris

-- 
Chris Knadle
Chris.Knadle@coredump.us

