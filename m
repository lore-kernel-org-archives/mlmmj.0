From: Thomas Goirand <thomas@goirand.fr>
Date: Sat, 30 Aug 2008 19:34:30 +0000
Subject: Re: Russian translations for mlmmj
Message-Id: <48B9A0C6.6010808@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <1200309131.6509.12.camel@mopo-laptop>
In-Reply-To: <1200309131.6509.12.camel@mopo-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Nikolay Derkach wrote:
> cat file | uni2ascii -a U > file.ascii
> 
> uni2ascii can be found at http://billposer.org/Software/uni2ascii.html

What's the advantage of uni2ascii compared to iconv that is a standard
tool shipped with all libc6 setup?

> PS: In my opinion, localizations in ascii is a nonsense, really it's a
> step back.

Every software should use gettext(), that's for sure!

Thomas

