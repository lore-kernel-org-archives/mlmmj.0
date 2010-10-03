From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Sun, 03 Oct 2010 13:49:35 +0000
Subject: Re: [mlmmj] Is using the include path for php-admin a good idea?
Message-Id: <20101003154935.665d6176@franky>
List-Id: <mlmmj.mlmmj.org>
References: <4CA87D1F.6030009@yahoo.com.au>
In-Reply-To: <4CA87D1F.6030009@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sun, 03 Oct 2010 23:54:55 +1100
Ben Schmidt <mail_ben_schmidt@yahoo.com.au> wrote:

> Hi, everybody,
> 
> A patch was proposed to have conf/tunables.pl searched for in php's
> include path.
> 
> http://mlmmj.org/bugs/bug.php?id=4
> 
> I'm wondering on people's opinions on this. Is it a good idea?
> 
> I actually think it probably isn't. On the one hand, even though
> conf/tunables.pl is a somewhat generic name, it's a fairly unlikely
> one, so name clashes are unlikely to be a problem. On the other hand,
> though, using the include path effectively would require setting the
> include path (which is a hassle; more so than just moving the
> tunables.pl file around), or installing tunables.pl in a system-wide
> location where it is likely to be missed for upgrades and so on.
> 
> If anything, perhaps we should just move tunables.pl into the same
> directory as the PHP scripts that run the interface, dropping the
> ../conf? It will always be found then.
> 
> Thoughts?
> 
> Ben.

As a longtime php-coder, here's my opinion:
- Putting it in the include path is a bad idea
- hardcoding the path also
So best of all: figure out the current filepath, put it in a variable
and start from there (don't put this in a config file, it can be
determined automatically), something like "dirname(__FILE__);" or to
have the parent dir "basename(dirname(__FILE__));"

Franky

