From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Fri, 20 Aug 2004 19:17:21 +0000
Subject: mlmmj-1.0.0-RC1
Message-Id: <20040820191721.GJ88334@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey all,

So this is the first release candidate for mlmmj-1.0.0. Why? Because
it has all my original requirements for a 1.0.0 version and even some
more--the access control and the webinterface was not on my original
list of wanted features.

So go get all you know to give this one a spin, so we can get those
bugreports and make this piece of software as stable as the one we're
inspired of.

The ChangeLog is telling the tale of the changes since 0.8.3:

1.0.0-RC1
 o Add web-interface. Thanks Christian Laursen for new perl-admin!
 o Dump the customheaders before any Mime headers
 o Implement +get-N functionality, so it's possible to send a mail to
   foolist+get-101@domain.tld to retrieve mail 101 from that list. It's
   deliberately only possible to request one mail at a time.
 o Make sure that only either root or the listdir owner can execute the
   binaries when it has something to do with lists.
 o Don't leave bounces-help@ mails lying around in queue/
 o Remove unanchored ".*" from beginning of regexp

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
