From: Morten Shearman Kirkegaard <mopo@fabletech.com>
Date: Sun, 10 Jan 2010 14:13:08 +0000
Subject: Re: [Fwd: Bug#564557: mlmmj-php-web-admin: class.FastTemplate.php
Message-Id: <1263132788.5330.149.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <4B4993D6.5050103@goirand.fr>
In-Reply-To: <4B4993D6.5050103@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sun, 2010-01-10 at 12:15 +0000, thomas@goirand.fr wrote:
> > in openSUSE we use a patch to replace class.FastTemplate.php with
> > class.rFastTemplate.php. Feel free to use attached patch to fix this
> > issue.

Thanks Christoph, I've committed it.

> It would be very nice if the upstream version could be changed so that
> MLMMJ v1.17 was released totaly free

Just for the record: mlmmj itself is released under The MIT License,
which is considered a "free license" by most people. The various
contributed projects are licensed under whatever license their authors
chose.

> and both Debian and suse wouldn't have to modify the upstraem sources!
> Can someone commit it?

I've committed it, and rolled a new RC. It is available for download
here:

http://mlmmj.mmj.dk/files/mlmmj-1.2.17-RC2.tar.bz2
4dd7b6c12675d21478b88b515e70ef5c

http://mlmmj.mmj.dk/files/mlmmj-1.2.17-RC2.tar.gz
dcffd02b98d563409bd404bfbcd33d99

I don't like to roll a new RC when there are no known bugs in the old
one, so I expect one thing in return: testing. Please test it. Please,
please test it. Does it build on all platforms? Does it work as
advertised?

Happy testing,
Morten

-- 
Morten Shearman Kirkegaard <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/


