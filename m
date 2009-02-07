From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sat, 07 Feb 2009 10:46:20 +0000
Subject: Re: Web based moderation system for MLMMJ
Message-Id: <20090207104620.GJ4240@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <498C406B.9070200@goirand.fr>
In-Reply-To: <498C406B.9070200@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Thomas Goirand <thomas@goirand.fr> [Feb 07. 2009 10:17]:
> Just one thing: what is in execlp() that is not in the system exec()
> function?

Have a look at exec(3):

DESCRIPTION
   The  exec()  family  of functions replaces the current process
   image with a new process image.  The functions described in this
   manual page are front-ends for execve(2).  (See the manual page
   for execve(2) for further details about the replacement of the
   current process image.)

There actually exist no exec() call. You might be thinking of system()?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
