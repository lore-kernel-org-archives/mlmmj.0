From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Tue, 04 Mar 2008 15:31:13 +0000
Subject: Re: Problems with modnonsubposts
Message-Id: <1204644673.6644.10.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <47CC730A.7070407@indato.ch>
In-Reply-To: <47CC730A.7070407@indato.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hi Daniel,

On Mon, 2008-03-03 at 22:52 +0100, Daniel K=C3=BChni wrote:
> Apparently I have a strange wish for some special list I want to create.
>=20
> I want:
> - no option for subscription or unsubscription to the list - a closed list
> - a message from a subscriber should be delivered to the list=20
> subscribers without any intervention
> - a message from a non-subscriber should be moderated by a moderator

That is not too strange.

> With this in mind, I have done the following:
>=20
> -rw-r--r-- 1 nobody mlmmj   0 Feb 22 16:41 closedlist

Fine. This functionality is separate from the moderation logic.

> -rw-r--r-- 1 nobody mlmmj   0 Feb 22 16:55 modnonsubposts
...
> -rw-r--r-- 1 nobody mlmmj   0 Mar  3 22:29 subonlypost

That should be fine.

In pseudocode, that part of mlmmj looks like this:

if (subonlypost && !user_is_subscribed) {
  if (modnonsubposts) {
    MODERATE;
  } else if (!nosubonlydenymails) {
    DENY;
  } else {
    IGNORE;
} else {
  ALLOW;
}

So with subonlypost and modnonsubposts set, this should be what you
want, right?

> But this does not work as I wanted to. Now non-subscribers get a message =

> back telling them that they are not subscribed and its a closed list.

Is that the subonlypost message?

> When I'm adding the "moderated" flag, every message gets moderated, even =

> the ones from the subscribers.

Yes.

> When I delete the "subonlypost" everyone can send a message regardless=20
> of their subscription status.

Yes.

> Is there any running configration around that would meet my requirements?

As far as I can see, your configuration is correct. Which version of
mlmmj are you running? Not that I can remember any bugs in this part of
the code.

Best regards,
Morten

