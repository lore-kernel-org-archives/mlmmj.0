From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Fri, 11 May 2012 11:54:31 +0000
Subject: Re: [mlmmj] mlmmj and spf
Message-Id: <c5066cee975c83ee137869ff2f1bfead@imap.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <4FACFAE7.60904@borm.org>
In-Reply-To: <4FACFAE7.60904@borm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 2012-05-11 13:41, theo borm wrote:
> Dear list members,
>
> We operate a small, closed, moderated mailing list that recently
> stopped working for a large part of its subscribers. The organization
> of which these subscribers are a member maintains an SPF record which
> denies access to all servers except a named few, which seems to be 
> the
> cause of these problems.
>
> As a work-around I set mlmmj to use a different from address in the
> "From:" header. This solution is, however, plainly bad as it removes
> the original sender from the headers. I have seen other lists use
> "Sender:" header, but results are a mixed bag. With strict SPF
> checking of the "From:" header in place these mails also don't pass.
>
> What would be the correct solution?
>
> any help, pointers greatly appreciated.
>
> regards, Theo

You have 2 options:

- get your mailserver in the SPF records for the domains for which you 
send mail (probably not a valid option, depending on the number of 
domains and the willingness of the DNS admins for those)
- make it so that the SMTP header "mail from" is set to the original 
sender, the "From:" part is in fact only data, it is the SMTP "mail 
from" that's being checked AFAIK.

I can't check it from here, so I can't say if rewriting just the SMTP 
"mail from" is possible in mlmmj.


Franky

