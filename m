From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 21 Feb 2005 14:25:52 +0000
Subject: Re: mlmmj-1.2.4 - small features and a valgrind round
Message-Id: <20050221142552.GC226@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20050214231903.GO59254@mmj.dk>
In-Reply-To: <20050214231903.GO59254@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Uffe Jakobsen <uffe@uffe.org> [Feb 21. 2005 15:22]:
> The "mlmmj-1.2.4.tar.gz" archive at URL 
> http://mlmmj.mmj.dk/files/mlmmj-1.2.4.tar.gz
> 
> contains a file named '\\' in the man directory - is that intentionally ?

Nope--this is me writing the mlmmj-bounce updated man-page to the wrong
file.

$ cp \\ mlmmj-bounce.1

Should be correct.

 [Not that the option described is ever meant to be invoked on the
  commandline ]

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
