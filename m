From: Jakob Hirsch <jh@plonk.de>
Date: Wed, 16 Mar 2005 11:55:18 +0000
Subject: Re: exim4
Message-Id: <42381EA6.3000208@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <4232593D.2000404@plonk.de>
In-Reply-To: <4232593D.2000404@plonk.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Morten K. Poulsen wrote:

>>Sounds sensible, but mlmmj uses execvp, which uses PATH itself, so why should
>>you have to parse that yourself?
> It only uses $PATH if the given argument does not contain a slash. We might as
> well use execl() instead of execlp(). I may patch that.

Oh, I thought you used execlp() by intention.

>>Another possibility would be to use a hard coded path from configure or some
>>header file.
> Configure it at build time? Yikes.

Why not? Most poeple use make install and never move around any binaries.

>>mlmmj uses no config file, so what's the use? Having different versions of
>>mlmmj running? That should be done with configure's --program-suffix.
>>Otherwise you end up having a directory for every mlmmj installation.
> Exactly! I want to use two different versions of mlmmj for the same list, when
> testing a new patch. One set of binaries in one directory, the other set in
> another directory, and two different aliases. Therefore I _need_ the full path,
> and it can not be in the configuration file, as the two versions share it.

You mean configuration of a particular mailing list? I agree that 
putting the binaries' path there is senseless.
But what about using --program-suffix? I always thought that's the 
perfect way to have multiple versions of the same software on your system.

Anyway, I think I will code myself a shell script to have something like 
a frontend to the usual functions (sub, unsub, list). That also saves me 
from entering the mlmmj spool directory every time :)

Another possibility would be to use default values for these things 
(taken at configure time). Would you accept a patch for that?


