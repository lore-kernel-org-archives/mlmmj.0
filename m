From: Christopher Mahmood <ckm@loafer.org>
Date: Wed, 01 Sep 2004 17:49:44 +0000
Subject: Re: digest separation
Message-Id: <20040901174944.GA29757@oogabooga.loafer.org>
List-Id: <mlmmj.mlmmj.org>
References: <20040901093648.GA68374@panther.mmj.dk>
In-Reply-To: <20040901093648.GA68374@panther.mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Mads Martin Joergensen (mmj@mmj.dk) [040901 07:36]:
> * Morten K. Poulsen <mopo@mopo.tv2.local> [Sep 01. 2004 16:31]:
> > > What seperates every mail in a digest of several mails?
> > 
> > I think the correct (as in RFC 2046) way to do it is to make the digest
> > mail a multipart/digest, and have each mail be a part with content type
> > message/rfc822.
> 
> Ok. Have an example of how such an RFC conformant thing actually looks?

That's what the SuSE lists are doing.  E.g.,
        echo|mail suse-linux-e-get.205600_205687@suse.com

It's basically just a multipart message with the first part
containing the index of the messages and then a part for each
message with a content-type of 'message/rfc822' and a unique
filename for each.  These are nice because it's easy to split into a
mailbox with formail although ezmlm+idx offers the choice between
this and a single 822 message.

-- 

-ckm
