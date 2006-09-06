From: Jakob Hirsch <jh@plonk.de>
Date: Wed, 06 Sep 2006 19:42:02 +0000
Subject: Re: mlmmj-1.2.12-RC1 released
Message-Id: <44FF248A.9020906@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <34f6b3c998e8d4bb4bd464d07c87532c@mail.n0rd.dk>
In-Reply-To: <34f6b3c998e8d4bb4bd464d07c87532c@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Quoting Morten K. Poulsen:

>>> There has been a lot of bug fixes and enhancements since
>>> mlmmj-1.2.11. All of
>> Nice, thanks.
> I haven't done all the programming, I just released the work :)

Well, the programming is the fun part...

>>> If your patch is not included, please re-send it.
>> updated for this version: 
>> http://plonk.de/sw/mlmmj/mlmmj-1.2.12-RC1.mime1.patch
> I do not like the idea of having MIME parsing in the list manager
> itself. Or any kind of mail body parsing, for that matter.

Um, we had this discussion on this list about 9 months ago. Mads
promised to include this in 1.2.10-RC1...

The mime parsing it does is quite simple, if it even can be called
"parsing", since all we do is taking the mime headers and the body and
put it into a new mime envelope, which is, again, quite simple.

Most of the patch is simplyfing the "voodoo" and making it less ugly,
which I felt should be done because it got even more ugly with the mime
stuff in it. This should be done even without the mime stuff.




PS: For some strange reason, I cannot mail you directly. My MTA times
out after send its EHLO, but your SMTP greeting comes fast when I telnet
the smtp port of mail.n0rd.dk, so the connection seems to be ok.

