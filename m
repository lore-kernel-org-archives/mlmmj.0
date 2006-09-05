From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Tue, 05 Sep 2006 17:02:23 +0000
Subject: Re: mlmmj-1.2.12-RC1 released
Message-Id: <4b6e7a4eb3150fc8d5848352ce221d31@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <34f6b3c998e8d4bb4bd464d07c87532c@mail.n0rd.dk>
In-Reply-To: <34f6b3c998e8d4bb4bd464d07c87532c@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Jakob,

On Mon, 04 Sep 2006 23:02:01 +0200, Jakob Hirsch <jh@plonk.de> wrote:
>> There has been a lot of bug fixes and enhancements since mlmmj-1.2.11.
>> All of
> 
> Nice, thanks.

I haven't done all the programming, I just released the work :)

>> If your patch is not included, please re-send it.
> 
> updated for this version:
> http://plonk.de/sw/mlmmj/mlmmj-1.2.12-RC1.mime1.patch

I do not like the idea of having MIME parsing in the list manager itself. Or any kind of mail body parsing, for that matter.

A much better solution would be to have it in a "wrapper" program. I would be happy to put such a program in the contrib directory of the distribution.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

