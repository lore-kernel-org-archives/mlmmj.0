From: 
Date: Tue, 15 Nov 2005 21:00:46 +0000
Subject: Re: case sensitivity of email addresses
Message-Id: <8511b92f0511151300u7799eb13o@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <200511150837.22197.neale@woozle.org>
In-Reply-To: <200511150837.22197.neale@woozle.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

2005/11/15, Neale Pickett:

> What would people think about making the email address check case-insensitive?
> Right now I have people sending from case-insensitive mail clients, wondering
> why their posts are bouncing.

FWIW, this is what RFC2821 says about:

   The local-part of a mailbox MUST BE treated as case sensitive.  Therefore,
   SMTP implementations MUST take care to preserve the case of mailbox
   local-parts.  Mailbox domains are not case sensitive.  In
particular, for some
   hosts the user "smith" is different from the user "Smith". 
However, exploiting
   the case sensitivity of mailbox local-parts impedes interoperability and is
   discouraged.


--
It is impossible to make anything foolproof, because fools are so ingenious.
- Roger Berg
