From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 05 Sep 2006 00:05:30 +0000
Subject: Re: Feature request: Checking and limiting mail size
Message-Id: <20060905000530.GK84492@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Christoph Wilke <chris@filmkreis.tu-darmstadt.de> [Jun 13. 2006 17:23]:
> Hej!

Davs :-)

> I implemented an mechanism for checking the size of all
> incoming mails. If the size exceeds a given value, the
> mail will discarded or rejected (depends on configuration).
> 
> The feature can be controlled in the usual way, creating
> files or changing the values they contain, in the listdir's
> control directory.
> 
> The size is set by a file called 'maxmailsize'. It contains
> the maximum allowed value in bytes. If it doesn't exist,
> no checks will be made. If the file 'nomaxmailsizedenymails'
> exists, no reject notification will be sent.
> 
> I appended these two "variables" to the TUNABLES and wrote
> a german and englich listtext.

The fact that I postponed this and forgot about it, is exactly why I've
handed over mlmmj maintainership ...

* Daniel Walrond <daniel@walrond.co.uk> [Sep 05. 2006 00:48]:
> Are you planning on incorporating the max mail size feature into mlmmj?
> It would be a very feature to have. I've noticed that Christoph Wilke
> published a patch on Jun 13 2006 is it wise to use that patch?

... let's let the new maintainer decide. After all--it's his project
now.

Thanks for the patch, and especially thanks for reminding me/us!

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
