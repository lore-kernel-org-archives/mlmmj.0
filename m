From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 25 Aug 2004 17:36:54 +0000
Subject: mlmmj-1.0.0-RC2
Message-Id: <20040825173654.GA91703@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey there,

There was a semi nasty bug in RC1 causing +owner mails not to make it to
the owner but be left in the incoming/ queue, due to a missing break; in
a switch statement. So here goes RC2:

1.0.0-RC2
 o Do not allow mails from <> going to the list
 o Fix mailing to +owner again by adding missing 'break;' to switch in
   mlmmj-send
 o perl-admin updates from Christian Laursen
 o php-user updates from Christoph Thiel
 o Use Delivered-To: instead of To: when available

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
