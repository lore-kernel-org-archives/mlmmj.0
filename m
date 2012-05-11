From: Christian Laursen <xi@borderworlds.dk>
Date: Fri, 11 May 2012 12:43:02 +0000
Subject: Re: [mlmmj] mlmmj and spf
Message-Id: <4FAD0956.3040705@borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4FACFAE7.60904@borm.org>
In-Reply-To: <4FACFAE7.60904@borm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 05/11/12 13:41, theo borm wrote:
 >
> We operate a small, closed, moderated mailing list that recently stopped
> working for a large part of its subscribers. The organization of which
> these subscribers are a member maintains an SPF record which denies
> access to all servers except a named few, which seems to be the cause of
> these problems.

It sounds like their SPF implementation is broken.

> As a work-around I set mlmmj to use a different from address in the
> "From:" header. This solution is, however, plainly bad as it removes the
> original sender from the headers. I have seen other lists use "Sender:"
> header, but results are a mixed bag. With strict SPF checking of the
> "From:" header in place these mails also don't pass.

SPF checking should be done on the enevelope FROM address, not the From: 
header contained inside the mail.

When mlmmj send out mails to the list subscribers the envelope from 
looks something like this:
listname+bounces-XXXX-recipient=example.com@listowner.tld

So the SPF checking is done against the domain that the list is running on.

The correct cause of action would be to get the organization with broken 
SPF checking to fix that.

-- 
Christian Laursen

