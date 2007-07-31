From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 31 Jul 2007 16:39:29 +0000
Subject: Re: Current Etch version of MLMMJ seems to suffer from a known and corrected bug
Message-Id: <92936DC8-2F2A-41FA-9D5E-A7070DBC7A71@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <46AF59FF.5040101@goirand.fr>
In-Reply-To: <46AF59FF.5040101@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hello Thomas,

On 31/07/2007, at 17.49, Thomas Goirand wrote:

> Jul 30 22:15:58 mx /usr/bin/mlmmj-process[17885]: subscriberfuncs.c: 
> 61:
> Could not mmap fd: Invalid argument
> Jul 30 22:15:58 mx /usr/bin/mlmmj-send[17885]: getaddrsfromfd.c:27:
> Could not mmap fd: Invalid argument
> Jul 30 22:16:56 mx /usr/bin/mlmmj-bounce[18009]: subscriberfuncs.c:61:
> Could not mmap fd: Invalid argument
> Jul 30 22:17:48 mx /usr/bin/mlmmj-bounce[18124]: subscriberfuncs.c:61:
> Could not mmap fd: Invalid argument

When I started mlmmj the linux kernel didn't complain about mmap'ing  
a file with size 0. My FreeBSD box is not complaining either.

> As I saw this in the archive of the list:
>
> http://mlmmj.mmj.dk/archives/mlmmj/2006-08/0758.html
>
> with this reply:
>
> http://mlmmj.mmj.dk/archives/mlmmj/2006-08/0759.html
>
> I was wondering what you would advise to patch in the current Debian
> stable version, so we can have it patched.

What you want to do is find all the checks in the freshly released  
1.2.15 for 0-sized files (IIRC only the two places mentioned above is  
needed, but should be easy to grep for), and you add the same checks  
to the etch version.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
  and totally illogical, with just a little bit more effort?"
                                  -- A. P. J.


