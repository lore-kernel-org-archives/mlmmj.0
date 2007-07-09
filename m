From: Steve Beattie <sbeattie@suse.de>
Date: Mon, 09 Jul 2007 21:11:05 +0000
Subject: Re: [RFC] misc moderation patches
Message-Id: <20070709211105.GA5614@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="YiEDa0DAkWCtVeE4"
List-Id: <mlmmj.mlmmj.org>
References: <20070705195719.GK5523@suse.de>
In-Reply-To: <20070705195719.GK5523@suse.de>
To: mlmmj@mlmmj.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 05, 2007 at 11:13:10PM +0200, Morten K.Poulsen wrote:
> Steve Beattie <sbeattie@suse.de> wrote:
> > Here are some patches mostly related to moderating emails for
> > discussion.
>=20
> I've looked at your patches, and they look clean. I have a few
> comments. See below.
>=20
> We're in the RC-period for 1.2.15

Yes, I was aware of the RC-release which is why I was posting for
comment rather than inclusion. The patches I posted were against
1.2.15-RC1. Unfortunately, the timing failed to work out that I didn't get
to these before the RC1 release; timing's never been my strong point. :-)

> (feedback please!),

The only problems I've run into with the RC have been due to bogons
introduced by myself, but I barely scratch the surface in terms of using
the functionality of mlmmj. Others will need to comment on the current RC.

> so your patches will not be merged to CVS right now. Please remind me
> of them when 1.2.15 is out :)

Sure, will do. I've pushed a quilt series up to
http://www.nxnw.org/~steve/warez/mlmmj/ which is where I'll update the
patches to incorporate your feedback.

> > mlmmj-X-List-Administrivia_header.patch
> >=20
> > 	This patch adds two headers, an "X-List_administrivia: Yes" header
> [snip]
> > 	or it should just be added automatically in prepstdreply().
>=20
> Yes, please do that.

Fixed in the quilt series.

> > mlmmj-multiple_moderation_args.patch
> [snip]
> > 	I left the moderation of subscriptions alone.
>=20
> Could you add that as well?

Possibly. The multiple cookie parsing splits on dashes, and I figured it
would break on email addresses containing dashes as well, which is why I
avoided adding support for multiple addresses. I'm not sure how exactly
to format the reply commands in a way that will be easily parsable; ideas?

> > mlmmj-reject_command.patch
> [snip]
> > 	I didn't add support for rejecting subscriptions; that should
> > 	probably be fixed.
>=20
> Yes, please.

Okay.

> Also, please send out a reject mail. Otherwise it's a
> discard - not reject.

Doh, yes, of course. Though would a discard command be accepted as
well? The vast majority of moderation that I do is of spam rather than
content-based, where the From: address has been forged; returning a
rejected message would just add to the spam problem and not do anything
useful. But for a content moderated list, it makes sense to send out a
reject message; however, presumably in that situation a moderator would
like to be able to send a custom message to explain why the message was
rejected. Perhaps just returning the body of the moderation message to
the original sender?

> > mlmmj-add_moderator_command.patch
> [snip]
> > 	I'm not sure proper envelope filtering is done here,
> > 	though.
>=20
> Envelope filtering?

It's entirely probable I am confused. I was looking at the code in
src/mlmmj-process.c that handles the 'owner' command:

   569                          /* strip envelope from before resending */
   570                          delheaders->count =3D 0;
   571                          delheaders->strs =3D NULL;
   572                          delheaders->strs =3D myrealloc(delheaders->=
strs,
   573                                  (delheaders->count+3) * sizeof(char=
 *));
   574                          delheaders->strs[delheaders->count++] =3D
   575                                  mystrdup("From ");
   576                          delheaders->strs[delheaders->count++] =3D
   577                                  mystrdup("Return-Path:");
   578                          delheaders->strs[delheaders->count] =3D NUL=
L;

and (a) wasn't sure why this command was handled here rather than in
the listcontrol(), and (b) assumed the 'moderators' command would need
to do something similar. But SMTP envelopes are an area that I don't
quite grok, and pointers to clues are welcome.

Thanks.
--=20
Steve Beattie
SUSE Labs, Novell Inc.=20
<sbeattie@suse.de>
http://NxNW.org/~steve/

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFGkqRpquBH+DuYavMRAoIeAJ48xbFmYqwaCMtdqSi/X+hG4wpkqwCeIdKK
Vo2Ts3hpC+WB2gyePNDqgJg=
=yamu
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
