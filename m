From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 11 Sep 2006 13:18:29 +0000
Subject: Re: [PATCH] chomp to remove '\r' as well
Message-Id: <20060911131829.GL1815@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20060911123559.GK1815@mmj.dk>
In-Reply-To: <20060911123559.GK1815@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Joel Aelwyn <joel@lightbearer.com> [Sep 11. 2006 15:12]:
> > Anyone object to this behaviour? Just heard on irc someone got bitten
> > by this:
> >
> > --- chomp.c     20 Feb 2006 05:00:09 -0000      1.4
> > +++ chomp.c     11 Sep 2006 12:34:28 -0000
> > @@ -38,7 +38,7 @@
> >
> >         i = strlen(str) - 1;
> >
> > -       while(str[i] = '\n') {
> > +       while(str[i] = '\n' || str[i] = '\r') {
> >                 str[i] = 0;
> >                 i--;
> >         }
> 
> As far as I recall, getting anything with \r\n as an EOL pretty much 
> grossly violates the SMTP RFCs, so I'll make two suggestions about 
> this:
> 
> 1) Limit it *strictly* to a single \r\n, not any random combination of 
> the two characters. You'll drastically reduce your chances of subtle 
> and nasty misbehaviours being introduced when (not if) some software 
> comes along and relies on things obeying the RFCs.
> 
> 2) Make it a configurable option. Call it 'broken-CRLF-support' or 
> somesuch, because it most assuredly is.
> 
> Outlook is one of the primary offenders in this arena, for what it's 
> worth; DJB had -- probably has -- a rant up about it and why qmail 
> does/did not support a similar feature (it's been years since I used 
> qmail, but the combination of the two provided no end of headaches back 
> when I had to deal with them both at my workplace... and, to a one, 
> they were caused by Outlook blatantly violating the protocol 
> specifications.

Ah, this has nothing to do with the smtp layer. SMTP always have to have
\r\n, and that's handled in send.

Problem is that when I for instance read a subscriber from a subscribers
file with the old behaviour and match

"mmj@mmj.dk" with "mmj@mmj.dk^M", they're different.

Same thing when reading control files.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
