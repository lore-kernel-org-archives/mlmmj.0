From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sun, 16 Jan 2005 19:00:09 +0000
Subject: mlmmj-1.2.0-RC1 - VERP support
Message-Id: <20050116190009.GU33603@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey together,

As mentioned before, here's the first release candidate for 1.2.0. Most
notable is a couple of locking fixes and VERP support to make
mlmmj+postfix perform as fast (sometimes faster) than qmail+ezmlm.

The ChangeLog has it (the 1.1.1 RCs were never announced):

 1.2.0-RC1
  o Add VERP support. http://www.postfix.org/VERP_README.html
    $smtpd_authorized_verp_clients should be the only one needed to touch
 1.1.1-RC2
  o It's ok to log to a symbolic link to somewhere else
  o Add Message-Id: and Date: headers to mail from mlmmj
  o Make log_oper() varargs capable (Rob Holland)
 1.1.1-RC1
  o Never discard anything from LISTDIR/queue/, let the admin be able to judge
  o Grab the lock when sending a mail to make sure noone does bad things
    to it underneath us
  o Danish listtexts, thanks Jesper Lund
  o Add control/noget to turn off listname+get-INDEX
  o Rearrange envelope from to be listname+bounces-index-user=domain.tld@ instead
    of listname+bounces-user=domain.tld-index@ to prepare for VERP support

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
