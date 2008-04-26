From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sat, 26 Apr 2008 20:52:59 +0000
Subject: Re: "All mlmmj binaries have to be invoked with full path"
Message-Id: <20080426205259.GK7446@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Vegard Svanberg <vegard@svanberg.no> [Apr 26. 2008 22:30]:
> $ mlmmj-sub 
> All mlmmj binaries have to be invoked with full path,
> e.g. /usr/bin/mlmmj-sub
> 
> What's the point? :)

The point is that we don't want to parse any environment variables for
path etc., since this is a potential security problem. By invoking with
full path, you give the path to the other binaries needed to run the
list. When mlmmj-sub subscribes it has the possibility to send
confirmation mails etc., and must thus know where to find the
mlmmj-send.

This also means you need to have all mlmmj binaries in the same
directory.

Another advantage is when upgrading etc. you can have several installs,
e.g /usr/local/mlmmj-1.2.13/bin/mlmmj-* and
/usr/local/mlmmj-1.2.14/bin/mlmmj-* which will work perfectly fine.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
