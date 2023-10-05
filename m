From: Baptiste Daroussin <bapt@nours.eu>
Date: Thu, 05 Oct 2023 06:37:47 +0000
Subject: Re: [mlmmj] RFE: improving access rejection messages
Message-Id: <qwhqlgl2grxmcbsfvblsjz6quy3i3cizo4jxmq4gfv5cjodtoj@h2ywqognkpdl>
List-Id: <mlmmj.mlmmj.org>
References: <20231004-unsnap-cofounder-ed17ed@meerkat>
In-Reply-To: <20231004-unsnap-cofounder-ed17ed@meerkat>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Le 4 octobre 2023 23:20:39 GMT+02:00, Konstantin Ryabitsev <konstantin@linu=
xfoundation.org> a =E9crit=A0:
>Hello:
>
>One of the problems I'm having is not being able to tell submitters exactly
>why their message was denied. For example, I may have the following rules =
in
>my access file:
>
>    deny ^Content-Type: text/html
>    deny ^Authentication-Results:.*dmarc=FAil
>    deny ^Subject:.*forbidden-topic
>
>Currently, there is only one message generated on deny, and I have to incl=
ude
>all possible reasons why didn't allow the message through. This can be gre=
atly
>improved if we can tell the user exactly why their message was rejected,
>instead of making them guess.
>
>I propose extending the functionality to additionally include the reason t=
hat
>can point at a different file, e.g.:
>
>    deny-html  ^Content-Type: text/html
>    deny-dmarc ^Authentication-Results:.*dmarc=FAil
>    deny-topic ^Subject:.*forbidden-topic
>
>The dash-extension is used to identify the listtext to use, if present. For
>example, if "deny-html" is triggered, the rejection message is loaded from
>listtexts/deny-post-access-html. If "deny-dmarc" then from
>deny-post-access-dmarc. If there is no matching file present, the usual
>fallback path is followed (deny-post-access, then deny-post).
>
>Best regards,
>-K
>
>


I do like the idea, do you plan to provide a patch? Otherwise please fill a=
n issue with the proposal on codeberg so I keep track of the idea.

Best regards,
Bapt


