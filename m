From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 16 Feb 2010 07:35:42 +0000
Subject: Re: PATCH: Memory leak appending original mail
Message-Id: <4B7A4ACE.8040607@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4B5EBDA6.7070501@yahoo.com.au>
In-Reply-To: <4B5EBDA6.7070501@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> I looked at the code, and got thinking. Since the loop is only entered
> if str is not NULL, and str is only used inside the loop, couldn't we
> just free str inside the loop?
>
> Proposed patch attached.

Yeah, that works! Go for it!

Ben.




