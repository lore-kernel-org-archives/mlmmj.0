From: Charlie Brady <charlieb@budge.apana.org.au>
Date: Mon, 16 Jan 2006 00:09:41 +0000
Subject: mlmmj-recieve delivery problem with qmail (Re: Is anyone using mlmmj
Message-Id: <Pine.LNX.4.61.0601151828420.2500@e-smith.charlieb.ott.istop.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Thu, 12 Jan 2006, Thomas Goirand wrote:

> As said before I AM using qmail and MLMMJ, and our control panel supports 
> BOTH qmail and postfix, I'd like to have MLMMJ work also with qmail. IT IS 
> supposed to work, I CAN SEE IN THE LOGS that it's delivering, but in fact IT 
> DOESN'T currently seemsly because of a right problem.

You haven't said what makes you think the non-delivery is due to a rights 
problem.

I suspect there is another issue.

As you can see here, there are conditions where mlmmj-recieve silently 
discards mail:

...
fsync(3)                                = 0
close(4)                                = 0
close(3)                                = 0
open("/home/e-smith/mlmmj/moodindigo_ca/mlmmjtest/control/delimiter", 
O_RDONLY) = 3
read(3, "-", 1)                         = 1
read(3, "\n", 1)                        = 1
close(3)                                = 0
rename("/home/e-smith/mlmmj/moodindigo_ca/mlmmjtest/incoming/50ebc23ac0f3f2b", 
"/home/e-smith/mlmmj/moodindigo_ca/mlmmjtest/queue/discarded/6217ce613db38efa") = 0
unlink("/home/e-smith/mlmmj/moodindigo_ca/mlmmjtest/queue/6217ce613db38efa") = 0
_exit(0)                                = ?
...

I suspect the code which does that is here:

...
         /* discard malformed mail with invalid From: */
         if(fromemails.emailcount != 1) {
                 discardname = concatstr(3, listdir,
                                 "/queue/discarded/", randomstr);
                 rename(mailfile, discardname);
                 unlink(donemailname);
                 myfree(donemailname);
                 myfree(discardname);
                 myfree(randomstr);
                 /* TODO: free emailstructs */
                 exit(EXIT_SUCCESS);
         }
...

The man page for mlmmj-recieve doesn't explicitly state what its full set 
of requirements is for accepting mail items, and as mentioned before, it 
doesn't log any reasons for discarding messages (which I think is a 
serious deficiency) so I haven't worked out exactly what the problem is. 
But I'm sure it has something to do with validation of the message versus 
expectations.

This message in the archives might be relevant:

http://mlmmj.mmj.dk/archive/0338.html
