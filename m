From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 11 Aug 2004 22:28:18 +0000
Subject: mlmmj-0.8.3, vacation is over
Message-Id: <20040811222818.GG83848@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey together,

I've just rolled 0.8.3.
ChangeLog has it:

--- ChangeLog   3 Jul 2004 12:29:24 -0000
+++ ChangeLog   11 Aug 2004 22:09:22 -0000
@@ -1,3 +1,14 @@
+0.8.3
+ o Have mlmmj-make-ml.sh remind people about using cron if they want
+ o Replying to the confirmation address is enough to sub/unsub, no matter what
+   address is used the second time
+ o Fix possible DoS wrt. unsubscribing. Thank you Erik Toubro Nielsen
+ o Add 'notifysub' functionality to have owner know when people sub/unsub.
+   Thank you Kenneth Vestergaard Schmidt
+ o Use Return-Path: for envelope From. Thanks Anders Johansson
+ o Specification of which relayhost to use can now be done in control/relayhost
+ o Add configure check to link against libnsl if needed.
+ o Implement our own daemon() function since we don't have daemon() on Solaris

It's important that you all update your listdir/text. The 2 new files
are notifysub and notifyunsub.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
