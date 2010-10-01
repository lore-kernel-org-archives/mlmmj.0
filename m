From: Thomas Goirand <thomas@goirand.fr>
Date: Fri, 01 Oct 2010 08:05:24 +0000
Subject: Re: [mlmmj] more than 100 lines for moderation
Message-Id: <4CA59644.8040106@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTimcx6HcKrOwargzPTzzYdtdNq_-6CNxHYZR1ty0@mail.gmail.com>
In-Reply-To: <AANLkTimcx6HcKrOwargzPTzzYdtdNq_-6CNxHYZR1ty0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Ben Schmidt wrote:
> On 1/10/10 12:31 AM, Florian Effenberger wrote:
>> Hi,
>>
>> 2010/9/30 Ben Schmidt<mail_ben_schmidt@yahoo.com.au>:
>>
>>> This has been implemented in version control and I've been using it for
>>> about 6 months so I am confident it is fairly solid. If you would like
>>> download the current sources and help test it, I would certainly welcome
>>> the help.
>>
>> happy to test it out, of course. Any patch available for the Ubuntu
>> 10.04 version of mlmmj?
> 
> I doubt it, Florian. The changes have got into Mlmmj's version control,
> but I don't expect they've got anywhere else yet (they haven't even made
> it into an Mlmmj release yet).

Ubuntu's package is the exact same one as we have in Debian, on which
I'm working on.

> Would you be able to download and compile it yourself? You'll need
> Mercurial and general development stuff installed (compiler, C library
> development headers, GNU autotools), but it should be pretty easy. It
> should go something like this (it will create a directory mlmmj in the
> current directory):
> 
> $ hg clone http://mlmmj.org/mlmmj
> $ cd mlmmj
> $ autoreconf -if
> $ ./configure
> $ make
> $ make install
> 
> You might need/want to give a --prefix argument to configure.

Hum... Still mercurial. If we had a Git support, I would have been able
to give instructions on how to build an experimental package with few
git and git-buildpackage commands... What? I'm being a pain to ask
AGAIN? Ok, I shut my big mouth then! :)

BTW, I would recommend against what you wrote above in an Ubuntu
environment, as deb packages are a way better than just using "make
install" blindly. Maybe best option may well be to simply create a new
.orig.tar.gz out of the cloned folder, copy the debian folder (taken
from the latest release in Debian or Ubuntu) into the cloned folder,
then do dpkg-buildpackage.

> The most likely thing to be different in your distro's Mlmmj package to
> the official sources is the mlmmj-make-ml.sh script. You might like to
> omit that from your installation.

That's one thing I always find annoying with MLMMJ. Why are all scripts
postfixed with ".sh"? Look into your distribution files, no scripts are
like that. Using just "mlmmj-make-ml" (without the ".sh") directly into
your source would be a wise change, IMHO. If you didn't know, in Debian,
we had to do that change, because having the ".sh" extension is against
the policy of Debian. What do you think?

Thomas


