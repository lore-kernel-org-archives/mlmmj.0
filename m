From: Geert Stappers <stappers@stappers.nl>
Date: Sun, 21 Jun 2020 06:30:32 +0000
Subject: Re: [mlmmj] Trying to use moderation, but email server is rejecting moderator's release reply to lis
Message-Id: <20200621063032.kn2i3wib3zsjdnds@gpm.stappers.nl>
List-Id: <mlmmj.mlmmj.org>
References: <8cd0e063-4f12-5fed-ee05-d6d1f34640fd@vlsc.org>
In-Reply-To: <8cd0e063-4f12-5fed-ee05-d6d1f34640fd@vlsc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Sat, Jun 20, 2020 at 11:18:45PM -0700, webmaster wrote:
> On 6/20/2020 2:38 PM, Matrix Quote wrote:
> > On Sat, Jun 20, 2020 at 02:10:55PM -0700, webmaster wrote:
> >> I've been using MLMMJ for years with several closed lists, and it works
> >> great! Can't say enough good things about it.
> >>
> >> Now I have finally reached a place where I need moderation on a list, =
so
> >> I implemented the two files [list]/control/moderated and
> >> [list]/control/moderators.
> >>
> >> Tested some email submissions, and as expected they were sent to the
> >> moderators for release or rejection...So far so good...
> >>
> >> But when I reply to the moderation notice to release the original email
> >> to the list, it's sent back to a pseudo-email address (the reply-to
> >> address) like:
> >>
> >> [list name]_release-59d6019902a42d96@vlsc.org
> >>
> >> (list name obviscated above)
> >>
> >> Our email server doesn't recognize this as a real email account so it's
> >> bouncing back my "release" response with the usual "Unknown user"
> >> bounce-back.
> >>
> >> I tried reply-all, which also included the [list]-owner@vlsc.org
> >> address, and the email server still bounced the reply.
> >>
> >> I've re-read the docs but can't find anything pointing to additional
> >> steps needed to get the moderation-release replies to get past my email
> >> server's filtering of non-existent addresses.=A0 I doubt I'm supposed =
to
> >> simply add these address accounts to the email server, not least becau=
se
> >> there's no nothing to that effect in the documentation.
> >>
> >> How is this email-reply moderation process supposed to work when sendi=
ng
> >> pseudo-addresses to my email server, which is correctly rejecting such
> >> incoming mail as directed to a non-existing account?
> >
> > Neo:  Why do my eyes hurt?
> > Morpheus:  You never used them before.
> >
>=20
> A pithy answer may be amusing, but it doesn't provide much to go on.
>=20
> The moderation notice email contains:
>=20
> To release it to the list, please send a message to
> <list_release-59d6019902a42d96@vlsc.org> which can usually be done simply
> by replying to this message.
>=20
>=20
> Replying to that email didn't work, so I'm simply looking for a bit of
> advice for where to start.=A0
=20
And that was recieved as "you must spoon feed me".


> For some time I've exploited the mlmmj system by writing my own code to
> help manage the tunables as well as the the other text files, which I
> know well, but up to now I've been managing relatively small lists that
> never needed moderation. So now I'm back at the beginning, looking for
> some help...not riddles.

Start with try to understand what a MTA does and how it co-operates
with mmlmj.


Groeten
Geert Stappers
--=20
Silence is hard to parse

