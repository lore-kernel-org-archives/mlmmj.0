From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Wed, 06 Sep 2006 21:42:10 +0000
Subject: Re: mlmmj-1.2.12-RC1 released
Message-Id: <44bd91d66c5719013c8dc18bb266ac88@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <34f6b3c998e8d4bb4bd464d07c87532c@mail.n0rd.dk>
In-Reply-To: <34f6b3c998e8d4bb4bd464d07c87532c@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Jakob,

On Wed, 06 Sep 2006 21:42:02 +0200, Jakob Hirsch <jh@plonk.de> wrote:
> Quoting Morten K. Poulsen:
>> I do not like the idea of having MIME parsing in the list manager
>> itself. Or any kind of mail body parsing, for that matter.
> 
> Um, we had this discussion on this list about 9 months ago. Mads
> promised to include this in 1.2.10-RC1...

Yes, I see. But he didn't keep that promise.

> The mime parsing it does is quite simple, if it even can be called
> "parsing", since all we do is taking the mime headers and the body and
> put it into a new mime envelope, which is, again, quite simple.
> 
> Most of the patch is simplyfing the "voodoo" and making it less ugly,
> which I felt should be done because it got even more ugly with the mime
> stuff in it. This should be done even without the mime stuff.

I still do not like the idea of having MIME parsing in the list manager, but I will have another look at the patch after the release of mlmmj-1.2.12.

> PS: For some strange reason, I cannot mail you directly. My MTA times
> out after send its EHLO, but your SMTP greeting comes fast when I telnet
> the smtp port of mail.n0rd.dk, so the connection seems to be ok.

worksforme

Connected to panodil.n0rd.dk.
Escape character is '^]'.
220 panodil.n0rd.dk ESMTP Postfix
EHLO example.org
250-panodil.n0rd.dk
250-PIPELINING
250-SIZE 10240000
250-VRFY
250-ETRN
250-STARTTLS
250-AUTH LOGIN PLAIN
250-AUTH=LOGIN PLAIN
250-ENHANCEDSTATUSCODES
250-8BITMIME
250 DSN
QUIT
221 2.0.0 Bye
Connection closed by foreign host.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

