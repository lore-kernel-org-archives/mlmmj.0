From: Christian Laursen <xi@borderworlds.dk>
Date: Wed, 22 Jun 2005 09:43:21 +0000
Subject: Re: List creation in the perl-admin web interface
Message-Id: <864qbqk9qe.fsf@borg.borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
References: <86d5qekc0f.fsf@borg.borderworlds.dk>
In-Reply-To: <86d5qekc0f.fsf@borg.borderworlds.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Marcus Rueckert <mrueckert@suse.de> writes:

> On Wednesday, 22. June 2005 10:54, Christian Laursen wrote:
>
> > It will probably require mlmmj-make-ml to be a suid root binary,
> > preferably only installed suid root if enabled by an option to the
> > configure script or similar.
> 
> It does not have to be suid root. it could be suid mailinglist/maildrop group.
> and the group has write permissions to the mailinglist basedir.

Currently our configuration has control owned by the www user and the
rest of the listdir owned by mlmmj. However I think control could be
owned by mlmmj too if it is made group writable.

> > Since the unprivileged user can't do any postprocessing on the created
> > listdir there will have to be some support for running a custom script
> > to do that. The custom script should also take care of adding an alias
> > to the mail configuration.
> 
> you could use a special alias file which is writable by the group too. and 
> include it into your mta config. Most distros do that with mailman e.g..

Sure, but can you do it in a way that is general enough to satisfy all
setups? Furthermore we have to be careful not to break old
installations too much.

-- 
Christian Laursen
