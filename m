From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 26 Jan 2005 18:11:48 +0000
Subject: mlmmj-1.2.1 released
Message-Id: <20050126181148.GA64790@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hey all,

This release adds switches to control the mails sent out by mlmmj when
it's denying posts for some reason. And a FreeBSD-4 compile fix.

ChangeLog:

1.2.1
 o Introduce switches to turn off mails about posts being denied.

And the relevant stuff from TUNABLES:

 =B7 notoccdenymails              (boolean)
 =B7 noaccessdenymails            (boolean)
 =B7 nosubonlydenymails           (boolean)

   These switches turns off whether mlmmj sends out notification about
   postings being denied due to the listaddress not being in To: or Cc:
   (see 'tocc'), when it was rejected due to an access rule (see
   'access') or whether it's a subscribers only posting list (see
   'subonlypost').

--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
