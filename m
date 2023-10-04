From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Wed, 04 Oct 2023 21:20:39 +0000
Subject: [mlmmj] RFE: improving access rejection messages
Message-Id: <20231004-unsnap-cofounder-ed17ed@meerkat>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hello:

One of the problems I'm having is not being able to tell submitters exactly
why their message was denied. For example, I may have the following rules in
my access file:

    deny ^Content-Type: text/html
    deny ^Authentication-Results:.*dmarc=FAil
    deny ^Subject:.*forbidden-topic

Currently, there is only one message generated on deny, and I have to inclu=
de
all possible reasons why didn't allow the message through. This can be grea=
tly
improved if we can tell the user exactly why their message was rejected,
instead of making them guess.

I propose extending the functionality to additionally include the reason th=
at
can point at a different file, e.g.:

    deny-html  ^Content-Type: text/html
    deny-dmarc ^Authentication-Results:.*dmarc=FAil
    deny-topic ^Subject:.*forbidden-topic

The dash-extension is used to identify the listtext to use, if present. For
example, if "deny-html" is triggered, the rejection message is loaded from
listtexts/deny-post-access-html. If "deny-dmarc" then from
deny-post-access-dmarc. If there is no matching file present, the usual
fallback path is followed (deny-post-access, then deny-post).

Best regards,
-K

