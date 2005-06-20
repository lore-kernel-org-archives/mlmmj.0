From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 20 Jun 2005 14:01:02 +0000
Subject: mlmmj-1.2.8 released
Message-Id: <20050620140102.GA27543@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey people,

After some debugging with Christian Laursen who spotted two closedir()
calls that weren't supposed to be there, I've wrapped up 1.2.8. The
ChangeLog has it as usual:

 o Don't closedir() before done (GOOD spotting Christian Laursen)
 o Make sure the resend of queue files will not loop indefinately
 o Make Date: header RFC2822 compliant (Jakob Hirsch)
 o Add -s switch to mlmmj-{,un}sub to control whether or not to send a mail
   telling about already subscribed, or not subscribed when trying to
   subscribe or unsubscribe (Christian Laursen)

Enjoy, and feedback are as usual always welcome.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
