From: Matrix Quote <stappers@stappers.nl>
Date: Sat, 20 Jun 2020 21:38:45 +0000
Subject: Re: [mlmmj] Trying to use moderation, but email server is rejecting moderator's release reply to lis
Message-Id: <20200620213845.ewfneemvblmjclk4@gpm.stappers.nl>
List-Id: <mlmmj.mlmmj.org>
References: <8cd0e063-4f12-5fed-ee05-d6d1f34640fd@vlsc.org>
In-Reply-To: <8cd0e063-4f12-5fed-ee05-d6d1f34640fd@vlsc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Sat, Jun 20, 2020 at 02:10:55PM -0700, webmaster wrote:
> I've been using MLMMJ for years with several closed lists, and it works
> great! Can't say enough good things about it.
>=20
> Now I have finally reached a place where I need moderation on a list, so
> I implemented the two files [list]/control/moderated and
> [list]/control/moderators.
>=20
> Tested some email submissions, and as expected they were sent to the
> moderators for release or rejection...So far so good...
>=20
> But when I reply to the moderation notice to release the original email
> to the list, it's sent back to a pseudo-email address (the reply-to
> address) like:
>=20
> [list name]_release-59d6019902a42d96@vlsc.org
>=20
> (list name obviscated above)
>=20
> Our email server doesn't recognize this as a real email account so it's
> bouncing back my "release" response with the usual "Unknown user"
> bounce-back.
>=20
> I tried reply-all, which also included the [list]-owner@vlsc.org
> address, and the email server still bounced the reply.
>=20
> I've re-read the docs but can't find anything pointing to additional
> steps needed to get the moderation-release replies to get past my email
> server's filtering of non-existent addresses.=A0 I doubt I'm supposed to
> simply add these address accounts to the email server, not least because
> there's no nothing to that effect in the documentation.
>=20
> How is this email-reply moderation process supposed to work when sending
> pseudo-addresses to my email server, which is correctly rejecting such
> incoming mail as directed to a non-existing account?


Neo:  Why do my eyes hurt?
Morpheus:  You never used them before.

