From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Wed, 25 Jun 2008 01:51:28 +0000
Subject: Re: New install
Message-Id: <4861A4A0.8010609@afdelingp.dk>
List-Id: <mlmmj.mlmmj.org>
References: <308082.1660.qm@web52410.mail.re2.yahoo.com>
In-Reply-To: <308082.1660.qm@web52410.mail.re2.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Kenny,

Kenny Patenaude wrote:
> Just wondering if there is an HOW-TO on setting up mlmmj?

Most of the basics are in the README file, and the more specific topics 
are in the README.* files. The list of options and the documentation for 
them is in the TUNABLES file.

> I am having problems figuring out the permissions
> for the list directories

The list directories should be owned by the user which the binaries are 
run as. It depends on your mail server. Usually it is "nobody" or 
something similar. Try setting up an alias which executes /usr/bin/id or 
similar to find out which user that is for your setup.

> and how to run the programs as root.

Well, don't run them as root. They should be run as a non-privileged 
user for security reasons.

I hope it helped you....

Best regards,
Morten

Totally off topic: Is there anybody from New York City on this list? Me 
and a couple of friends are looking for a place to celebrate 
Independence Day - more info at http://www.afdelingp.dk/fourth-of-july/

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
