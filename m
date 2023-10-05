From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Thu, 05 Oct 2023 13:30:18 +0000
Subject: Re: [mlmmj] RFE: improving access rejection messages
Message-Id: <20231005-raging-playlist-36d872@meerkat>
List-Id: <mlmmj.mlmmj.org>
References: <20231004-unsnap-cofounder-ed17ed@meerkat>
In-Reply-To: <20231004-unsnap-cofounder-ed17ed@meerkat>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Thu, Oct 05, 2023 at 07:50:21AM +0200, Baptiste Daroussin wrote:
> >One of the problems I'm having is not being able to tell submitters exac=
tly
> >why their message was denied. For example, I may have the following rule=
s in
> >my access file:
> >
> >    deny ^Content-Type: text/html
> >    deny ^Authentication-Results:.*dmarc=FAil
> >    deny ^Subject:.*forbidden-topic
> >
> >Currently, there is only one message generated on deny, and I have to in=
clude
> >all possible reasons why didn't allow the message through. This can be g=
reatly
> >improved if we can tell the user exactly why their message was rejected,
> >instead of making them guess.
> >
> >I propose extending the functionality to additionally include the reason=
 that
> >can point at a different file, e.g.:
> >
> >    deny-html  ^Content-Type: text/html
> >    deny-dmarc ^Authentication-Results:.*dmarc=FAil
> >    deny-topic ^Subject:.*forbidden-topic
> >
> >The dash-extension is used to identify the listtext to use, if present. =
For
> >example, if "deny-html" is triggered, the rejection message is loaded fr=
om
> >listtexts/deny-post-access-html. If "deny-dmarc" then from
> >deny-post-access-dmarc. If there is no matching file present, the usual
> >fallback path is followed (deny-post-access, then deny-post).
>=20
> I do like the idea, do you plan to provide a patch?

I'm no good at writing C, so I am not comfortable producing a patch.

> Otherwise please fill an issue with the proposal on codeberg so I keep tr=
ack
> of the idea.

Will do. Is that the recommended way for development discussions? I wasn't
sure if the list should be used for that, or if it is only for user support.

-K

