From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 04 Jan 2006 19:38:53 +0000
Subject: Re: mlmlmj control files
Message-Id: <20060104193853.GC72159@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <33221.80.166.75.19.1136194203.squirrel@mail.junc.org>
In-Reply-To: <33221.80.166.75.19.1136194203.squirrel@mail.junc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Mads Martin Joergensen <mmj@mmj.dk> [Jan 04. 2006 20:30]:
> * Mads Martin Joergensen <mmj@mmj.dk> [Jan 02. 2006 17:49]:
> > Relayhost has the same problem, and I really should fix it tomorrow on
> > my last vacation day--it's a pretty ridiculous and annoying bug.
> > 
> > Problem is that in the case of administrative mails, there was no need
> > to pass a list directory to mlmmj-send, and thus does there two files
> > not get read.
> 
> So it wasn't tomorrow, but the day after tomorrow :-)
> 
> Please test--I might have forgotten a place.

> --- ChangeLog	4 Jan 2006 19:10:36 -0000	1.144
> +++ ChangeLog	4 Jan 2006 19:26:53 -0000
> @@ -1,3 +1,5 @@
> + o Make non list emails (subconf, moderation etc.) also honor relayhost
> +   and smtpport
>   o Add tunable to be able to close for subscription only (closedlistsub)
>  1.2.9
>   o Make find_email_adr() more robust (BSD, Neale Pickett)

This hunk rejects, just delete it. It's the new TUNABLE in cvs which
allows for a closed list which is only closed to subscription, not
unsubscribing.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
