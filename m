From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 17 May 2005 11:20:37 +0000
Subject: Re: Is possible change /etc/mlmmj location?
Message-Id: <20050517112037.GB74331@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <1116328716.13494.2.camel@zion>
In-Reply-To: <1116328716.13494.2.camel@zion>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Lupin3rd <lupin3rd@gmx.it> [May 17. 2005 13:17]:
> Hi,
> i use Debian and mlmmj debian package.
> I want to know if there is a way to change the location that mlmmj use
> for his config file... i don't want use /etc/mlmmj but i would use
> /usr/share/dtc/etc (in this way i can integrate mlmmj with the GPL
> panle DTC, and DTC can write mlmmj config files).

Isn't the way it's done on Debian just a matter of symlinks in the list
directory, so just changing those symlinks should suffice?

I don't know for sure, the Debian maintainer will know for sure.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
