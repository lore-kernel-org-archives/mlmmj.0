From: Thomas Goirand <thomas@goirand.fr>
Date: Tue, 08 Mar 2011 13:44:34 +0000
Subject: Re: [mlmmj] Fwd: Bug#617242: mlmmj-make-ml does not ensure correct
Message-Id: <4D7632C2.8010301@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <4D7513EB.7090407@goirand.fr>
In-Reply-To: <4D7513EB.7090407@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 03/08/2011 01:29 AM, Moritz Wilhelmy wrote:
> Hi,
> 
> With regard to mlmmj-make-ml.sh, I'd have some improvement ideas as well, one
> of them being a defaults-folder from which a control directory can be
> generated.

Do you mean like a template we would store in
/etc/mlmmj/default-list-config or something similar? That's a very good
idea indeed!

> I have in fact been working on this, but abandoned it because I
> assumed, nobody would care anyway.

I do, and I would even more if this resolves the Debian bug chmod issue.

> Any objections or other feature requests for mlmmj-make-ml? (Telling me this is
> a dumb idea is perfectly fine!)

Removing the .sh from the original distribution would be welcome: adding
.sh to a shell script is forbidden in Debian, and having different
naming schemes across various Unixes is an issue for a software that
uses MLMMJ and is cross-unix (but I already extensively discussed the
issue, others pointed out that for backward compatibility, MLMMJ should
create symlinks).

On 03/08/2011 08:11 AM, Ben Schmidt wrote:
> Yeah. mlmmj-make-ml could definitely do with some enhancements like
> this. When integrating with web interfaces, control files often need to
> have the group set and be group-writable to be accessible by the
> webserver, too. Or even be owned by the webserver user. I guess most of
> this is looked after by the administrator after running mlmmj-make-ml
> usually, but it would probably be good for mlmmj-make-ml to give a more
> sensible starting point.

DTC (my web hosting control panel) calls it from dtc / dtcgrp, and it
should stay like this.

> But what is most sensible?
>
> - chown to the list owner and chmod 0[67]00 and do nothing about groups?
> - chown to the list owner, chgrp to the mail system user, and chmod
> 0[67][67]0?

I think it's fine not to do chown (the calling user should own the
folders, and you aren't always calling it when being root, so chown wont
work), but it is important to do chmod.

> - prompt the user about it?

Please don't (unless something like --interactive-please is used, which
would be btw a good option)! :)

Thomas

