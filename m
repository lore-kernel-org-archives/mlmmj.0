From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 25 Nov 2004 20:37:43 +0000
Subject: mlmmj-1.1.0-RC3 is released
Message-Id: <20041125203743.GO11020@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hey all,

I've just uploaded mlmmj-1.1.0-RC3 which has a tiny feature addition,
but it was so unintrusive that it was safe enough to add since it's a
really useful feature. Say you want to moderate all html mails to a
list, you simply add this rule to DIR/control/access:

 moderate ^Content-Type: text/html

It's especially useful for moderated lists who wants to allow e.g.
posting with a password in the headers directly without the moderation
run.

I would also like to urge people who have some additions or pending
things for 1.1.0 to please try and get it done soon, so we can get this
1.1.0 out the door.

ChangeLog:

1.1.0-RC3
 o Add 'moderate' tag for usage in control/access when one wants to have the
   moderators moderate posts hitting this regexp. See README.access
 o Add a To: header with the recipient's address when sending digests

--=20
Mads Martin Joergensen, http://mmj.dk                           B=C5K!
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
