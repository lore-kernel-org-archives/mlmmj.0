From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 25 Sep 2006 14:39:20 +0000
Subject: Re: Moderator subscription
Message-Id: <20060925143920.GJ49588@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4517E645.7090904@kite.se>
In-Reply-To: <4517E645.7090904@kite.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Magnus Naeslund(k) <mag@kite.se> [Sep 25. 2006 16:23]:
> How can a moderator subscribe a person to the list via the email 
> interface? The ezmlm way doesn't work, if i send a mail to 
> list-subscribe-email=host.com@listhost.com (yep - is the delimiter) it 
> doesn't seem to work...

Nope, that feature is not implemented in mlmmj.

> When we move to mlmmj from ezmlm we would need to handle this in some 
> way since some lists we host are all handled by the owner and moderator. 
> On these kinds of lists the subscribers themselves are often incapable 
> of using the email interface correctly themselves.

Change the From: header. mlmmj uses the From: header and not the
envelope from to determine who requests subscription.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
