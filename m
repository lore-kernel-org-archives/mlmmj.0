From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sat, 29 May 2004 15:41:06 +0000
Subject: mlmmj-0.5.2
Message-Id: <20040529154106.GB36109@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hey all,

mlmmj-0.5.2 is out. Changes since 0.5.1:

 o footer and customheaders are now accessed from listdir/control/ where
   they belong
 o Discard mails that doesn't have one and only one From: address. Discard
   here means moving them to queue/discard
 o Make sure we retrieve info from all headers matching the token we want
 o Fixed error handling in mlmmj-send if we can not open subscribers.d/
 o Make mlmmj-send a lot more robust with SMTP and handle
   bounces from the relayhost.
 o Fix BUG in mlmmj-bounce still using listdir/subscribers
 o Handle subconf/unsubconf bounces
 o Begin work on mlmmj-maintd--the mlmmj maintenance daemon
 o Make help consistent and up to date with all options
 o Make mlmmj-send print the replies from the mailserver
 o Send our hostname in the HELO instead of relayhost
 o Implement requeueing mechanism to be able to resend mail when relayhost
   trouble occur

Things to look out for when upgrading from 0.5.1:

 Following directories have to be created:

  =B7 listdir/requeue/
  =B7 listdir/queue/discarded/

 The footer and customheaders file are now to be placed in the control/
 directory where they belong, so they should be moved there from listdir.

What I'm personally the most happy about is all the robustness things--it's=
 a
*lot* more robust now.

--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
