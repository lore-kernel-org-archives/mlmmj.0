From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 09 Jun 2004 14:45:58 +0000
Subject: mlmmj-0.7.0 aka. The Ultimate Bouncer
Message-Id: <20040609144558.GA6953@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey together,

I've just released mlmmj-0.7.0. I know it's only been three days since
0.6.0, but this one needs the big version bump since we now have
completed the fully automated bouncehandling in mlmmj. Testing of
mlmmj-maintd runnning as daemon, is needed and would be highly
appreciated, but if the list is extremely important you might want to
consider running it with -F in cron as described in the README. Enjoy.

0.7.0
 o Add a macro to make sure mlmmj binaries are invoked with full path
 o Add the function to mlmmj-maintd to unsubscribe people who've been bouncing
   for BOUNCELIFE (default 432000 sec, 5 days) time. This completes
   the bouncehandling of mlmmj. SIC!
 o Add logging to mlmmj-maintd. mlmmj-maintd.lastrun.log in the listdir
   always has the log of the last run. This is work in progress.
 o Make mlmmj-bounce capable of sending probes
 o Include a function for easy generation of standard mail replies

As usual, any feedback would be most welcome.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
