From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 10 Jun 2004 18:11:25 +0000
Subject: 0.7.1 [Was Re: mlmmj-0.7.0 aka. The Ultimate Bouncer]
Message-Id: <20040610181125.GC20225@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Mads Martin Joergensen <mmj@mmj.dk> [Jun 09. 2004 16:45]:
> 0.7.0
>  o Add a macro to make sure mlmmj binaries are invoked with full path
>  o Add the function to mlmmj-maintd to unsubscribe people who've been bouncing
>    for BOUNCELIFE (default 432000 sec, 5 days) time. This completes
>    the bouncehandling of mlmmj. SIC!
>  o Add logging to mlmmj-maintd. mlmmj-maintd.lastrun.log in the listdir
>    always has the log of the last run. This is work in progress.
>  o Make mlmmj-bounce capable of sending probes
>  o Include a function for easy generation of standard mail replies
> 
> As usual, any feedback would be most welcome.

Ok, as a result of a few semi-nasty bugs, I've released 0.7.1 just now:

0.7.1
 o Fix bug with .reciptto and .mailfrom getting swapped
 o Plug a few small memory leaks in mlmmj-maintd
 o Fix bug with maintenance logfile not being opened at the right spot

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
