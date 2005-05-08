From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sun, 08 May 2005 18:26:45 +0000
Subject: 1.2.6 released. No more queue littering ...
Message-Id: <20050508182645.GF87309@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey people,

So ... as usual Andrea Barisani have found a couple of bugs, which we've
fixed. This time the most annoying one was mlmmj littering files in
LISTDIR/queue/, in case of odd mails that were to be ignored. So after
you upgraded to 1.2.6 you should clean up your queue directories for old
crap--if any.

There's also a couple of nice patches from Jakob Hirsch, so now mlmmj
will tell you if you're trying to subscribe an already subscribed
address or trying to unsub without being subbed.

The ChangeLog has it as usual:

1.2.6
 o If prefix but no Subject: header is present, add one (Jakob Hirsch)
 o Add notification mail when subbed people try to sub (Jakob Hirsch)
 o Install SIGTERM handler in mlmmj-send to allow it to shut down
   gracefully
 o Also remove mails when it's a bounce from a person not subbed
 o Introduce read() wrapper (Stevens)
 o Bouncing confirmation mails of sub or unsub should be cleaned from
   the queue as well
 o Normally mails which doesn't have exactly one From: emailaddress are
   discarded but certain ISPs have bounce mails with no From: header,
   forcing us to allow bounce mails with no From: to make sure they're
   caught
 o In case of a succesful DSN parse, we werent deleting the mail, and
   thus littering the queue
 o When sending moderated mails, rename them so that they wont be
   moderated again while sending

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
