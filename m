From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Wed, 07 Oct 2015 16:27:51 +0000
Subject: Re: [mlmmj] address duplication in subscribers list
Message-Id: <56154807.6020808@coredump.us>
List-Id: <mlmmj.mlmmj.org>
References: <56124C29.3080502@firstweb.fr>
In-Reply-To: <56124C29.3080502@firstweb.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Marc Delpont:
> A. Schulze  :
>>
>> using the latest package from $os-vendor does not mean using the current
>> version:
>>
>> http://mlmmj.org/hg/mlmmj/file/RELEASE_1_2_19_0/ChangeLog#l11
>>
>> Andreas
>>
> 
> Thanks for this precision !
> 
> I was just pointing out that the penultimate revision of the last version
> can't seriously be considered as an "old" version.

That depends on your point of view.  Your report was "hey this is broken",
but it's been fixed "upstream" more than a year ago and Debian *Oldstable*
(Wheezy) version doesn't have the fix.  From that point of view, Debian
Oldstable's version is old.  Debian Stable (Jessie), Testing (Stretch) and
Unstable (Sid) all have mlmmj 1.2.8.1-1 which should have the fix.

It is possible to fix in Debian Stable and Oldstable, but the rules for
those releases is that they can only get *important* fixes, not new
versions... so to fix this someone would need to come up with the minimal
patch required to fix the bug and submit it to a bug report.  Then the
maintainer could upload that fix as "mlmmj-1.2.8-1+deb8u1" to a
pending-proposed-updates repository, which will then get incorporated into
the distribution on the next "point release" of that distribution.  (Usually
every 3 months or so.)  I don't think this particular bug would be
considered worth going through all this.

The easiest way around all this would be to backport the package for Wheezy
and put it into an external repository.  I just did this (because I'm
likewise running mlmmj on Wheezy), so if you want it, it's available here:

   http://debian-packages.coredump.us

direct link if you just want the .deb files than to add the repo:

   http://debian-packages.coredump.us/debian/pool/main/m/mlmmj/

  -- Chris

-- 
Chris Knadle
Chris.Knadle@coredump.us

