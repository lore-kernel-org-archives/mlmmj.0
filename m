From: theo borm <theo_mlmmj@borm.org>
Date: Fri, 11 May 2012 11:41:27 +0000
Subject: [mlmmj] mlmmj and spf
Message-Id: <4FACFAE7.60904@borm.org>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Dear list members,

We operate a small, closed, moderated mailing list that recently stopped 
working for a large part of its subscribers. The organization of which 
these subscribers are a member maintains an SPF record which denies 
access to all servers except a named few, which seems to be the cause of 
these problems.

As a work-around I set mlmmj to use a different from address in the 
"From:" header. This solution is, however, plainly bad as it removes the 
original sender from the headers. I have seen other lists use "Sender:" 
header, but results are a mixed bag. With strict SPF checking of the 
"From:" header in place these mails also don't pass.

What would be the correct solution?

any help, pointers greatly appreciated.

regards, Theo



