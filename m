From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 08 Mar 2011 00:11:53 +0000
Subject: Re: [mlmmj] Fwd: Bug#617242: mlmmj-make-ml does not ensure correct
Message-Id: <4D757449.7060505@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4D7513EB.7090407@goirand.fr>
In-Reply-To: <4D7513EB.7090407@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Yeah. mlmmj-make-ml could definitely do with some enhancements like this. When 
integrating with web interfaces, control files often need to have the group set 
and be group-writable to be accessible by the webserver, too. Or even be owned by 
the webserver user. I guess most of this is looked after by the administrator 
after running mlmmj-make-ml usually, but it would probably be good for 
mlmmj-make-ml to give a more sensible starting point.

But what is most sensible?

- chown to the list owner and chmod 0[67]00 and do nothing about groups?
- chown to the list owner, chgrp to the mail system user, and chmod 0[67][67]0?
- something else?
- prompt the user about it?

Ben.



On 8/03/11 4:20 AM, Thomas Goirand wrote:
> Someone sent this against the MLMMJ package in Debian. I found it a very
> valid request. I think either mlmmj-make-ml should set the umask
> explicitly, or even better, perform some chmods.
>
> Thomas
>
> -------- Original Message --------
> Subject: Bug#617242: mlmmj-make-ml does not ensure correct permissions
> for created files and directories
> Resent-Date: Mon, 07 Mar 2011 13:21:02 +0000,	Mon, 07 Mar 2011 13:21:05
> +0000
> Resent-From: Reuben Thomas<rrt@sc3d.org>
> Resent-To: debian-bugs-dist@lists.debian.org
> Resent-CC: MLMMJ packaging team<pkg-mlmmj-devel@lists.alioth.debian.org>
> Date: Mon, 07 Mar 2011 13:16:46 +0000
> From: Reuben Thomas<rrt@sc3d.org>
> Reply-To: Reuben Thomas<rrt@sc3d.org>, 617242@bugs.debian.org
> To: Debian Bug Tracking System<submit@bugs.debian.org>
>
> Package: mlmmj
> Version: 1.2.17-1
> Severity: minor
>
>
> I have my umask set to 0027. If I run mlmmj-make-ml with sudo, then
> this umask is inherited, and used to create all the files and
> directories for a new mailing list, which is wrong. The files and
> directories should be explicitly chmodded to the correct permissions.
>
>
>
>

