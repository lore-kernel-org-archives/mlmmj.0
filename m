From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 22 Jun 2005 09:15:49 +0000
Subject: Re: List creation in the perl-admin web interface
Message-Id: <20050622091549.GW27543@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <86d5qekc0f.fsf@borg.borderworlds.dk>
In-Reply-To: <86d5qekc0f.fsf@borg.borderworlds.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Marcus Rueckert <mrueckert@suse.de> [Jun 22. 2005 11:12]:
> > There has been some talk about adding list creation functionality to
> > the web interface.
> >
> > Most of the work involved in getting it to work consists of making
> > mlmmj itself support list creation by preconfigured unprivileged
> > users.
> >
> > It will probably require mlmmj-make-ml to be a suid root binary,
> > preferably only installed suid root if enabled by an option to the
> > configure script or similar.
> 
> It does not have to be suid root. it could be suid mailinglist/maildrop group.
> and the group has write permissions to the mailinglist basedir.

Well, the very first thing I'm going to do in the binary anyway is that
in case we're root, priviledges will be dropped by changing uid to the
user owning the directory the mailinglist will be created in. This way,
it doesn't matter that every OS out there has a different user for the
mailserver--it'll simply Just Work. Of course they're only going to be
dropped in case we _are_ root.

Just the same way mlmmj-{,un}sub does it.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
