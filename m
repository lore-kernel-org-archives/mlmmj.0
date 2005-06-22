From: Marcus Rueckert <mrueckert@suse.de>
Date: Wed, 22 Jun 2005 09:12:30 +0000
Subject: Re: List creation in the perl-admin web interface
Message-Id: <200506221112.31226.mrueckert@suse.de>
List-Id: <mlmmj.mlmmj.org>
References: <86d5qekc0f.fsf@borg.borderworlds.dk>
In-Reply-To: <86d5qekc0f.fsf@borg.borderworlds.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wednesday, 22. June 2005 10:54, Christian Laursen wrote:
> There has been some talk about adding list creation functionality to
> the web interface.
>
> Most of the work involved in getting it to work consists of making
> mlmmj itself support list creation by preconfigured unprivileged
> users.
>
> It will probably require mlmmj-make-ml to be a suid root binary,
> preferably only installed suid root if enabled by an option to the
> configure script or similar.

It does not have to be suid root. it could be suid mailinglist/maildrop group.
and the group has write permissions to the mailinglist basedir.

> Since the unprivileged user can't do any postprocessing on the created
> listdir there will have to be some support for running a custom script
> to do that. The custom script should also take care of adding an alias
> to the mail configuration.

you could use a special alias file which is writable by the group too. and 
include it into your mta config. Most distros do that with mailman e.g..

so long,

darix
