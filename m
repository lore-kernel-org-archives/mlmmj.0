From: Geert Stappers <stappers@stappers.nl>
Date: Thu, 21 Jan 2021 21:59:50 +0000
Subject: Re: [mlmmj] distribution "dead upstream" discussion
Message-Id: <20210121215950.spymd2wa6qyqi7ym@gpm.stappers.nl>
List-Id: <mlmmj.mlmmj.org>
References: <b6763fd2-a7ca-1c16-b304-43d1ce0b09da@coredump.us>
In-Reply-To: <b6763fd2-a7ca-1c16-b304-43d1ce0b09da@coredump.us>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Thu, Jan 21, 2021 at 09:43:40AM -0800, webmaster wrote:
> On 1/21/2021 2:35 AM, Chris Knadle wrote:
> > Today I was contacted and asked about the status of mlmmj upstream
> > because from the point of view of the outside world it looks dead; the
> > mailing list archive stopped working in Dec 2017, there's no new commits
> > to the Mercurial or Git repositories since 2017, and thus no indication
> > that MLMMJ is "alive".

Fact

=20
> > I happen to be on the mlmmj "discussion" mailing list because I maintain
> > the 'mlmmj' package in Debian, so I took the time to read through the
> > "Is this list active? Where is "upstream"??" and similar threads, and I
> > see that there's a Git repo fork at https://gitlab.com/mlmmj/mlmmj and
> > had a look at it ... but nobody from the outside world can see that this
> > exists, because that repo is not mentioned on the website nor the
> > mailing list archives.
> >=20
> > From the distribution point of view this appears to be "dead upstream"
> > and is a reason for package removal. Debian is about to do a "soft
> > freeze" for preparation for the next release whereby packages in the
> > archive will need bug support for 3 years.
> >=20
> > The main thing I want to know is "what should I do about the release?"
> > I'm considering the following choices:
> > =A0 a) release 'mlmmj' as before, with myself as maintainer of the pack=
age.
> > =A0 b) orphan the package so that there is no listed maintainer, where =
the package
> > =A0=A0=A0=A0 might be released with Debian 11 or might get dropped, dep=
ending on what
> > =A0=A0=A0=A0 the Release Team decides about the package themselves
> > =A0 c) request removal of the package from the archive
> >=20
> > Choice "a)" only fits if someone in "upstream" is willing to try to fix
> > bugs that get reported. Are there others helping with this at present?

Somehow there is consensus about "Somebody ELSE  should do it"    :-/


> > Right now I'm uncomfortable about this because the GitLab repo can't be
> > found from the mlmmj.org web page, and that repo seems to be where bugs
> > are reported and handled lately, as best I can tell. Is that correct?

Yes, mlmmj.org was abandoned.  Luckly is the mailinglist still up.
So https://gitlab.com/mlmmj/mlmmj could be announced and we are
having this mailthread.


> > Side note: In terms of chances of bugs needing upstream help, looking at
> > the Debian "popularity contest" figures I see that the number of users
> > reporting having mlmmj loaded is low but slowly going /up/, which is
> > good but not what I expected to see. (Note: these "popcon" numbers are
> > likely artificially low, because not all machines are set to report
> > popcon data to Debian.)
> >=20
> > =A0=A0 https://qa.debian.org/popcon.php?package=3Dmlmmj
> >=20
> > Choice "b)" seems the most reasonable to me under the circumstances, but
> > puts the package at risk of removal. This option does not preclude me
> > from continuing to help fix bugs on the package as a "non-maintainer",
> > which is what I would intend to do, for as long as I still use the
> > package.
> >=20
> > I'd like to hear other's thoughts about this so we can discuss it some.
> > Thanks.
> > =A0=A0 -- Chris
> >=20
> I'm just a site admin who uses mlmmj on several domains, so I can't speak=
 to
> the maintenance issues but only as a user of mlmmj:
>=20
> I've recently looked at other mailing list options (again) and I still fi=
nd
> nothing with the same level of flexibility and ease of use, in terms of
> managing several lists on a domain and being able to write basic PHP to
> manage the lists per my own needs.
>=20
> Compared to Mailman... well there is no comparison - I'd rather use mlmmj
> every time.
>=20
> mlmmj can be a bit difficult to install, given the sometimes terse and
> incomplete documentation, but once it's working, it IS a joy to work with.
>=20
> I too have been concerned that it appears there's been no activity recent=
ly,
> but until it breaks or some email security paradigm shifts and makes mlmmj
> un-safe to use, I'll still be a fan, and I'll still recommend it to other=
s.=A0
> I'm not surprised to hear adoption is currently going up.
>=20
> It might get even more adoption if it appeared it was being maintained
> currently. I realize its easy to say this from a user perspective; I'd be
> happy to help in some way if my skill-set would be useful, but I don't ha=
ve
> a deep knowledge of email systems.
>=20
> It would be a great shame to see such a well-structured mailing list app
> fade into history.


True


> just my two cents.
>=20
> Philip
>=20


My thoughts about this:

* Discuss this further
* Scrape/Mirror/Copy the website   (to prevent making a new design)
* Transfer the domain name to community thrust
* Have somewhere webserver that can serve static webpages
* Update DNS to point to that webserver
* Update website
** mlmmj is mature
** https://gitlab.com/mlmmj/mlmmj
* Have somewhere server that can do mlmmj
* Transfer this mailinglist to that server
* Accept that mlmmj is mature software
Last, but not least
* Make contributing to this mature software possible


Regards
Geert Stappers

P.S.
Mads, what "transfer powers" do you have?
Ben, no need to explain what is keeping you busy,
please make domain transfer possible.
--=20
Silence is hard to parse

