From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 16 Sep 2004 10:45:11 +0000
Subject: Re: RFE: post-only
Message-Id: <20040916104511.GD28796@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20040901122213.GD23171@mail.lieber.org>
In-Reply-To: <20040901122213.GD23171@mail.lieber.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Kurt Lieber <klieber@gentoo.org> [Sep 02. 2004 00:18]:
> > > We have a number of users who prefer to read via Gmane.  Because all our
> > > lists only allow posts from subscribers, we have a number of requests for a
> > > "post-only" feature whereby users can subsribe to a list for purposes of
> > > posting, but not actually receive any email.
> > 
> > You can add the address(s) or domains to the allow list but not
> > subscribe them.
> 
> Is it possible for a user to do this via email commands?  I'd rather not
> have to manually manage the lists manually.

With current CVS it's possible to do this:

 echo | mail listname+subscribe-nomail@domail.tld

and then one's subscribed to the list, but not getting any mail.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
