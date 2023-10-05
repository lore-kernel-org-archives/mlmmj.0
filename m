From: Baptiste Daroussin <bapt@nours.eu>
Date: Thu, 05 Oct 2023 13:51:59 +0000
Subject: Re: [mlmmj] RFE: improving access rejection messages
Message-Id: <7ffoiewbvfs7jstloajinn7vbnze67vf2mntknu2v5tpz7hdgu@oqfirw2oqy4j>
List-Id: <mlmmj.mlmmj.org>
References: <20231004-unsnap-cofounder-ed17ed@meerkat>
In-Reply-To: <20231004-unsnap-cofounder-ed17ed@meerkat>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Thu, Oct 05, 2023 at 09:30:18AM -0400, Konstantin Ryabitsev wrote:
> On Thu, Oct 05, 2023 at 07:50:21AM +0200, Baptiste Daroussin wrote:
> > >One of the problems I'm having is not being able to tell submitters ex=
actly
> > >why their message was denied. For example, I may have the following ru=
les in
> > >my access file:
> > >
> > >    deny ^Content-Type: text/html
> > >    deny ^Authentication-Results:.*dmarc=FAil
> > >    deny ^Subject:.*forbidden-topic
> > >
> > >Currently, there is only one message generated on deny, and I have to =
include
> > >all possible reasons why didn't allow the message through. This can be=
 greatly
> > >improved if we can tell the user exactly why their message was rejecte=
d,
> > >instead of making them guess.
> > >
> > >I propose extending the functionality to additionally include the reas=
on that
> > >can point at a different file, e.g.:
> > >
> > >    deny-html  ^Content-Type: text/html
> > >    deny-dmarc ^Authentication-Results:.*dmarc=FAil
> > >    deny-topic ^Subject:.*forbidden-topic
> > >
> > >The dash-extension is used to identify the listtext to use, if present=
. For
> > >example, if "deny-html" is triggered, the rejection message is loaded =
from
> > >listtexts/deny-post-access-html. If "deny-dmarc" then from
> > >deny-post-access-dmarc. If there is no matching file present, the usual
> > >fallback path is followed (deny-post-access, then deny-post).
> >=20
> > I do like the idea, do you plan to provide a patch?
>=20
> I'm no good at writing C, so I am not comfortable producing a patch.

That is not a problem, I will append this to my todo list
>=20
> > Otherwise please fill an issue with the proposal on codeberg so I keep =
track
> > of the idea.
>=20
> Will do. Is that the recommended way for development discussions? I wasn't
> sure if the list should be used for that, or if it is only for user suppo=
rt.
>=20

The list is an excellent place to discuss this and the issue are a good pla=
ce to
store the information once it has been discussed, so it is easy for me or a=
nyone
to find it and actually write the patch.

Best regards,
Bapt

