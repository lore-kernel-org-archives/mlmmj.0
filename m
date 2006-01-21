From: Charlie Brady <charlieb@budge.apana.org.au>
Date: Sat, 21 Jan 2006 19:23:20 +0000
Subject: Re: Treatment of Delivered-To headers (Re: mlmmj-recieve silently
Message-Id: <Pine.LNX.4.61.0601211420510.26660@e-smith.charlieb.ott.istop.com>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601202202460.6540@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601202202460.6540@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Sat, 21 Jan 2006, Mads Martin Joergensen wrote:

> Agreed it's a bit more difficult. I'm just pr. default cautious about
> reading environment variables :-)

Perhaps because many system designs are incautious about adding 
environment variables. SysV init is one such system. As soon as an admin 
does "/etc/rc.d/init.d/some_daemon restart" the new daemon is likely to 
have a different environment to the old.

See daemontools or runit for an alternative system for running daemons 
with consistent reliable environment variable setup.
