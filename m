From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sun, 22 Aug 2004 20:45:50 +0000
Subject: Re: Checking envelope From for recipient delimiter
Message-Id: <20040822204549.GE35434@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20040819121309.GK70901@panther.mmj.dk>
In-Reply-To: <20040819121309.GK70901@panther.mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Mads Martin Joergensen <mmj@mmj.dk> [Aug 19. 2004 21:50]:
> > On Thursday 19 August 2004 21:21, Mads Martin Joergensen wrote:
> > > So what do you suggest to use as the most reliable way of getting the
> > > RCPT TO: out of a mail, when the To: in the body cannot be used?
> > 
> > I don't think there is a standard for it. Both postfix and qmail will
> > add a "Delivered-To" header with the envelope recipient. sendmail will
> > not, unless you coax it
> > (http://www.sendmail.org/faq/section3.html#3.29). I suspect real
> > cross-platform is out the window on this one, unless someone else
> > knows better
> 
> That's what I was afraid of.

I've now made mlmmj use Delivered-To: if it's available.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
