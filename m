From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 30 Sep 2010 23:50:30 +0000
Subject: Re: [mlmmj] more than 100 lines for moderation
Message-Id: <4CA52246.6080507@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTimcx6HcKrOwargzPTzzYdtdNq_-6CNxHYZR1ty0@mail.gmail.com>
In-Reply-To: <AANLkTimcx6HcKrOwargzPTzzYdtdNq_-6CNxHYZR1ty0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 1/10/10 12:31 AM, Florian Effenberger wrote:
> Hi,
>
> 2010/9/30 Ben Schmidt<mail_ben_schmidt@yahoo.com.au>:
>
>> This has been implemented in version control and I've been using it for
>> about 6 months so I am confident it is fairly solid. If you would like
>> download the current sources and help test it, I would certainly welcome
>> the help.
>
> happy to test it out, of course. Any patch available for the Ubuntu
> 10.04 version of mlmmj?

I doubt it, Florian. The changes have got into Mlmmj's version control,
but I don't expect they've got anywhere else yet (they haven't even made
it into an Mlmmj release yet).

Would you be able to download and compile it yourself? You'll need
Mercurial and general development stuff installed (compiler, C library
development headers, GNU autotools), but it should be pretty easy. It
should go something like this (it will create a directory mlmmj in the
current directory):

$ hg clone http://mlmmj.org/mlmmj
$ cd mlmmj
$ autoreconf -if
$ ./configure
$ make
$ make install

You might need/want to give a --prefix argument to configure.

And/or you might prefer to copy the binaries into place manually rather
than using make install, for added control.

The most likely thing to be different in your distro's Mlmmj package to
the official sources is the mlmmj-make-ml.sh script. You might like to
omit that from your installation.

Ben.





