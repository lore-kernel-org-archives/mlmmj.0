From: Anders Johansson <andjoh@rydsbo.net>
Date: Thu, 19 Aug 2004 19:46:02 +0000
Subject: Re: Checking envelope From for recipient delimiter
Message-Id: <200408192146.02145.andjoh@rydsbo.net>
List-Id: <mlmmj.mlmmj.org>
References: <20040819121309.GK70901@panther.mmj.dk>
In-Reply-To: <20040819121309.GK70901@panther.mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thursday 19 August 2004 21:21, Mads Martin Joergensen wrote:
> So what do you suggest to use as the most reliable way of getting the
> RCPT TO: out of a mail, when the To: in the body cannot be used?

I don't think there is a standard for it. Both postfix and qmail will add a 
"Delivered-To" header with the envelope recipient. sendmail will not, unless 
you coax it (http://www.sendmail.org/faq/section3.html#3.29). I suspect real 
cross-platform is out the window on this one, unless someone else knows 
better
